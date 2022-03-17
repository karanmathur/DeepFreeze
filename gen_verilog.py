#!/usr/bin/env python

"""
Author: Patrick Hansen
Project: FixyNN
Contains FixyVerilogGenerator class definition
"""

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import argparse
import numpy as np
import scipy.signal
import math
import os

from graph import *
from template_reader import *

MODULES_DIRECTORY = os.path.join(os.path.dirname(__file__), "modules/")

#use_dsp=1

def saturate(x, nint, nfrac):
	"""Clip a value to the range of representable fixed-point values"""
	nbits = nint + nfrac
	max_val = (2 ** (nbits - 1) - 1) / float(2 ** nfrac)
	min_val = - (2 ** (nbits - 1)) / float(2 ** nfrac)
	x_sat = np.clip(x, min_val, max_val)
	return x_sat

def float_to_fixed(x, nint, nfrac):
	"""Map a floating-point number to the nearest fixed-point number"""
	x_sat = saturate(x, nint, nfrac)
	x_fixed = int(round(x * (2 ** nfrac)))
	return x_fixed

class VerilogGenerator():
	
	def __init__(self, name, data_format, output_dir,rom_init_filepath, input_layer, output_layer):
		self.name = name
		self.output_dir = output_dir
		self.rom_init_filepath = rom_init_filepath
	
		self.a_nint = data_format["a_nint"]
		self.w_nint = data_format["w_nint"]
		self.b_nint = data_format["b_nint"]
		self.a_nfrac = data_format["a_nfrac"]
		self.w_nfrac = data_format["w_nfrac"]
		self.b_nfrac = data_format["b_nfrac"]
		self.a_nbits = self.a_nint + self.a_nfrac
		self.w_nbits = self.w_nint + self.w_nfrac
		self.b_nbits = self.b_nint + self.b_nfrac
		self.accumulator_nbits = 32
	
		if input_layer.op_type in LAYER_TYPES_2D:
			num_input_fmaps = input_layer.input_shapes[0][-1]
			num_inputs_per_fmap = np.prod(input_layer.kernel_size)
			num_inputs = num_input_fmaps
		else:
			num_inputs = input_layer.input_shapes[0][-1]
		num_outputs = output_layer.output_shape[-1]
		self.num_input_bits = num_inputs * self.a_nbits
		self.num_output_bits = num_outputs * self.a_nbits
		self.input_image_width = input_layer.input_shapes[0][2]
	
		self.modules = []
		self.num_layers = 0
	
		# Names of current signals
		self.layer_act_signal_name = None
		self.main_act_signal_name = None
		self.main_valid_signal_name = None
	
		self.main_module_filepath = os.path.join(self.output_dir, "top.sv")
		self.__gen_main_module_header()
	
	def __gen_layer_module_header(self, f, module_name, num_inputs, num_input_fmaps, num_outputs, pointwise_flag):
		variable_map = [
			("MODULE_NAME", module_name),
			("INPUT_ACT_NBITS", num_inputs * self.a_nbits),
			("NUM_INPUT_FMAPS", num_input_fmaps),
			("OUTPUT_ACT_NBITS", num_outputs * self.a_nbits),
		]
		if pointwise_flag==0:
			lines = read_and_fill_template(LAYER_MODULE_HEADER_TEMPLATE, variable_map)
		else:
			
			lines = read_and_fill_template(PW_LAYER_MODULE_HEADER_TEMPLATE, variable_map)
		f.writelines(lines)
		self.layer_act_signal_name = "input_act_ff"
		
	def __gen_input_fmap_signals(self, f, num_input_fmaps, num_inputs_per_fmap,pointwise_flag):
		"""Write verilog to create feature map signals for 2D layers"""
		num_bits_per_input_fmap = num_inputs_per_fmap * self.a_nbits
	
		for cur_input_fmap in range(num_input_fmaps):
			input_fmap_name = "input_fmap_%d" % cur_input_fmap
			input_act_idx_low = num_bits_per_input_fmap * cur_input_fmap
			input_act_idx_high = input_act_idx_low + num_bits_per_input_fmap
			f.write("logic [%d:0] %s;\n" % (num_bits_per_input_fmap-1, input_fmap_name))
			if pointwise_flag==0:
				f.write("assign %s = %s[%d:%d];\n" % (input_fmap_name, self.layer_act_signal_name,input_act_idx_high-1, input_act_idx_low))
			else:
				f.write("assign %s = %s[%d:%d];\n" % (input_fmap_name, self.layer_act_signal_name,
												input_act_idx_high-1, input_act_idx_low))
		f.write("\n")
	
		self.layer_act_signal_name = "input_fmap"
	
	def __gen_dense_mac_array(self, f, weights):
		"""Write verilog to create an array of MAC units for a dense layer"""
		num_inputs = weights.shape[0]
		num_outputs = weights.shape[1]
	
		for cur_output in range(num_outputs):
			output_name = "dense_mac_{}".format(cur_output)
			f.write("logic signed [%d:0] %s;\n" % (self.accumulator_nbits-1, output_name))
			f.write("assign %s = \n" % output_name)
			assigned = False
			for cur_input in range(num_inputs):
				weight = float_to_fixed(weights[cur_input, cur_output],
							self.w_nint, self.w_nfrac)
				if weight == 0:
					continue
				elif weight < 0:
					sign = "-"
				else:
					sign = " "
				weight_nbits = abs(weight).bit_length() + 1
				input_act_idx_low = cur_input * self.a_nbits
				input_act_idx_high = input_act_idx_low + self.a_nbits
				f.write("\t%s%d'sd %d * $signed(%s[%d:%d]) +\n" % (
						sign, weight_nbits, abs(weight), self.layer_act_signal_name, 
						input_act_idx_high-1, input_act_idx_low))
				assigned = True
			f.seek(-3, 1) # Format end of mac
			if not assigned:
				f.write("= %d'sd 0" % self.accumulator_nbits)
			f.write(";\n\n")
		self.layer_act_signal_name = "dense_mac"
	
	def __gen_conv_2d_mac_array(self, f, name, weights, gen_adder_tree, bram_mult, adder_pipeline, use_dsp):
		"""Write verilog to implement a traditional convolution
		   Supports adder tree and pipelining
		   Supports multipliers using BRAM  """
		num_rows = weights.shape[0]
		num_cols = weights.shape[1]
		num_fmaps = weights.shape[2]
		num_outputs = weights.shape[3]
		#input_name_array = [] 
		#fmap_idx_low_array = []
		#fmap_idx_high_array = []
		for cur_output in range(num_outputs):
			for cur_fmap in range(num_fmaps):
				input_name = "%s_%d" % (self.layer_act_signal_name, cur_fmap)
				for cur_row in range(num_rows):
					for cur_col in range(num_cols):
						weight = float_to_fixed(
								weights[cur_row, cur_col, cur_fmap, cur_output],
								self.w_nint, self.w_nfrac) # TODO: clean
						if weight == 0:
							continue
						elif weight < 0:
							sign = "-"
						else:
							sign = " "
						partial_product = "O" +str(cur_output)+ "_I" +str(cur_fmap)+ "_R" +str(cur_row)+ "_C" +str(cur_col)+ "_SM1 "
						if bram_mult:
							weight_nbits = abs(weight).bit_length() + 1
							partial_product = "O" +str(cur_output)+ "_I" +str(cur_fmap)+ "_R" +str(cur_row)+ "_C" +str(cur_col)+ "_SM1 "
							rom_name = name+ "_O" +str(cur_output)+ "_I" +str(cur_fmap)+ "_R" +str(cur_row)+ "_C" +str(cur_col) +str(int(abs(weight)))+ "_rom"
							rom_dir_name = os.path.join(self.rom_init_filepath, rom_name + ".mif")
							ROM_comment =  "ROM of output fmap" +str(cur_output)+ " wt value is " +str(int(abs(weight)))
							ROM_width = self.a_nbits + weight_nbits
							ROM_words = 2**self.a_nbits
							
							variable_map = [
									("COMMENT", ROM_comment),
									("ROM_WIDTH", str(int(ROM_width))),
									("ROM_DEPTH", str(int(ROM_words)))
									]
							lines = read_and_fill_template(MIF_TEMPLATE, variable_map)
							with open(rom_dir_name, "w") as f_rom:
								for ifbw in xrange (0,2**self.a_nbits):
									if(ifbw>=2**(self.a_nbits-1)): # negative activations
										neg_ifbw = -(2**self.a_nbits) + ifbw
										lines += str(ifbw)+ "\t:\t" + str(int(weight* neg_ifbw)) + ";\n" 
									else:# psoitive activations
										neg_ifbw = ifbw
										lines += str(ifbw)+ "\t:\t" + str(int(weight* neg_ifbw)) + ";\n" 
								lines += "END;"
								f_rom.writelines(lines)
								lines = ""
								f_rom.close()
							fmap_idx_low = (cur_row*num_cols + cur_col) * self.a_nbits
							fmap_idx_high = fmap_idx_low + self.a_nbits
							variable_map = [
								("Q_NAME", partial_product),
								("ROM_DW", ROM_width),
								("INIT_FILE_NAME", rom_dir_name),
								("ROM_WORDS", ROM_words),
								("ROM_AW", str(int(math.log(ROM_words, 2)))),
								("INST_NAME", rom_name+"_inst"),
								("RD_ADDR", input_name + "[" + str(int(fmap_idx_high-1)) + ":" + str(int(fmap_idx_low)) +"]")
								]
							lines = read_and_fill_template(ROM_INST_TEMPLATE, variable_map)
							f.writelines(lines)
						else:
							weight_nbits = abs(weight).bit_length() + 1
							fmap_idx_low = (cur_row*num_cols + cur_col) * self.a_nbits
							fmap_idx_high = fmap_idx_low + self.a_nbits
							out_value = "(" + sign + str(int(weight_nbits)) + "'sd" + str(int(abs(weight))) + ")"
							out_value += " * "
							out_value += "$signed(" + input_name + "[" + str(int(fmap_idx_high-1)) + ":" + str(int(fmap_idx_low)) +"])"
							lines = "logic signed ["+ str(int(self.accumulator_nbits-1))+":0]" + partial_product + ";"
							
							if use_dsp == 0:
								lines = lines + "  assign " + partial_product + " = " + out_value + ";\n"								
								f.writelines(lines)
							else:
								pass 
								#f.writelines(lines)
								#input_name_array.append(input_name) #this is the input_fmap being mult with weight
								#fmap_idx_low_array.append(fmap_idx_low)
								#fmap_idx_high_array.append(fmap_idx_high)

		num_delay = 1 # delay for ready and valid signal is by default one
		for cur_output in range(num_outputs):
			tree_adder_variables = []
			input_name_array = []
			fmap_idx_low_array = []
			fmap_idx_high_array = []
			weightage = [] # array of the weights (absolute)
			weight_sign = [] # array of the sign of weights 
			weight_no_of_bits = [] # array of no. of bits of the weights 
			output_name = "conv_mac_%s" % cur_output
			f.write("logic signed [%d:0] %s;\n" % (self.accumulator_nbits-1, output_name))
			if gen_adder_tree==0:
				f.write("assign %s = \n" % output_name)
			assigned = False
			for cur_fmap in range(num_fmaps):
				input_name = "%s_%d" % (self.layer_act_signal_name, cur_fmap)
				for cur_row in range(num_rows):
					for cur_col in range(num_cols):
						weight = float_to_fixed(
								weights[cur_row, cur_col, cur_fmap, cur_output],
								self.w_nint, self.w_nfrac) # TODO: clean
						if weight == 0:
							continue
						elif weight < 0:
							sign = "-"
						else:
							sign = " "
						weight_nbits = abs(weight).bit_length() + 1
						fmap_idx_low = (cur_row*num_cols + cur_col) * self.a_nbits
						fmap_idx_high = fmap_idx_low + self.a_nbits
						partial_product = "+O" +str(cur_output)+ "_I" +str(cur_fmap)+ "_R" +str(cur_row)+ "_C" +str(cur_col)+ "_SM1 "
						
						if gen_adder_tree:
							tree_adder_variables.append(partial_product)
							input_name_array.append(input_name)
							fmap_idx_low_array.append(fmap_idx_low)
							fmap_idx_high_array.append(fmap_idx_high)
							weightage.append(abs(weight))
							weight_sign.append(sign)
							weight_no_of_bits.append(weight_nbits)
						else:
							f.write(partial_product)
						assigned = True
			if gen_adder_tree:
				if len(tree_adder_variables) == 0:
					f.writelines("assign conv_mac_"+str(cur_output)+" = "+str(int(self.accumulator_nbits))+"'sd 0")
					delay_stages = 1
					assigned = True
				else:
					tree_adder_var_name = "O"+str(cur_output)
					tree_adder_out,delay_stages = self.generate_tree_adder (f, tree_adder_variables, tree_adder_var_name, input_name_array, weightage, weight_sign, weight_no_of_bits, use_dsp, fmap_idx_low_array, fmap_idx_high_array, self.accumulator_nbits, adder_pipeline,)
					f.writelines("assign conv_mac_"+str(cur_output)+" = " + tree_adder_out)
					assigned = True
				if num_delay < delay_stages: # find max delay of the layer
					num_delay = delay_stages
			if not assigned:
				f.write("= %d'sd 0" % self.accumulator_nbits)
			f.write(";\n\n")
		if bram_mult:
			num_delay = num_delay + 1 # additional delay for bram read
		self.generate_valid_ready_delay (f,num_delay)
		self.layer_act_signal_name = "conv_mac"
		
	def __gen_depthwise_conv_2d_mac_array(self, f, name, weights, gen_adder_tree, bram_mult, adder_pipeline, use_dsp):
		"""Write verilog to implement a depthwise convolution"""
		num_rows = weights.shape[0]
		num_cols = weights.shape[1]
		num_fmaps = weights.shape[2]
		#input_name_array = []
		#fmap_idx_low_array = []
		#fmap_idx_high_array = []
		for cur_fmap in range(num_fmaps):
			input_name = "%s_%d" % (self.layer_act_signal_name, cur_fmap)
			for cur_row in range(num_rows):
				for cur_col in range(num_cols):
							  
					weight = float_to_fixed(weights[cur_row, cur_col, cur_fmap],
							self.w_nint, self.w_nfrac)
					if weight == 0:
						continue
					elif weight < 0:
						sign = "-"
					else:
						sign = " "
					partial_product = "O" +str(cur_fmap)+ "_I" +str(cur_fmap)+ "_R" +str(cur_row)+ "_C" +str(cur_col)+ "_SM1 "
					if bram_mult:
						weight_nbits = abs(weight).bit_length() + 1
						partial_product = "O" +str(cur_fmap)+ "_I" +str(cur_fmap)+ "_R" +str(cur_row)+ "_C" +str(cur_col)+ "_SM1 "
						rom_name = name+ "_O" +str(cur_fmap)+ "_I" +str(cur_fmap)+ "_R" +str(cur_row)+ "_C" +str(cur_col) +str(int(abs(weight)))+ "_rom"
						rom_dir_name = os.path.join(self.rom_init_filepath, rom_name + ".mif")
						ROM_comment =  "ROM of output fmap" +str(cur_fmap)+ " wt value is " +str(int(abs(weight)))
						ROM_width = self.a_nbits + weight_nbits
						ROM_words = 2**self.a_nbits
						
						variable_map = [
								("COMMENT", ROM_comment),
								("ROM_WIDTH", str(int(ROM_width))),
								("ROM_DEPTH", str(int(ROM_words)))
								]
						lines = read_and_fill_template(MIF_TEMPLATE, variable_map)
						with open(rom_dir_name, "w") as f_rom:
							for ifbw in xrange (0,2**self.a_nbits):
								if(ifbw>=2**(self.a_nbits-1)): # negative activations
									neg_ifbw = -(2**self.a_nbits) + ifbw
									lines += str(ifbw)+ "\t:\t" + str(int(weight* neg_ifbw)) + ";\n" 
								else:# psoitive activations
									neg_ifbw = ifbw
									lines += str(ifbw)+ "\t:\t" + str(int(weight* neg_ifbw)) + ";\n" 
							lines += "END;"
							f_rom.writelines(lines)
							lines = ""
							f_rom.close()
						fmap_idx_low = (cur_row*num_cols + cur_col) * self.a_nbits
						fmap_idx_high = fmap_idx_low + self.a_nbits
						variable_map = [
							("Q_NAME", partial_product),
							("ROM_DW", ROM_width),
							("INIT_FILE_NAME", rom_dir_name),
							("ROM_WORDS", ROM_words),
							("ROM_AW", str(int(math.log(ROM_words, 2)))),
							("INST_NAME", rom_name+"_inst"),
							("RD_ADDR", input_name + "[" + str(int(fmap_idx_high-1)) + ":" + str(int(fmap_idx_low)) +"]")
							]
						lines = read_and_fill_template(ROM_INST_TEMPLATE, variable_map)
						f.writelines(lines)
					else:
						weight_nbits = abs(weight).bit_length() + 1
						fmap_idx_low = (cur_row*num_cols + cur_col) * self.a_nbits
						fmap_idx_high = fmap_idx_low + self.a_nbits
						out_value = "(" + sign + str(int(weight_nbits)) + "'sd" + str(int(abs(weight))) + ")"
						out_value += " * "
						out_value += "$signed(" + input_name + "[" + str(int(fmap_idx_high-1)) + ":" + str(int(fmap_idx_low)) +"])"
						lines = "logic signed ["+ str(int(self.accumulator_nbits-1))+":0]" + partial_product + ";"
						if use_dsp ==0:
							lines = lines + "  assign " + partial_product + " = " + out_value + ";\n"
							f.writelines(lines)
						else:
							pass 
							# f.writelines(lines)
							#input_name_array.append(input_name) #this is the input_fmap being mult with weight
							#fmap_idx_low_array.append(fmap_idx_low)
							#fmap_idx_high_array.append(fmap_idx_high)
		
		num_delay = 1 # delay for ready and valid signal is by default one
		
		for cur_fmap in range(num_fmaps):
			tree_adder_variables = []
			input_name_array = []
			fmap_idx_low_array = []
			fmap_idx_high_array = []
			weightage = [] # array of the weights (absolute)
			weight_sign = [] # array of the sign of weights 
			weight_no_of_bits = [] # array of no. of bits of the weights
			output_name = "conv_mac_%s" % cur_fmap
			f.write("logic signed [%d:0] %s;\n" % (self.accumulator_nbits-1, output_name))
			if gen_adder_tree==0:
				f.write("assign %s = \n" % output_name)
			assigned = False
			input_name = "%s_%d" % (self.layer_act_signal_name, cur_fmap)
			
			for cur_row in range(num_rows):
				for cur_col in range(num_cols):
					weight = float_to_fixed(weights[cur_row, cur_col, cur_fmap],
							self.w_nint, self.w_nfrac)
					if weight == 0:
						continue
					elif weight < 0:
						sign = "-"
					else:
						sign = " "
					weight_nbits = abs(weight).bit_length() + 1
					fmap_idx_low = (cur_row*num_cols + cur_col) * self.a_nbits
					fmap_idx_high = fmap_idx_low + self.a_nbits
					partial_product = "+O" +str(cur_fmap)+ "_I" +str(cur_fmap)+ "_R" +str(cur_row)+ "_C" +str(cur_col)+ "_SM1 "
	  
					if gen_adder_tree:
						tree_adder_variables.append(partial_product)
						input_name_array.append(input_name) #this is the input_fmap being mult with weight
						fmap_idx_low_array.append(fmap_idx_low)
						fmap_idx_high_array.append(fmap_idx_high)
						weightage.append(abs(weight))
						weight_sign.append(sign)
						weight_no_of_bits.append(weight_nbits)
					else:
						f.write(partial_product)
					assigned = True
			
			if gen_adder_tree:
				if len(tree_adder_variables) == 0:
					f.writelines("assign conv_mac_"+str(cur_fmap)+" = "+str(int(self.accumulator_nbits))+"'sd 0")
					delay_stages = 1
					assigned = True
				else:
					tree_adder_var_name = "O"+str(cur_fmap)
					tree_adder_out,delay_stages = self.generate_tree_adder (f, tree_adder_variables, tree_adder_var_name, input_name_array, weightage, weight_sign, weight_no_of_bits, use_dsp, fmap_idx_low_array, fmap_idx_high_array, self.accumulator_nbits, adder_pipeline,)
					f.writelines("assign conv_mac_"+str(cur_fmap)+" = " + tree_adder_out)
					assigned = True
				
				if num_delay < delay_stages: # find max delay of the layer
					num_delay = delay_stages
			
			if not assigned:
				f.write("= %d'sd 0" % self.accumulator_nbits)
			f.write(";\n\n")
		
		if bram_mult:
			num_delay = num_delay + 1 # additional delay for bram read
		self.generate_valid_ready_delay (f,num_delay)
		self.layer_act_signal_name = "conv_mac"
		
		
	def __gen_bias_add_array(self, f, biases):
		"""Generate an array of bias additions for a layer module"""
		num_outputs = biases.shape[0]
	
		for cur_output in range(num_outputs):
			input_name = "%s_%d" % (self.layer_act_signal_name, cur_output)
			output_name = "bias_add_%d" % cur_output
			f.write("logic [%d:0] %s;\n" % (self.accumulator_nbits-1, output_name))
			f.write("assign %s = %s" % (output_name, input_name))
			bias = float_to_fixed(biases[cur_output], self.b_nint, self.b_nfrac) 
					# * (1 << self.a_nfrac) # shreyas removed this during verification
			bias_nbits = abs(bias).bit_length() + 1
			if bias == 0:
				f.write(";\n")
			elif bias < 0:
				f.write(" - %d'd%d;\n" % (bias_nbits, abs(bias)))
			else:
				f.write(" + %d'd%d;\n" % (bias_nbits, abs(bias)))
		f.write("\n")
	
		self.layer_act_signal_name = "bias_add"
	
	def __gen_batch_norm_array():
		pass # TODO
	
	def __gen_relu_array(self, f, num_outputs):
		"""Generate an array of ReLU operations for a layer module"""
		input_idx_low = self.w_nfrac
		input_idx_high = input_idx_low + self.a_nbits - 1
	
		for cur_output in range(num_outputs):
			input_name = "%s_%d" % (self.layer_act_signal_name, cur_output)
			output_name = "relu_%d" % (cur_output)
			f.write("logic [%d:0] %s;\n" % (self.a_nbits-1, output_name))
			f.write("assign %s[%d:0] = (%s[%d]==0) ? {{%s[%d],%s[%d:%d]}} : '0;\n" % (
					output_name, self.a_nbits-1,
					input_name, self.accumulator_nbits-1,
					input_name, self.accumulator_nbits-1,
					input_name, input_idx_high-1, input_idx_low))
		f.write("\n")
	
		self.layer_act_signal_name = "relu"
	
	def __gen_relu6_array(self, f, num_outputs):
		"""Generate an array of ReLU6 operations for a layer module"""
		input_idx_low = self.w_nfrac
		input_idx_high = input_idx_low + self.a_nbits - 1
		
		for cur_output in range(num_outputs):
			input_name = "%s_%d" % (self.layer_act_signal_name, cur_output)
			output_name = "relu_%d" % (cur_output)
			f.write("logic [%d:0] %s;\n" % (self.a_nbits-1, output_name))
			f.write("assign %s[%d:0] = (%s[%d]==0) ? ((%s<3'd6) ? {{%s[%d],%s[%d:%d]}} :'d6) : '0;\n" % (
					output_name, self.a_nbits-1,
					input_name, self.accumulator_nbits-1,
					input_name,
					input_name, self.accumulator_nbits-1,
					input_name, input_idx_high-1, input_idx_low))
		f.write("\n")
		
		self.layer_act_signal_name = "relu"				   
		
	def __gen_layer_module_output(self, f, num_outputs):
		"""Write verilog to generate the output signal for a layer module"""
		f.write("assign output_act = {\n")
		for cur_output in reversed(range(num_outputs)):
			input_name = "%s_%d" % (self.layer_act_signal_name, cur_output)
			f.write("\t%s,\n" % (input_name))
		f.seek(-2, 1)
		f.write("\n};\n\n")
		f.write("endmodule\n")
	
	def __gen_main_module_header(self):
		"""Write verilog to generate the main module top interface"""
		variable_map = [
			#("MODULE_NAME", self.name),
			("MODULE_NAME", "top"),
			("INPUT_ACT_NBITS", self.num_input_bits),
			("OUTPUT_ACT_NBITS", self.num_output_bits),
		]
		lines = read_and_fill_template(MAIN_MODULE_HEADER_TEMPLATE, variable_map)
		with open(self.main_module_filepath, "w") as f:
			f.writelines(lines)        
		self.main_act_signal_name = "input_act_ff"
		self.main_valid_signal_name = "valid_ff"
	
	def __gen_main_module_output_signals(self):
		"""Write verilog to generate output flops for the main module"""
		variable_map = [
			("OUTPUT_ACT_NAME", self.main_act_signal_name),
			("OUTPUT_VALID_NAME", self.main_valid_signal_name),
		]
		lines = read_and_fill_template(MAIN_MODULE_OUTPUT_TEMPLATE, variable_map)
		with open(self.main_module_filepath, "a") as f:
			f.writelines(lines)        
	
	def __gen_buffer_instance(self, layer):
		"""Creates the buffer instance in top.sv
		 Note: buffer instance is not create when there is pointwise convolutions
		 Update: Now SRAM and line buffer utilization is even more optimized
		"""
		num_input_fmaps = layer.input_shapes[0][-1]
		num_inputs_per_fmap = np.prod(layer.kernel_size)
		# num_inputs = num_input_fmaps * num_inputs_per_fmap
		num_inputs = 1 * num_inputs_per_fmap
		output_act_name = "%s_buf_act" % layer.name
		output_valid_name = "%s_buf_valid" % layer.name
		if (layer.padding == 'SAME'):
			PAD = (layer.kernel_size[0] - 1)/2.0
		else:
			PAD = 0
		variable_map = [
			("MODULE_NAME", layer.name),
			("INPUT_VALID_NAME", self.main_valid_signal_name),
			("INPUT_ACT_NAME", self.main_act_signal_name),
			("OUTPUT_VALID_NAME", output_valid_name),
			("OUTPUT_ACT_NAME", output_act_name),
			("OUTPUT_ACT_NBITS", num_inputs * self.a_nbits),
			("KERNEL_SIZE", layer.kernel_size[0]),
			("ACT_NBITS", self.a_nbits),
			("NUM_INPUT_FMAPS", layer.input_shapes[0][-1]),
			("STRIDES", layer.strides[0]),
			("PADS", int(PAD)),
			("NUM_WORDS", layer.input_shapes[0][1]),
			("ADDRESS_WIDTH", layer.input_shapes[0][1].bit_length())
		]
		lines = read_and_fill_template(BUFFER_INSTANCE_TEMPLATE, variable_map)
		with open(self.main_module_filepath, "a") as f:
			if (layer.kernel_size[0]!=1): # buffer is not needed for pointwise convolutions
				f.writelines(lines)
			else:
				lines[1] = '\nlogic  [' + str(num_input_fmaps * num_inputs_per_fmap* self.a_nbits) +'-1:0]'+ output_act_name+ ';'
				lines_pw_conv = lines[0] + lines[1] + '\nassign ' + output_act_name + ' = ' + self.main_act_signal_name + ';\n' + 'assign ' + output_valid_name + ' = ' + self.main_valid_signal_name + ' ;\n\n'
				f.writelines(lines_pw_conv)
		self.main_act_signal_name = output_act_name
		self.main_valid_signal_name = output_valid_name
	
	def __gen_layer_instance(self, layer):
		'''generates conv,pool, fc layer instance in top.sv'''
		output_act_name = "%s_act" % layer.name
		output_valid_name = "%s_valid" % layer.name 
		variable_map = [
			("MODULE_NAME", layer.name),
			("INPUT_ACT_NAME", self.main_act_signal_name),
			("INPUT_VALID_NAME", self.main_valid_signal_name),
			("OUTPUT_ACT_NAME", output_act_name),
			("OUTPUT_VALID_NAME", output_valid_name),
			("OUTPUT_ACT_NBITS", layer.output_shape[-1] * self.a_nbits)
		]
		if layer.op_type in LAYER_TYPES_TRAINABLE:
			lines = read_and_fill_template(TRAINABLE_LAYER_INSTANCE_TEMPLATE, variable_map)
		elif layer.op_type in LAYER_TYPES_POOL:
			variable_map += [
				("OP_TYPE", layer.op_type),
				("ACT_NBITS", self.a_nbits),
				("NUM_INPUT_FMAPS", layer.input_shapes[0][-1]),
				("KERNEL_SIZE", layer.kernel_size[0])
			]
			lines = read_and_fill_template(POOLING_LAYER_INSTANCE_TEMPLATE, variable_map)
		elif layer.op_type == FLATTEN:
			lines = [""]
			pass # TODO
	
		with open(self.main_module_filepath, "a") as f:
			f.writelines(lines)
		self.main_act_signal_name = output_act_name
		self.main_valid_signal_name = output_valid_name
	
	def __gen_layer_module(self, layer):
		'''generates fixy verilog for each layer (eg. conv, pool, fc)'''
		if layer.op_type in LAYER_TYPES_2D:
			num_input_fmaps = layer.input_shapes[0][-1]
			num_inputs_per_fmap = np.prod(layer.kernel_size)
			# num_inputs = num_input_fmaps * num_inputs_per_fmap
			num_inputs = 1 * num_inputs_per_fmap
		else:
			num_inputs = layer.input_shapes[0][-1]
		if (layer.kernel_size[0]==1):
			num_inputs = num_input_fmaps * num_inputs_per_fmap
			num_input_fmaps = 1

		num_outputs = layer.output_shape[-1]
		module_filepath = os.path.join(self.output_dir, "%s.sv" % layer.name)
		with open(module_filepath, "w") as f:
			pointwise_flag = layer.kernel_size[0]==1
			self.__gen_layer_module_header(f, layer.name, num_inputs,num_input_fmaps, num_outputs, pointwise_flag)
	
			if layer.op_type in LAYER_TYPES_2D:
				# pointwise_flag = layer.kernel_size[0]==1
				self.__gen_input_fmap_signals(f, layer.input_shapes[0][-1], num_inputs_per_fmap,pointwise_flag)
			
			if layer.op_type == DENSE:
				self.__gen_dense_mac_array(f, layer.weights)
			elif layer.op_type == CONV_2D:
				self.__gen_conv_2d_mac_array(f, str(layer.name), layer.weights, layer.adder_tree, layer.bram_mult, layer.adder_pipeline, layer.use_dsp)
			elif layer.op_type == DEPTHWISE_CONV_2D:
				self.__gen_depthwise_conv_2d_mac_array(f, str(layer.name),  layer.weights, layer.adder_tree, layer.bram_mult, layer.adder_pipeline, layer.use_dsp)
			elif layer.op_type == DEPTHWISE_SEPARABLE_CONV_2D:
				self.__gen_depthwise_conv_2d_mac_array(f, str(layer.name),  layer.weights[0], layer.adder_tree, layer.bram_mult, layer.adder_pipeline, layer.use_dsp)
				self.__gen_conv_2d_mac_array(f, str(layer.name),  layer.weights[1], layer.adder_tree, layer.bram_mult, layer.adder_pipeline, layer.use_dsp)
	
			if layer.bias is not None:
				self.__gen_bias_add_array(f, layer.bias)
	
			if layer.activation_function == RELU:
				self.__gen_relu_array(f, num_outputs)
			elif layer.activation_function == RELU6:
				self.__gen_relu6_array(f, num_outputs)
	
			self.__gen_layer_module_output(f, num_outputs)
	
	def __copy_module(self, module):
		module_filename = "%s.sv" % module
		module_filepath = os.path.join(MODULES_DIRECTORY, module_filename)
		with open(module_filepath, "r") as f:
			lines = f.readlines()
		new_module_filepath = os.path.join(self.output_dir, module_filename)
		with open(new_module_filepath, "w") as f:
			f.writelines(lines)
		self.modules.append(module)
	
	def add_layer(self, layer):
		if layer.op_type in LAYER_TYPES_TRAINABLE:
			self.__gen_layer_module(layer)
		elif layer.op_type not in self.modules:
			self.__copy_module(layer.op_type)
	
		if layer.op_type in LAYER_TYPES_2D:
			if "buffer_main" not in self.modules:
				self.__copy_module("buffer_main")
				self.__copy_module("line_buffer_array")
				self.__copy_module("line_buffer_controller")
				self.__copy_module("sram_array")
				self.__copy_module("sram_controller")
			self.__gen_buffer_instance(layer)
		self.__gen_layer_instance(layer)
		self.num_layers += 1
	
	def generate_testbench(self, input_act_filepath, output_act_filepath):
		variable_map = [
			("INPUT_ACT_NBITS", self.num_input_bits),
			("OUTPUT_ACT_NBITS", self.num_output_bits),
			("INPUT_ACT_VEC_FILENAME", input_act_filepath),
			("OUTPUT_ACT_VEC_FILENAME", output_act_filepath),
			("NUM_WAIT_CYCLES", self.num_layers * self.input_image_width)
		]
		lines = read_and_fill_template(TESTBENCH_TEMPLATE, variable_map)
		testbench_filepath = os.path.join(self.output_dir, "tb.sv")
		with open(testbench_filepath, "w") as f:
			f.writelines(lines)
	
	def close(self):
		self.__gen_main_module_output_signals()
	
	def generate_adder (self, f, adder_inp1, adder_inp2, adder_out, pipeline, adder_bitwidth):
		''' generates a pipelined or non pipelined adder'''
		sign_adder_inp1 = "  -  " if adder_inp1[0]=="-" else "    "
		sign_adder_inp2 = "  -  " if adder_inp2[0]=="-" else "  +  "
		sign_adder_inp2 = "    " if adder_inp2[0]=="0" else sign_adder_inp2
		adder_inp1 = sign_adder_inp1 + adder_inp1[1:]
		adder_inp2 = sign_adder_inp2 + adder_inp2[1:]
		f.writelines("logic signed ["+ str(adder_bitwidth-1) +":0] " + str (adder_out) + ";\t\t")
		if pipeline==0:
			f.writelines("assign " + str (adder_out) + " = " + str (adder_inp1) + str (adder_inp2) + " ;\n ")
		else:
			f.writelines("always @(posedge clk) " + str (adder_out) + " <= " + str (adder_inp1) + str (adder_inp2) + " ;\n ")
	
	def generate_tree_adder (self, f, tree_adder_variables, tree_adder_var_name, input_name_array, weightage, weight_sign, weight_no_of_bits, use_dsp, fmap_idx_low_array, fmap_idx_high_array, adder_bitwidth=32, pipeline=0):
		'''generates an adder tree by taking a list input'''
		stage = 0
		adder_out_vars_tmp = tree_adder_variables  # these are the partial product
		weightage_tmp = weightage
		weight_sign_tmp = weight_sign
		weight_no_of_bits = weight_no_of_bits
		input_name_array_tmp = input_name_array
		k = 20  
			

		if len(adder_out_vars_tmp) % 4 == 1:
			input_name_array_tmp.append("zero_number")
			weightage.append("0")
			weight_sign.append(" ")
			weight_no_of_bits.append("9")	
			fmap_idx_low_array.append(0)
			fmap_idx_high_array.append(9)
			input_name_array_tmp.append("zero_number")
			weightage.append("0")
			weight_sign.append(" ")
			weight_no_of_bits.append("9")		
			fmap_idx_low_array.append(0)
			fmap_idx_high_array.append(9)
			input_name_array_tmp.append("zero_number")
			weightage.append("0")
			weight_sign.append(" ")
			weight_no_of_bits.append("9")			
			fmap_idx_low_array.append(0)
			fmap_idx_high_array.append(9)		
		if len(adder_out_vars_tmp) % 4 == 2:
			input_name_array_tmp.append("zero_number")
			input_name_array_tmp.append("zero_number")
			weightage.append("0")
			weight_sign.append(" ")
			weight_no_of_bits.append("9")
			fmap_idx_low_array.append(0)
			fmap_idx_high_array.append(9)
			weightage.append("0")
			weight_sign.append(" ")
			weight_no_of_bits.append("9")
			fmap_idx_low_array.append(0)
			fmap_idx_high_array.append(9)
		if len(adder_out_vars_tmp) % 4 == 3:
			input_name_array_tmp.append("zero_number")
			weightage.append("0")
			weight_sign.append(" ")
			weight_no_of_bits.append("9")
			fmap_idx_low_array.append(0)
			fmap_idx_high_array.append(9)
		# need to do the same above thing for weight, sign, and no. of bits 

		if len(input_name_array_tmp) ==4:
			if use_dsp ==1:
				ax = input_name_array_tmp[0] + "[" + str(int(fmap_idx_high_array[0]-1)) + ":" + str(int(fmap_idx_low_array[0])) +"]"
				bx = input_name_array_tmp[1] + "[" + str(int(fmap_idx_high_array[1]-1)) + ":" + str(int(fmap_idx_low_array[1])) +"]"
				cx = input_name_array_tmp[2] + "[" + str(int(fmap_idx_high_array[2]-1)) + ":" + str(int(fmap_idx_low_array[2])) +"]"
				dx = input_name_array_tmp[3] + "[" + str(int(fmap_idx_high_array[3]-1)) + ":" + str(int(fmap_idx_low_array[3])) +"]"
				ay = str(weight_sign[0]) + "9" + "'sd" + str(weightage[0])
				by = str(weight_sign[1]) + "9" + "'sd" + str(weightage[1])
				cy = str(weight_sign[2]) + "9" + "'sd" + str(weightage[2])
				dy = str(weight_sign[3]) + "9" + "'sd" + str(weightage[3])
				#adder_out is chainout/resulta (not)
				adder_outa = tree_adder_var_name + "_N" + "0" + "_S" + "1"
				#adder_out_vars_tmp.append("+"+adder_out)
				f.writelines("logic signed [63:0] chainout_" + "0" + "_" + tree_adder_var_name + "; \n" )
				f.writelines("logic signed [63:0] " + adder_outa + "; \n")
				f.writelines(" int_sop_4 int_sop_4_inst_" + "0" + "_" + tree_adder_var_name + "(.clk(clk),.reset(rstn),.mode_sigs(11'd0)," + ".ax(" + str(ax) + ")," + ".ay(" + str(ay) + ")," + ".bx(" + str(bx) + ")," + ".by(" + str(by) + ")," + ".cx(" + str(cx) + ")," + ".cy(" + str(cy) + ")," + ".dx(" + str(dx) + ")," + ".dy(" + str(dy) + ")," + ".chainin(63'd0)," + ".resulta(" + str(adder_outa) + ")," + ".chainout(chainout_" + "0" + "_" + tree_adder_var_name + "));" + "\n")	
				return adder_outa, stage+2
			else:
				pass

		while True:
			
			if len(adder_out_vars_tmp) % 2 == 1:  # if it is odd
				adder_out_vars_tmp.append("0")
			adder_out_vars = adder_out_vars_tmp
			if use_dsp ==0:
				adder_out_vars_tmp = []
			else: 
				if stage ==1:
					pass
				else: 
					adder_out_vars_tmp = []
			z = 0
			k = 20 + stage
			for i in xrange (0, len(adder_out_vars) , 2):
				adder_inp1 = adder_out_vars[i]
				adder_inp2 = adder_out_vars[i+1]
				#adder_out  = tree_adder_var_name + "_N" + str(i) + "_S" + str(stage)
				#adder_out_vars_tmp.append("+"+adder_out)
			
				if use_dsp == 0:
					adder_out  = tree_adder_var_name + "_N" + str(i) + "_S" + str(stage)
					adder_out_vars_tmp.append("+"+adder_out)
					self.generate_adder (f, adder_inp1, adder_inp2, adder_out, pipeline, adder_bitwidth)
				else: 
					if stage > 1:
						adder_out  = tree_adder_var_name + "_N" + str(i) + "_S" + str(stage)
						adder_out_vars_tmp.append("+"+adder_out)
						self.generate_adder (f, adder_inp1, adder_inp2, adder_out, pipeline, k)
					else:
						if stage ==1:
							pass
						else: 
							
							if z%2 == 0:	
								ax = input_name_array_tmp[i] + "[" + str(int(fmap_idx_high_array[i]-1)) + ":" + str(int(fmap_idx_low_array[i])) +"]"
								bx = input_name_array_tmp[i+1] + "[" + str(int(fmap_idx_high_array[i+1]-1)) + ":" + str(int(fmap_idx_low_array[i+1])) +"]"
								cx = input_name_array_tmp[i+2] + "[" + str(int(fmap_idx_high_array[i+2]-1)) + ":" + str(int(fmap_idx_low_array[i+2])) +"]"
								dx = input_name_array_tmp[i+3] + "[" + str(int(fmap_idx_high_array[i+3]-1)) + ":" + str(int(fmap_idx_low_array[i+3])) +"]"
								ay = str(weight_sign[i]) + "9" + "'sd" + str(weightage[i])
								by = str(weight_sign[i+1]) + "9" + "'sd" + str(weightage[i+1])
								cy = str(weight_sign[i+2]) + "9" + "'sd" + str(weightage[i+2])
								dy = str(weight_sign[i+3]) + "9" + "'sd" + str(weightage[i+3])
								#adder_out is chainout/resulta (not)
								adder_outa = tree_adder_var_name + "_N" + str(z) + "_S" + "1" 
								adder_out = adder_outa 
								adder_out_vars_tmp.append("+"+adder_out)
								f.writelines("logic signed [63:0] chainout_" + str(z) + "_" + tree_adder_var_name +  "; \n" )
								f.writelines("logic signed [63:0] " + adder_out + "; \n")
								f.writelines(" int_sop_4 int_sop_4_inst_" + str(z) + "_" + tree_adder_var_name + "(.clk(clk),.reset(rstn),.mode_sigs(11'd0)," + ".ax(" + str(ax) + ")," + ".ay(" + str(ay) + ")," + ".bx(" + str(bx) + ")," + ".by(" + str(by) + ")," + ".cx(" + str(cx) + ")," + ".cy(" + str(cy) + ")," + ".dx(" + str(dx) + ")," + ".dy(" + str(dy) + ")," + ".chainin(63'd0)," + ".resulta(" + str(adder_outa) + ")," + ".chainout(chainout_" + str(z) + "_" + tree_adder_var_name + "));" + "\n")
							else:
								pass

				#adder_out_vars_tmp.append("+"+adder_out)
				z = z+1
			if len(adder_out_vars_tmp) <= 1:
				
				if stage ==0:
					flag0 =1
				elif stage ==1:
					flag1 =1
				return adder_out_vars_tmp[0][1:], stage+2
				break
			else:
				stage = stage + 1
				f.writelines("//----------------------adder tree stage complete--------------------------------//\n")

	def generate_valid_ready_delay (self, f, num_delay):
		'''generates proper handshaking signal delays (delay change when we pipeline adder tree)'''
		if num_delay == 0:
			f.writelines ("assign ready = valid;\n")
		else:
			prev_valid_name = "valid";
			for dc in xrange (1,num_delay,1):
				valid_name = "valid_D" + str(int(dc))
				lines = "logic " + valid_name + ";\n"
				lines += "always_ff @(posedge clk) begin\n"
				lines += "\tif (rstn == 0) " + valid_name + "<= 0 ;\n"
				lines += "\telse " + valid_name + "<=" + prev_valid_name + ";\n"
				lines += "end\n"
				f.writelines (lines)
				prev_valid_name = valid_name
			lines = "always_ff @(posedge clk) begin\n"
			lines += "\tif (rstn == 0) ready <= 0 ;\n"
			lines += "\telse ready <=" + prev_valid_name + ";\n"
			lines += "end\n"
			f.writelines (lines)
			
def conv(I,W,B,STR,PAD,nfrac):
	'''Golden Conv model used for hardware verification'''
	ix, iy, inp_fmap = I.shape
	kx    		= W.shape[0]
	ky    		= W.shape[1]
	inp_fmap  = W.shape[2]
	out_fmap  = W.shape[3]
	ox 				= int((ix - kx + 2*PAD + 1)/STR)
	oy 				= int((iy - ky + 2*PAD + 1)/STR)
	out_array = np.zeros([ox, oy,out_fmap], dtype='float64')
	inp_padded = np.zeros([ix+(2*PAD), iy+(2*PAD),inp_fmap], dtype='float64')
	
	for j in xrange(0, inp_fmap):
			inp_padded[:, :,j] = np.pad(I[:, :, j], ((PAD, PAD), (PAD, PAD)), 'constant')
	for ofmap in xrange(0, out_fmap):
			for ifmap in xrange(0, inp_fmap):
					W_FX = W[:, :,ifmap,ofmap]
					W_FX = np.round(W_FX* (2**nfrac))
					W_FX = W_FX.astype('int')
					out_array[:,:,ofmap] += scipy.signal.convolve(inp_padded[:,:,ifmap], W_FX, "valid")[::STR, ::STR]
			B_FX = B[ofmap]		
			B_FX = np.round(B_FX* (2**nfrac))		
			B_FX = B_FX.astype('int')		
			out_array[:,:,ofmap] = out_array[:,:,ofmap] + B_FX
	np.savetxt('conv1.out', out_array[:,:,0], delimiter=' ', fmt='%i')
	out_array = np.maximum(out_array, 0)
	out_array = np.minimum(out_array, 6)
	return out_array
	
if __name__ == "__main__":
	parser = argparse.ArgumentParser()
	parser.add_argument("--model_name", type=str, required=True)
	parser.add_argument("--meta_filepath", type=str, default=None)
	parser.add_argument("--checkpoint_filepath", type=str, default=None)
	parser.add_argument("--pb_filepath", type=str, default=None)
	parser.add_argument("--endpoints_filepath", type=str, required=True)
	parser.add_argument("--input_layer_name", type=str, default=None)
	parser.add_argument("--output_layer_name", type=str, default=None)
	parser.add_argument("--data_format_filepath", type=str, required=True)
	parser.add_argument("--output_directory", type=str, required=True)
	parser.add_argument("--input_vec_filepath", type=str, default=None)
	parser.add_argument("--output_vec_filepath", type=str, default=None)
	parser.add_argument("--rom_init_filepath", type=str, default=None)
	FLAGS = parser.parse_args()
	graph = parse_tf_graph(FLAGS.model_name, FLAGS.endpoints_filepath,
						FLAGS.meta_filepath, FLAGS.checkpoint_filepath, FLAGS.pb_filepath,
						FLAGS.input_layer_name, FLAGS.output_layer_name)
	
	with open(FLAGS.data_format_filepath, "r") as f:
		data_format = json.load(f)
	
	layer = graph.get_input_layer()
	output_layer = graph.get_output_layer()
	vgen = VerilogGenerator(graph.name, data_format, FLAGS.output_directory, FLAGS.rom_init_filepath,
							input_layer=layer, output_layer=output_layer)
	while layer:
		vgen.add_layer(layer)
		layer = graph.get_next_layer(layer)
	
	if FLAGS.input_vec_filepath is not None and FLAGS.output_vec_filepath is not None:
		vgen.generate_testbench(FLAGS.input_vec_filepath, FLAGS.output_vec_filepath)
	vgen.close()

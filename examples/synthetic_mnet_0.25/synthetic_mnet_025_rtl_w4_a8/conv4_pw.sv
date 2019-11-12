module conv4_pw (
    input logic clk,
    input logic rstn,
    input logic valid,
    input logic [256-1:0] input_act,
    output logic [256-1:0] output_act,
    output logic ready
);

logic [256-1:0] input_act_ff;
always_ff @(posedge clk or negedge rstn) begin
    if (rstn == 0) begin
        input_act_ff <= '0;
        ready <= '0;
    end
    else begin
        input_act_ff <= input_act;
        ready <= valid;
    end
end

logic [7:0] input_fmap_0;
assign input_fmap_0 = input_act_ff[7:0];
logic [7:0] input_fmap_1;
assign input_fmap_1 = input_act_ff[15:8];
logic [7:0] input_fmap_2;
assign input_fmap_2 = input_act_ff[23:16];
logic [7:0] input_fmap_3;
assign input_fmap_3 = input_act_ff[31:24];
logic [7:0] input_fmap_4;
assign input_fmap_4 = input_act_ff[39:32];
logic [7:0] input_fmap_5;
assign input_fmap_5 = input_act_ff[47:40];
logic [7:0] input_fmap_6;
assign input_fmap_6 = input_act_ff[55:48];
logic [7:0] input_fmap_7;
assign input_fmap_7 = input_act_ff[63:56];
logic [7:0] input_fmap_8;
assign input_fmap_8 = input_act_ff[71:64];
logic [7:0] input_fmap_9;
assign input_fmap_9 = input_act_ff[79:72];
logic [7:0] input_fmap_10;
assign input_fmap_10 = input_act_ff[87:80];
logic [7:0] input_fmap_11;
assign input_fmap_11 = input_act_ff[95:88];
logic [7:0] input_fmap_12;
assign input_fmap_12 = input_act_ff[103:96];
logic [7:0] input_fmap_13;
assign input_fmap_13 = input_act_ff[111:104];
logic [7:0] input_fmap_14;
assign input_fmap_14 = input_act_ff[119:112];
logic [7:0] input_fmap_15;
assign input_fmap_15 = input_act_ff[127:120];
logic [7:0] input_fmap_16;
assign input_fmap_16 = input_act_ff[135:128];
logic [7:0] input_fmap_17;
assign input_fmap_17 = input_act_ff[143:136];
logic [7:0] input_fmap_18;
assign input_fmap_18 = input_act_ff[151:144];
logic [7:0] input_fmap_19;
assign input_fmap_19 = input_act_ff[159:152];
logic [7:0] input_fmap_20;
assign input_fmap_20 = input_act_ff[167:160];
logic [7:0] input_fmap_21;
assign input_fmap_21 = input_act_ff[175:168];
logic [7:0] input_fmap_22;
assign input_fmap_22 = input_act_ff[183:176];
logic [7:0] input_fmap_23;
assign input_fmap_23 = input_act_ff[191:184];
logic [7:0] input_fmap_24;
assign input_fmap_24 = input_act_ff[199:192];
logic [7:0] input_fmap_25;
assign input_fmap_25 = input_act_ff[207:200];
logic [7:0] input_fmap_26;
assign input_fmap_26 = input_act_ff[215:208];
logic [7:0] input_fmap_27;
assign input_fmap_27 = input_act_ff[223:216];
logic [7:0] input_fmap_28;
assign input_fmap_28 = input_act_ff[231:224];
logic [7:0] input_fmap_29;
assign input_fmap_29 = input_act_ff[239:232];
logic [7:0] input_fmap_30;
assign input_fmap_30 = input_act_ff[247:240];
logic [7:0] input_fmap_31;
assign input_fmap_31 = input_act_ff[255:248];

logic signed [31:0] conv_mac_0;
assign conv_mac_0 = 
	( 4'sd 6) * $signed(input_fmap_0[7:0]) +
	( 4'sd 4) * $signed(input_fmap_1[7:0]) +
	( 4'sd 7) * $signed(input_fmap_2[7:0]) +
	( 4'sd 5) * $signed(input_fmap_3[7:0]) +
	( 4'sd 7) * $signed(input_fmap_4[7:0]) +
	( 3'sd 2) * $signed(input_fmap_5[7:0]) +
	( 4'sd 6) * $signed(input_fmap_6[7:0]) +
	( 2'sd 1) * $signed(input_fmap_7[7:0]) +
	( 3'sd 3) * $signed(input_fmap_8[7:0]) +
	( 4'sd 5) * $signed(input_fmap_9[7:0]) +
	( 4'sd 5) * $signed(input_fmap_10[7:0]) +
	( 4'sd 5) * $signed(input_fmap_11[7:0]) +
	( 4'sd 7) * $signed(input_fmap_13[7:0]) +
	( 4'sd 4) * $signed(input_fmap_14[7:0]) +
	( 3'sd 2) * $signed(input_fmap_15[7:0]) +
	( 4'sd 4) * $signed(input_fmap_16[7:0]) +
	( 4'sd 7) * $signed(input_fmap_17[7:0]) +
	( 4'sd 4) * $signed(input_fmap_18[7:0]) +
	( 4'sd 7) * $signed(input_fmap_19[7:0]) +
	( 4'sd 6) * $signed(input_fmap_20[7:0]) +
	( 4'sd 5) * $signed(input_fmap_21[7:0]) +
	( 2'sd 1) * $signed(input_fmap_22[7:0]) +
	( 3'sd 2) * $signed(input_fmap_23[7:0]) +
	( 3'sd 2) * $signed(input_fmap_24[7:0]) +
	( 3'sd 3) * $signed(input_fmap_25[7:0]) +
	( 2'sd 1) * $signed(input_fmap_26[7:0]) +
	( 5'sd 8) * $signed(input_fmap_27[7:0]) +
	( 2'sd 1) * $signed(input_fmap_28[7:0]) +
	( 4'sd 7) * $signed(input_fmap_29[7:0]) +
	( 3'sd 2) * $signed(input_fmap_30[7:0]) +
	( 4'sd 4) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_1;
assign conv_mac_1 = 
	( 4'sd 6) * $signed(input_fmap_0[7:0]) +
	( 2'sd 1) * $signed(input_fmap_1[7:0]) +
	( 3'sd 2) * $signed(input_fmap_2[7:0]) +
	( 4'sd 4) * $signed(input_fmap_3[7:0]) +
	( 2'sd 1) * $signed(input_fmap_4[7:0]) +
	( 4'sd 6) * $signed(input_fmap_5[7:0]) +
	( 3'sd 3) * $signed(input_fmap_6[7:0]) +
	( 4'sd 5) * $signed(input_fmap_7[7:0]) +
	( 3'sd 2) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 4'sd 7) * $signed(input_fmap_10[7:0]) +
	( 4'sd 4) * $signed(input_fmap_11[7:0]) +
	( 4'sd 5) * $signed(input_fmap_12[7:0]) +
	( 3'sd 2) * $signed(input_fmap_13[7:0]) +
	( 3'sd 3) * $signed(input_fmap_14[7:0]) +
	( 3'sd 2) * $signed(input_fmap_15[7:0]) +
	( 4'sd 6) * $signed(input_fmap_16[7:0]) +
	( 4'sd 4) * $signed(input_fmap_17[7:0]) +
	( 4'sd 7) * $signed(input_fmap_18[7:0]) +
	( 4'sd 5) * $signed(input_fmap_19[7:0]) +
	( 4'sd 5) * $signed(input_fmap_21[7:0]) +
	( 4'sd 4) * $signed(input_fmap_22[7:0]) +
	( 4'sd 5) * $signed(input_fmap_23[7:0]) +
	( 4'sd 7) * $signed(input_fmap_24[7:0]) +
	( 3'sd 3) * $signed(input_fmap_25[7:0]) +
	( 3'sd 2) * $signed(input_fmap_26[7:0]) +
	( 4'sd 5) * $signed(input_fmap_27[7:0]) +
	( 2'sd 1) * $signed(input_fmap_28[7:0]) +
	( 5'sd 8) * $signed(input_fmap_29[7:0]) +
	( 4'sd 6) * $signed(input_fmap_30[7:0]) +
	( 4'sd 5) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_2;
assign conv_mac_2 = 
	( 3'sd 3) * $signed(input_fmap_0[7:0]) +
	( 4'sd 4) * $signed(input_fmap_1[7:0]) +
	( 4'sd 4) * $signed(input_fmap_2[7:0]) +
	( 4'sd 5) * $signed(input_fmap_3[7:0]) +
	( 3'sd 2) * $signed(input_fmap_4[7:0]) +
	( 4'sd 6) * $signed(input_fmap_6[7:0]) +
	( 3'sd 2) * $signed(input_fmap_7[7:0]) +
	( 3'sd 3) * $signed(input_fmap_10[7:0]) +
	( 3'sd 2) * $signed(input_fmap_11[7:0]) +
	( 4'sd 4) * $signed(input_fmap_12[7:0]) +
	( 3'sd 3) * $signed(input_fmap_13[7:0]) +
	( 4'sd 7) * $signed(input_fmap_14[7:0]) +
	( 4'sd 4) * $signed(input_fmap_15[7:0]) +
	( 5'sd 8) * $signed(input_fmap_16[7:0]) +
	( 2'sd 1) * $signed(input_fmap_17[7:0]) +
	( 3'sd 2) * $signed(input_fmap_18[7:0]) +
	( 4'sd 5) * $signed(input_fmap_19[7:0]) +
	( 4'sd 4) * $signed(input_fmap_20[7:0]) +
	( 2'sd 1) * $signed(input_fmap_21[7:0]) +
	( 4'sd 4) * $signed(input_fmap_22[7:0]) +
	( 2'sd 1) * $signed(input_fmap_23[7:0]) +
	( 4'sd 5) * $signed(input_fmap_24[7:0]) +
	( 2'sd 1) * $signed(input_fmap_25[7:0]) +
	( 4'sd 4) * $signed(input_fmap_26[7:0]) +
	( 3'sd 3) * $signed(input_fmap_27[7:0]) +
	( 4'sd 6) * $signed(input_fmap_28[7:0]) +
	( 4'sd 7) * $signed(input_fmap_29[7:0]) +
	( 4'sd 5) * $signed(input_fmap_30[7:0]) +
	( 4'sd 4) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_3;
assign conv_mac_3 = 
	( 4'sd 7) * $signed(input_fmap_1[7:0]) +
	( 3'sd 2) * $signed(input_fmap_3[7:0]) +
	( 5'sd 8) * $signed(input_fmap_4[7:0]) +
	( 3'sd 3) * $signed(input_fmap_5[7:0]) +
	( 3'sd 2) * $signed(input_fmap_6[7:0]) +
	( 3'sd 2) * $signed(input_fmap_7[7:0]) +
	( 3'sd 2) * $signed(input_fmap_8[7:0]) +
	( 5'sd 8) * $signed(input_fmap_9[7:0]) +
	( 4'sd 7) * $signed(input_fmap_10[7:0]) +
	( 4'sd 5) * $signed(input_fmap_11[7:0]) +
	( 4'sd 7) * $signed(input_fmap_12[7:0]) +
	( 4'sd 6) * $signed(input_fmap_13[7:0]) +
	( 4'sd 6) * $signed(input_fmap_15[7:0]) +
	( 2'sd 1) * $signed(input_fmap_17[7:0]) +
	( 3'sd 2) * $signed(input_fmap_18[7:0]) +
	( 5'sd 8) * $signed(input_fmap_19[7:0]) +
	( 2'sd 1) * $signed(input_fmap_20[7:0]) +
	( 4'sd 6) * $signed(input_fmap_21[7:0]) +
	( 4'sd 7) * $signed(input_fmap_22[7:0]) +
	( 4'sd 4) * $signed(input_fmap_23[7:0]) +
	( 3'sd 3) * $signed(input_fmap_24[7:0]) +
	( 3'sd 2) * $signed(input_fmap_25[7:0]) +
	( 3'sd 2) * $signed(input_fmap_26[7:0]) +
	( 4'sd 7) * $signed(input_fmap_27[7:0]) +
	( 4'sd 5) * $signed(input_fmap_28[7:0]) +
	( 4'sd 6) * $signed(input_fmap_29[7:0]) +
	( 4'sd 4) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_4;
assign conv_mac_4 = 
	( 3'sd 3) * $signed(input_fmap_0[7:0]) +
	( 2'sd 1) * $signed(input_fmap_1[7:0]) +
	( 4'sd 7) * $signed(input_fmap_2[7:0]) +
	( 3'sd 2) * $signed(input_fmap_3[7:0]) +
	( 3'sd 3) * $signed(input_fmap_4[7:0]) +
	( 4'sd 6) * $signed(input_fmap_5[7:0]) +
	( 3'sd 2) * $signed(input_fmap_6[7:0]) +
	( 3'sd 2) * $signed(input_fmap_7[7:0]) +
	( 4'sd 6) * $signed(input_fmap_8[7:0]) +
	( 4'sd 5) * $signed(input_fmap_9[7:0]) +
	( 5'sd 8) * $signed(input_fmap_10[7:0]) +
	( 2'sd 1) * $signed(input_fmap_11[7:0]) +
	( 2'sd 1) * $signed(input_fmap_12[7:0]) +
	( 4'sd 5) * $signed(input_fmap_13[7:0]) +
	( 3'sd 3) * $signed(input_fmap_14[7:0]) +
	( 3'sd 3) * $signed(input_fmap_15[7:0]) +
	( 3'sd 2) * $signed(input_fmap_16[7:0]) +
	( 5'sd 8) * $signed(input_fmap_17[7:0]) +
	( 4'sd 5) * $signed(input_fmap_18[7:0]) +
	( 4'sd 7) * $signed(input_fmap_19[7:0]) +
	( 2'sd 1) * $signed(input_fmap_20[7:0]) +
	( 3'sd 2) * $signed(input_fmap_21[7:0]) +
	( 4'sd 7) * $signed(input_fmap_22[7:0]) +
	( 4'sd 6) * $signed(input_fmap_23[7:0]) +
	( 4'sd 5) * $signed(input_fmap_24[7:0]) +
	( 4'sd 4) * $signed(input_fmap_25[7:0]) +
	( 4'sd 4) * $signed(input_fmap_26[7:0]) +
	( 2'sd 1) * $signed(input_fmap_27[7:0]) +
	( 4'sd 5) * $signed(input_fmap_28[7:0]) +
	( 3'sd 2) * $signed(input_fmap_29[7:0]) +
	( 2'sd 1) * $signed(input_fmap_30[7:0]) +
	( 4'sd 7) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_5;
assign conv_mac_5 = 
	( 3'sd 3) * $signed(input_fmap_0[7:0]) +
	( 4'sd 5) * $signed(input_fmap_2[7:0]) +
	( 3'sd 2) * $signed(input_fmap_3[7:0]) +
	( 3'sd 3) * $signed(input_fmap_4[7:0]) +
	( 3'sd 3) * $signed(input_fmap_5[7:0]) +
	( 4'sd 6) * $signed(input_fmap_6[7:0]) +
	( 4'sd 6) * $signed(input_fmap_7[7:0]) +
	( 4'sd 7) * $signed(input_fmap_8[7:0]) +
	( 2'sd 1) * $signed(input_fmap_9[7:0]) +
	( 4'sd 4) * $signed(input_fmap_10[7:0]) +
	( 4'sd 4) * $signed(input_fmap_11[7:0]) +
	( 4'sd 4) * $signed(input_fmap_12[7:0]) +
	( 2'sd 1) * $signed(input_fmap_13[7:0]) +
	( 3'sd 3) * $signed(input_fmap_14[7:0]) +
	( 4'sd 5) * $signed(input_fmap_15[7:0]) +
	( 3'sd 2) * $signed(input_fmap_16[7:0]) +
	( 3'sd 2) * $signed(input_fmap_17[7:0]) +
	( 4'sd 4) * $signed(input_fmap_18[7:0]) +
	( 2'sd 1) * $signed(input_fmap_19[7:0]) +
	( 4'sd 4) * $signed(input_fmap_20[7:0]) +
	( 4'sd 5) * $signed(input_fmap_21[7:0]) +
	( 4'sd 6) * $signed(input_fmap_22[7:0]) +
	( 4'sd 5) * $signed(input_fmap_23[7:0]) +
	( 2'sd 1) * $signed(input_fmap_24[7:0]) +
	( 3'sd 3) * $signed(input_fmap_25[7:0]) +
	( 2'sd 1) * $signed(input_fmap_26[7:0]) +
	( 2'sd 1) * $signed(input_fmap_27[7:0]) +
	( 4'sd 5) * $signed(input_fmap_28[7:0]) +
	( 3'sd 3) * $signed(input_fmap_29[7:0]) +
	( 2'sd 1) * $signed(input_fmap_30[7:0]) +
	( 3'sd 2) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_6;
assign conv_mac_6 = 
	( 2'sd 1) * $signed(input_fmap_0[7:0]) +
	( 4'sd 5) * $signed(input_fmap_1[7:0]) +
	( 3'sd 3) * $signed(input_fmap_2[7:0]) +
	( 5'sd 8) * $signed(input_fmap_3[7:0]) +
	( 3'sd 2) * $signed(input_fmap_4[7:0]) +
	( 3'sd 3) * $signed(input_fmap_5[7:0]) +
	( 3'sd 3) * $signed(input_fmap_7[7:0]) +
	( 4'sd 6) * $signed(input_fmap_8[7:0]) +
	( 4'sd 7) * $signed(input_fmap_10[7:0]) +
	( 4'sd 5) * $signed(input_fmap_11[7:0]) +
	( 2'sd 1) * $signed(input_fmap_12[7:0]) +
	( 3'sd 3) * $signed(input_fmap_13[7:0]) +
	( 4'sd 6) * $signed(input_fmap_14[7:0]) +
	( 4'sd 4) * $signed(input_fmap_15[7:0]) +
	( 3'sd 3) * $signed(input_fmap_16[7:0]) +
	( 4'sd 5) * $signed(input_fmap_17[7:0]) +
	( 2'sd 1) * $signed(input_fmap_18[7:0]) +
	( 3'sd 2) * $signed(input_fmap_19[7:0]) +
	( 4'sd 4) * $signed(input_fmap_20[7:0]) +
	( 4'sd 6) * $signed(input_fmap_22[7:0]) +
	( 3'sd 3) * $signed(input_fmap_23[7:0]) +
	( 4'sd 5) * $signed(input_fmap_24[7:0]) +
	( 3'sd 2) * $signed(input_fmap_25[7:0]) +
	( 3'sd 2) * $signed(input_fmap_26[7:0]) +
	( 3'sd 3) * $signed(input_fmap_27[7:0]) +
	( 4'sd 7) * $signed(input_fmap_28[7:0]) +
	( 4'sd 4) * $signed(input_fmap_29[7:0]) +
	( 4'sd 5) * $signed(input_fmap_30[7:0]) +
	( 4'sd 6) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_7;
assign conv_mac_7 = 
	( 4'sd 7) * $signed(input_fmap_0[7:0]) +
	( 3'sd 2) * $signed(input_fmap_1[7:0]) +
	( 5'sd 8) * $signed(input_fmap_2[7:0]) +
	( 5'sd 8) * $signed(input_fmap_3[7:0]) +
	( 3'sd 3) * $signed(input_fmap_4[7:0]) +
	( 3'sd 3) * $signed(input_fmap_5[7:0]) +
	( 4'sd 7) * $signed(input_fmap_6[7:0]) +
	( 2'sd 1) * $signed(input_fmap_7[7:0]) +
	( 4'sd 4) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 3'sd 3) * $signed(input_fmap_10[7:0]) +
	( 4'sd 7) * $signed(input_fmap_11[7:0]) +
	( 4'sd 4) * $signed(input_fmap_12[7:0]) +
	( 3'sd 3) * $signed(input_fmap_13[7:0]) +
	( 3'sd 3) * $signed(input_fmap_14[7:0]) +
	( 3'sd 2) * $signed(input_fmap_15[7:0]) +
	( 4'sd 6) * $signed(input_fmap_16[7:0]) +
	( 4'sd 4) * $signed(input_fmap_17[7:0]) +
	( 4'sd 6) * $signed(input_fmap_18[7:0]) +
	( 3'sd 2) * $signed(input_fmap_19[7:0]) +
	( 2'sd 1) * $signed(input_fmap_20[7:0]) +
	( 3'sd 3) * $signed(input_fmap_21[7:0]) +
	( 4'sd 6) * $signed(input_fmap_23[7:0]) +
	( 3'sd 2) * $signed(input_fmap_24[7:0]) +
	( 4'sd 7) * $signed(input_fmap_25[7:0]) +
	( 2'sd 1) * $signed(input_fmap_26[7:0]) +
	( 4'sd 6) * $signed(input_fmap_28[7:0]) +
	( 4'sd 5) * $signed(input_fmap_29[7:0]) +
	( 3'sd 3) * $signed(input_fmap_30[7:0]) +
	( 4'sd 5) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_8;
assign conv_mac_8 = 
	( 4'sd 6) * $signed(input_fmap_0[7:0]) +
	( 3'sd 2) * $signed(input_fmap_1[7:0]) +
	( 4'sd 6) * $signed(input_fmap_2[7:0]) +
	( 4'sd 5) * $signed(input_fmap_3[7:0]) +
	( 5'sd 8) * $signed(input_fmap_4[7:0]) +
	( 3'sd 3) * $signed(input_fmap_5[7:0]) +
	( 4'sd 5) * $signed(input_fmap_6[7:0]) +
	( 3'sd 2) * $signed(input_fmap_7[7:0]) +
	( 4'sd 6) * $signed(input_fmap_8[7:0]) +
	( 3'sd 3) * $signed(input_fmap_9[7:0]) +
	( 2'sd 1) * $signed(input_fmap_10[7:0]) +
	( 3'sd 2) * $signed(input_fmap_11[7:0]) +
	( 3'sd 2) * $signed(input_fmap_13[7:0]) +
	( 4'sd 5) * $signed(input_fmap_14[7:0]) +
	( 3'sd 3) * $signed(input_fmap_15[7:0]) +
	( 4'sd 7) * $signed(input_fmap_16[7:0]) +
	( 4'sd 5) * $signed(input_fmap_17[7:0]) +
	( 4'sd 6) * $signed(input_fmap_18[7:0]) +
	( 4'sd 4) * $signed(input_fmap_19[7:0]) +
	( 4'sd 7) * $signed(input_fmap_20[7:0]) +
	( 4'sd 5) * $signed(input_fmap_21[7:0]) +
	( 2'sd 1) * $signed(input_fmap_22[7:0]) +
	( 4'sd 5) * $signed(input_fmap_23[7:0]) +
	( 4'sd 7) * $signed(input_fmap_24[7:0]) +
	( 4'sd 7) * $signed(input_fmap_25[7:0]) +
	( 3'sd 2) * $signed(input_fmap_26[7:0]) +
	( 4'sd 5) * $signed(input_fmap_27[7:0]) +
	( 4'sd 5) * $signed(input_fmap_28[7:0]) +
	( 3'sd 2) * $signed(input_fmap_29[7:0]) +
	( 4'sd 5) * $signed(input_fmap_30[7:0]) +
	( 3'sd 2) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_9;
assign conv_mac_9 = 
	( 5'sd 8) * $signed(input_fmap_0[7:0]) +
	( 5'sd 8) * $signed(input_fmap_2[7:0]) +
	( 5'sd 8) * $signed(input_fmap_3[7:0]) +
	( 3'sd 2) * $signed(input_fmap_4[7:0]) +
	( 2'sd 1) * $signed(input_fmap_5[7:0]) +
	( 4'sd 6) * $signed(input_fmap_6[7:0]) +
	( 3'sd 2) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 3'sd 2) * $signed(input_fmap_10[7:0]) +
	( 4'sd 6) * $signed(input_fmap_11[7:0]) +
	( 4'sd 5) * $signed(input_fmap_12[7:0]) +
	( 4'sd 5) * $signed(input_fmap_14[7:0]) +
	( 2'sd 1) * $signed(input_fmap_15[7:0]) +
	( 4'sd 6) * $signed(input_fmap_16[7:0]) +
	( 4'sd 7) * $signed(input_fmap_18[7:0]) +
	( 4'sd 4) * $signed(input_fmap_19[7:0]) +
	( 3'sd 3) * $signed(input_fmap_20[7:0]) +
	( 3'sd 3) * $signed(input_fmap_21[7:0]) +
	( 4'sd 4) * $signed(input_fmap_22[7:0]) +
	( 3'sd 2) * $signed(input_fmap_23[7:0]) +
	( 4'sd 6) * $signed(input_fmap_24[7:0]) +
	( 4'sd 5) * $signed(input_fmap_25[7:0]) +
	( 4'sd 4) * $signed(input_fmap_26[7:0]) +
	( 3'sd 2) * $signed(input_fmap_27[7:0]) +
	( 4'sd 4) * $signed(input_fmap_29[7:0]) +
	( 3'sd 3) * $signed(input_fmap_30[7:0]) +
	( 5'sd 8) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_10;
assign conv_mac_10 = 
	( 3'sd 3) * $signed(input_fmap_0[7:0]) +
	( 4'sd 6) * $signed(input_fmap_1[7:0]) +
	( 4'sd 6) * $signed(input_fmap_2[7:0]) +
	( 3'sd 3) * $signed(input_fmap_3[7:0]) +
	( 3'sd 2) * $signed(input_fmap_4[7:0]) +
	( 4'sd 6) * $signed(input_fmap_5[7:0]) +
	( 3'sd 2) * $signed(input_fmap_6[7:0]) +
	( 4'sd 7) * $signed(input_fmap_7[7:0]) +
	( 2'sd 1) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 4'sd 6) * $signed(input_fmap_10[7:0]) +
	( 2'sd 1) * $signed(input_fmap_11[7:0]) +
	( 2'sd 1) * $signed(input_fmap_12[7:0]) +
	( 4'sd 7) * $signed(input_fmap_13[7:0]) +
	( 5'sd 8) * $signed(input_fmap_14[7:0]) +
	( 2'sd 1) * $signed(input_fmap_15[7:0]) +
	( 3'sd 2) * $signed(input_fmap_16[7:0]) +
	( 2'sd 1) * $signed(input_fmap_17[7:0]) +
	( 5'sd 8) * $signed(input_fmap_18[7:0]) +
	( 4'sd 4) * $signed(input_fmap_20[7:0]) +
	( 4'sd 4) * $signed(input_fmap_21[7:0]) +
	( 3'sd 2) * $signed(input_fmap_22[7:0]) +
	( 4'sd 6) * $signed(input_fmap_23[7:0]) +
	( 3'sd 2) * $signed(input_fmap_24[7:0]) +
	( 4'sd 7) * $signed(input_fmap_25[7:0]) +
	( 4'sd 6) * $signed(input_fmap_26[7:0]) +
	( 4'sd 5) * $signed(input_fmap_27[7:0]) +
	( 3'sd 3) * $signed(input_fmap_28[7:0]) +
	( 4'sd 7) * $signed(input_fmap_29[7:0]) +
	( 3'sd 2) * $signed(input_fmap_30[7:0]) +
	( 3'sd 2) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_11;
assign conv_mac_11 = 
	( 4'sd 5) * $signed(input_fmap_0[7:0]) +
	( 4'sd 7) * $signed(input_fmap_1[7:0]) +
	( 2'sd 1) * $signed(input_fmap_2[7:0]) +
	( 4'sd 7) * $signed(input_fmap_3[7:0]) +
	( 4'sd 4) * $signed(input_fmap_4[7:0]) +
	( 2'sd 1) * $signed(input_fmap_5[7:0]) +
	( 4'sd 4) * $signed(input_fmap_6[7:0]) +
	( 3'sd 3) * $signed(input_fmap_7[7:0]) +
	( 4'sd 5) * $signed(input_fmap_8[7:0]) +
	( 2'sd 1) * $signed(input_fmap_9[7:0]) +
	( 2'sd 1) * $signed(input_fmap_10[7:0]) +
	( 3'sd 3) * $signed(input_fmap_11[7:0]) +
	( 4'sd 7) * $signed(input_fmap_12[7:0]) +
	( 5'sd 8) * $signed(input_fmap_13[7:0]) +
	( 4'sd 7) * $signed(input_fmap_14[7:0]) +
	( 4'sd 6) * $signed(input_fmap_15[7:0]) +
	( 5'sd 8) * $signed(input_fmap_17[7:0]) +
	( 2'sd 1) * $signed(input_fmap_18[7:0]) +
	( 3'sd 3) * $signed(input_fmap_20[7:0]) +
	( 4'sd 7) * $signed(input_fmap_22[7:0]) +
	( 3'sd 2) * $signed(input_fmap_23[7:0]) +
	( 4'sd 4) * $signed(input_fmap_24[7:0]) +
	( 3'sd 2) * $signed(input_fmap_25[7:0]) +
	( 4'sd 6) * $signed(input_fmap_26[7:0]) +
	( 5'sd 8) * $signed(input_fmap_27[7:0]) +
	( 2'sd 1) * $signed(input_fmap_28[7:0]) +
	( 4'sd 4) * $signed(input_fmap_29[7:0]) +
	( 4'sd 4) * $signed(input_fmap_30[7:0]) +
	( 4'sd 4) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_12;
assign conv_mac_12 = 
	( 3'sd 2) * $signed(input_fmap_0[7:0]) +
	( 4'sd 7) * $signed(input_fmap_1[7:0]) +
	( 4'sd 5) * $signed(input_fmap_2[7:0]) +
	( 4'sd 6) * $signed(input_fmap_3[7:0]) +
	( 4'sd 5) * $signed(input_fmap_4[7:0]) +
	( 4'sd 4) * $signed(input_fmap_5[7:0]) +
	( 3'sd 3) * $signed(input_fmap_6[7:0]) +
	( 3'sd 3) * $signed(input_fmap_7[7:0]) +
	( 2'sd 1) * $signed(input_fmap_8[7:0]) +
	( 4'sd 7) * $signed(input_fmap_9[7:0]) +
	( 3'sd 2) * $signed(input_fmap_10[7:0]) +
	( 3'sd 3) * $signed(input_fmap_11[7:0]) +
	( 2'sd 1) * $signed(input_fmap_12[7:0]) +
	( 4'sd 5) * $signed(input_fmap_13[7:0]) +
	( 3'sd 3) * $signed(input_fmap_14[7:0]) +
	( 4'sd 6) * $signed(input_fmap_15[7:0]) +
	( 4'sd 5) * $signed(input_fmap_16[7:0]) +
	( 4'sd 5) * $signed(input_fmap_17[7:0]) +
	( 4'sd 6) * $signed(input_fmap_18[7:0]) +
	( 3'sd 2) * $signed(input_fmap_19[7:0]) +
	( 4'sd 4) * $signed(input_fmap_20[7:0]) +
	( 2'sd 1) * $signed(input_fmap_21[7:0]) +
	( 3'sd 2) * $signed(input_fmap_22[7:0]) +
	( 3'sd 3) * $signed(input_fmap_23[7:0]) +
	( 3'sd 3) * $signed(input_fmap_24[7:0]) +
	( 5'sd 8) * $signed(input_fmap_25[7:0]) +
	( 2'sd 1) * $signed(input_fmap_26[7:0]) +
	( 3'sd 3) * $signed(input_fmap_27[7:0]) +
	( 2'sd 1) * $signed(input_fmap_29[7:0]) +
	( 4'sd 5) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_13;
assign conv_mac_13 = 
	( 4'sd 7) * $signed(input_fmap_0[7:0]) +
	( 3'sd 3) * $signed(input_fmap_1[7:0]) +
	( 4'sd 5) * $signed(input_fmap_2[7:0]) +
	( 2'sd 1) * $signed(input_fmap_3[7:0]) +
	( 4'sd 4) * $signed(input_fmap_4[7:0]) +
	( 3'sd 2) * $signed(input_fmap_5[7:0]) +
	( 2'sd 1) * $signed(input_fmap_6[7:0]) +
	( 4'sd 4) * $signed(input_fmap_7[7:0]) +
	( 4'sd 6) * $signed(input_fmap_8[7:0]) +
	( 4'sd 4) * $signed(input_fmap_9[7:0]) +
	( 4'sd 6) * $signed(input_fmap_10[7:0]) +
	( 3'sd 2) * $signed(input_fmap_11[7:0]) +
	( 2'sd 1) * $signed(input_fmap_12[7:0]) +
	( 4'sd 7) * $signed(input_fmap_13[7:0]) +
	( 4'sd 7) * $signed(input_fmap_14[7:0]) +
	( 4'sd 7) * $signed(input_fmap_15[7:0]) +
	( 3'sd 3) * $signed(input_fmap_16[7:0]) +
	( 4'sd 6) * $signed(input_fmap_17[7:0]) +
	( 4'sd 5) * $signed(input_fmap_18[7:0]) +
	( 3'sd 2) * $signed(input_fmap_19[7:0]) +
	( 4'sd 6) * $signed(input_fmap_20[7:0]) +
	( 3'sd 2) * $signed(input_fmap_21[7:0]) +
	( 4'sd 6) * $signed(input_fmap_22[7:0]) +
	( 4'sd 5) * $signed(input_fmap_23[7:0]) +
	( 3'sd 3) * $signed(input_fmap_24[7:0]) +
	( 2'sd 1) * $signed(input_fmap_25[7:0]) +
	( 3'sd 3) * $signed(input_fmap_26[7:0]) +
	( 4'sd 5) * $signed(input_fmap_27[7:0]) +
	( 5'sd 8) * $signed(input_fmap_28[7:0]) +
	( 3'sd 3) * $signed(input_fmap_29[7:0]) +
	( 4'sd 4) * $signed(input_fmap_30[7:0]) +
	( 3'sd 3) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_14;
assign conv_mac_14 = 
	( 3'sd 3) * $signed(input_fmap_0[7:0]) +
	( 3'sd 2) * $signed(input_fmap_1[7:0]) +
	( 2'sd 1) * $signed(input_fmap_2[7:0]) +
	( 3'sd 2) * $signed(input_fmap_3[7:0]) +
	( 4'sd 5) * $signed(input_fmap_4[7:0]) +
	( 4'sd 7) * $signed(input_fmap_5[7:0]) +
	( 4'sd 7) * $signed(input_fmap_6[7:0]) +
	( 3'sd 2) * $signed(input_fmap_7[7:0]) +
	( 4'sd 4) * $signed(input_fmap_8[7:0]) +
	( 4'sd 5) * $signed(input_fmap_9[7:0]) +
	( 4'sd 5) * $signed(input_fmap_10[7:0]) +
	( 4'sd 7) * $signed(input_fmap_11[7:0]) +
	( 5'sd 8) * $signed(input_fmap_12[7:0]) +
	( 5'sd 8) * $signed(input_fmap_13[7:0]) +
	( 4'sd 7) * $signed(input_fmap_14[7:0]) +
	( 4'sd 7) * $signed(input_fmap_15[7:0]) +
	( 4'sd 7) * $signed(input_fmap_16[7:0]) +
	( 4'sd 6) * $signed(input_fmap_17[7:0]) +
	( 4'sd 6) * $signed(input_fmap_18[7:0]) +
	( 4'sd 5) * $signed(input_fmap_19[7:0]) +
	( 3'sd 2) * $signed(input_fmap_20[7:0]) +
	( 4'sd 5) * $signed(input_fmap_21[7:0]) +
	( 3'sd 2) * $signed(input_fmap_22[7:0]) +
	( 4'sd 4) * $signed(input_fmap_23[7:0]) +
	( 3'sd 2) * $signed(input_fmap_24[7:0]) +
	( 3'sd 3) * $signed(input_fmap_26[7:0]) +
	( 4'sd 5) * $signed(input_fmap_27[7:0]) +
	( 4'sd 6) * $signed(input_fmap_28[7:0]) +
	( 3'sd 3) * $signed(input_fmap_29[7:0]) +
	( 4'sd 5) * $signed(input_fmap_30[7:0]) +
	( 2'sd 1) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_15;
assign conv_mac_15 = 
	( 4'sd 5) * $signed(input_fmap_0[7:0]) +
	( 4'sd 5) * $signed(input_fmap_1[7:0]) +
	( 3'sd 3) * $signed(input_fmap_2[7:0]) +
	( 4'sd 5) * $signed(input_fmap_3[7:0]) +
	( 4'sd 7) * $signed(input_fmap_4[7:0]) +
	( 4'sd 5) * $signed(input_fmap_5[7:0]) +
	( 5'sd 8) * $signed(input_fmap_6[7:0]) +
	( 3'sd 2) * $signed(input_fmap_7[7:0]) +
	( 4'sd 4) * $signed(input_fmap_9[7:0]) +
	( 3'sd 3) * $signed(input_fmap_11[7:0]) +
	( 3'sd 3) * $signed(input_fmap_12[7:0]) +
	( 3'sd 3) * $signed(input_fmap_13[7:0]) +
	( 4'sd 7) * $signed(input_fmap_14[7:0]) +
	( 4'sd 6) * $signed(input_fmap_15[7:0]) +
	( 4'sd 7) * $signed(input_fmap_16[7:0]) +
	( 2'sd 1) * $signed(input_fmap_17[7:0]) +
	( 5'sd 8) * $signed(input_fmap_18[7:0]) +
	( 3'sd 2) * $signed(input_fmap_19[7:0]) +
	( 3'sd 2) * $signed(input_fmap_21[7:0]) +
	( 3'sd 3) * $signed(input_fmap_23[7:0]) +
	( 3'sd 2) * $signed(input_fmap_24[7:0]) +
	( 2'sd 1) * $signed(input_fmap_25[7:0]) +
	( 2'sd 1) * $signed(input_fmap_26[7:0]) +
	( 4'sd 6) * $signed(input_fmap_27[7:0]) +
	( 5'sd 8) * $signed(input_fmap_28[7:0]) +
	( 3'sd 3) * $signed(input_fmap_29[7:0]) +
	( 4'sd 5) * $signed(input_fmap_30[7:0]) +
	( 4'sd 7) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_16;
assign conv_mac_16 = 
	( 5'sd 8) * $signed(input_fmap_0[7:0]) +
	( 2'sd 1) * $signed(input_fmap_1[7:0]) +
	( 5'sd 8) * $signed(input_fmap_2[7:0]) +
	( 4'sd 5) * $signed(input_fmap_3[7:0]) +
	( 4'sd 6) * $signed(input_fmap_4[7:0]) +
	( 4'sd 5) * $signed(input_fmap_5[7:0]) +
	( 3'sd 3) * $signed(input_fmap_6[7:0]) +
	( 4'sd 4) * $signed(input_fmap_7[7:0]) +
	( 4'sd 6) * $signed(input_fmap_8[7:0]) +
	( 3'sd 2) * $signed(input_fmap_9[7:0]) +
	( 3'sd 3) * $signed(input_fmap_11[7:0]) +
	( 4'sd 5) * $signed(input_fmap_12[7:0]) +
	( 3'sd 3) * $signed(input_fmap_13[7:0]) +
	( 3'sd 2) * $signed(input_fmap_14[7:0]) +
	( 4'sd 6) * $signed(input_fmap_15[7:0]) +
	( 4'sd 6) * $signed(input_fmap_16[7:0]) +
	( 4'sd 7) * $signed(input_fmap_17[7:0]) +
	( 3'sd 3) * $signed(input_fmap_18[7:0]) +
	( 2'sd 1) * $signed(input_fmap_19[7:0]) +
	( 5'sd 8) * $signed(input_fmap_20[7:0]) +
	( 5'sd 8) * $signed(input_fmap_21[7:0]) +
	( 4'sd 4) * $signed(input_fmap_22[7:0]) +
	( 3'sd 2) * $signed(input_fmap_23[7:0]) +
	( 4'sd 7) * $signed(input_fmap_24[7:0]) +
	( 4'sd 7) * $signed(input_fmap_25[7:0]) +
	( 2'sd 1) * $signed(input_fmap_26[7:0]) +
	( 4'sd 4) * $signed(input_fmap_27[7:0]) +
	( 4'sd 4) * $signed(input_fmap_28[7:0]) +
	( 4'sd 7) * $signed(input_fmap_29[7:0]) +
	( 2'sd 1) * $signed(input_fmap_30[7:0]) +
	( 3'sd 2) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_17;
assign conv_mac_17 = 
	( 4'sd 6) * $signed(input_fmap_0[7:0]) +
	( 3'sd 2) * $signed(input_fmap_1[7:0]) +
	( 4'sd 5) * $signed(input_fmap_2[7:0]) +
	( 2'sd 1) * $signed(input_fmap_3[7:0]) +
	( 4'sd 5) * $signed(input_fmap_4[7:0]) +
	( 4'sd 5) * $signed(input_fmap_5[7:0]) +
	( 4'sd 5) * $signed(input_fmap_6[7:0]) +
	( 4'sd 4) * $signed(input_fmap_7[7:0]) +
	( 4'sd 7) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_10[7:0]) +
	( 2'sd 1) * $signed(input_fmap_11[7:0]) +
	( 3'sd 3) * $signed(input_fmap_12[7:0]) +
	( 4'sd 7) * $signed(input_fmap_13[7:0]) +
	( 3'sd 3) * $signed(input_fmap_14[7:0]) +
	( 4'sd 7) * $signed(input_fmap_15[7:0]) +
	( 4'sd 5) * $signed(input_fmap_16[7:0]) +
	( 4'sd 6) * $signed(input_fmap_17[7:0]) +
	( 5'sd 8) * $signed(input_fmap_18[7:0]) +
	( 2'sd 1) * $signed(input_fmap_19[7:0]) +
	( 4'sd 7) * $signed(input_fmap_20[7:0]) +
	( 3'sd 3) * $signed(input_fmap_21[7:0]) +
	( 3'sd 2) * $signed(input_fmap_22[7:0]) +
	( 2'sd 1) * $signed(input_fmap_23[7:0]) +
	( 3'sd 2) * $signed(input_fmap_24[7:0]) +
	( 3'sd 2) * $signed(input_fmap_25[7:0]) +
	( 4'sd 5) * $signed(input_fmap_26[7:0]) +
	( 4'sd 5) * $signed(input_fmap_27[7:0]) +
	( 4'sd 7) * $signed(input_fmap_28[7:0]) +
	( 2'sd 1) * $signed(input_fmap_29[7:0]) +
	( 3'sd 3) * $signed(input_fmap_30[7:0]) +
	( 4'sd 5) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_18;
assign conv_mac_18 = 
	( 3'sd 3) * $signed(input_fmap_0[7:0]) +
	( 4'sd 5) * $signed(input_fmap_1[7:0]) +
	( 3'sd 2) * $signed(input_fmap_2[7:0]) +
	( 3'sd 2) * $signed(input_fmap_3[7:0]) +
	( 4'sd 5) * $signed(input_fmap_4[7:0]) +
	( 2'sd 1) * $signed(input_fmap_5[7:0]) +
	( 3'sd 2) * $signed(input_fmap_6[7:0]) +
	( 4'sd 7) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 4'sd 6) * $signed(input_fmap_10[7:0]) +
	( 4'sd 5) * $signed(input_fmap_11[7:0]) +
	( 4'sd 6) * $signed(input_fmap_12[7:0]) +
	( 4'sd 4) * $signed(input_fmap_13[7:0]) +
	( 2'sd 1) * $signed(input_fmap_14[7:0]) +
	( 5'sd 8) * $signed(input_fmap_15[7:0]) +
	( 4'sd 4) * $signed(input_fmap_16[7:0]) +
	( 4'sd 4) * $signed(input_fmap_17[7:0]) +
	( 4'sd 5) * $signed(input_fmap_18[7:0]) +
	( 4'sd 4) * $signed(input_fmap_19[7:0]) +
	( 4'sd 6) * $signed(input_fmap_20[7:0]) +
	( 3'sd 2) * $signed(input_fmap_21[7:0]) +
	( 4'sd 4) * $signed(input_fmap_22[7:0]) +
	( 4'sd 4) * $signed(input_fmap_23[7:0]) +
	( 4'sd 5) * $signed(input_fmap_24[7:0]) +
	( 4'sd 5) * $signed(input_fmap_25[7:0]) +
	( 2'sd 1) * $signed(input_fmap_26[7:0]) +
	( 2'sd 1) * $signed(input_fmap_27[7:0]) +
	( 2'sd 1) * $signed(input_fmap_28[7:0]) +
	( 3'sd 2) * $signed(input_fmap_29[7:0]) +
	( 3'sd 3) * $signed(input_fmap_30[7:0]) +
	( 4'sd 4) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_19;
assign conv_mac_19 = 
	( 4'sd 5) * $signed(input_fmap_0[7:0]) +
	( 4'sd 7) * $signed(input_fmap_1[7:0]) +
	( 4'sd 5) * $signed(input_fmap_2[7:0]) +
	( 4'sd 5) * $signed(input_fmap_3[7:0]) +
	( 4'sd 4) * $signed(input_fmap_4[7:0]) +
	( 5'sd 8) * $signed(input_fmap_5[7:0]) +
	( 4'sd 6) * $signed(input_fmap_6[7:0]) +
	( 3'sd 2) * $signed(input_fmap_7[7:0]) +
	( 4'sd 7) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 3'sd 3) * $signed(input_fmap_10[7:0]) +
	( 4'sd 6) * $signed(input_fmap_11[7:0]) +
	( 2'sd 1) * $signed(input_fmap_12[7:0]) +
	( 3'sd 3) * $signed(input_fmap_13[7:0]) +
	( 3'sd 2) * $signed(input_fmap_14[7:0]) +
	( 2'sd 1) * $signed(input_fmap_15[7:0]) +
	( 2'sd 1) * $signed(input_fmap_16[7:0]) +
	( 4'sd 5) * $signed(input_fmap_17[7:0]) +
	( 3'sd 3) * $signed(input_fmap_18[7:0]) +
	( 4'sd 7) * $signed(input_fmap_19[7:0]) +
	( 2'sd 1) * $signed(input_fmap_21[7:0]) +
	( 3'sd 2) * $signed(input_fmap_22[7:0]) +
	( 2'sd 1) * $signed(input_fmap_23[7:0]) +
	( 4'sd 6) * $signed(input_fmap_24[7:0]) +
	( 4'sd 5) * $signed(input_fmap_25[7:0]) +
	( 5'sd 8) * $signed(input_fmap_26[7:0]) +
	( 4'sd 5) * $signed(input_fmap_27[7:0]) +
	( 5'sd 8) * $signed(input_fmap_28[7:0]) +
	( 5'sd 8) * $signed(input_fmap_29[7:0]) +
	( 5'sd 8) * $signed(input_fmap_30[7:0]) +
	( 3'sd 3) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_20;
assign conv_mac_20 = 
	( 4'sd 5) * $signed(input_fmap_0[7:0]) +
	( 4'sd 7) * $signed(input_fmap_1[7:0]) +
	( 4'sd 4) * $signed(input_fmap_2[7:0]) +
	( 2'sd 1) * $signed(input_fmap_3[7:0]) +
	( 3'sd 2) * $signed(input_fmap_4[7:0]) +
	( 4'sd 5) * $signed(input_fmap_5[7:0]) +
	( 4'sd 7) * $signed(input_fmap_6[7:0]) +
	( 2'sd 1) * $signed(input_fmap_7[7:0]) +
	( 2'sd 1) * $signed(input_fmap_8[7:0]) +
	( 4'sd 4) * $signed(input_fmap_9[7:0]) +
	( 4'sd 5) * $signed(input_fmap_11[7:0]) +
	( 3'sd 3) * $signed(input_fmap_12[7:0]) +
	( 2'sd 1) * $signed(input_fmap_13[7:0]) +
	( 4'sd 4) * $signed(input_fmap_14[7:0]) +
	( 2'sd 1) * $signed(input_fmap_15[7:0]) +
	( 4'sd 4) * $signed(input_fmap_16[7:0]) +
	( 2'sd 1) * $signed(input_fmap_17[7:0]) +
	( 3'sd 2) * $signed(input_fmap_18[7:0]) +
	( 4'sd 7) * $signed(input_fmap_19[7:0]) +
	( 4'sd 6) * $signed(input_fmap_20[7:0]) +
	( 4'sd 7) * $signed(input_fmap_21[7:0]) +
	( 3'sd 2) * $signed(input_fmap_22[7:0]) +
	( 4'sd 5) * $signed(input_fmap_23[7:0]) +
	( 2'sd 1) * $signed(input_fmap_24[7:0]) +
	( 2'sd 1) * $signed(input_fmap_25[7:0]) +
	( 4'sd 6) * $signed(input_fmap_26[7:0]) +
	( 5'sd 8) * $signed(input_fmap_27[7:0]) +
	( 5'sd 8) * $signed(input_fmap_29[7:0]) +
	( 3'sd 3) * $signed(input_fmap_30[7:0]) +
	( 4'sd 4) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_21;
assign conv_mac_21 = 
	( 2'sd 1) * $signed(input_fmap_1[7:0]) +
	( 4'sd 6) * $signed(input_fmap_3[7:0]) +
	( 4'sd 6) * $signed(input_fmap_4[7:0]) +
	( 4'sd 6) * $signed(input_fmap_6[7:0]) +
	( 2'sd 1) * $signed(input_fmap_7[7:0]) +
	( 4'sd 4) * $signed(input_fmap_10[7:0]) +
	( 4'sd 6) * $signed(input_fmap_11[7:0]) +
	( 2'sd 1) * $signed(input_fmap_12[7:0]) +
	( 3'sd 3) * $signed(input_fmap_13[7:0]) +
	( 5'sd 8) * $signed(input_fmap_14[7:0]) +
	( 4'sd 4) * $signed(input_fmap_15[7:0]) +
	( 4'sd 5) * $signed(input_fmap_16[7:0]) +
	( 2'sd 1) * $signed(input_fmap_17[7:0]) +
	( 3'sd 2) * $signed(input_fmap_18[7:0]) +
	( 2'sd 1) * $signed(input_fmap_19[7:0]) +
	( 2'sd 1) * $signed(input_fmap_22[7:0]) +
	( 2'sd 1) * $signed(input_fmap_23[7:0]) +
	( 4'sd 7) * $signed(input_fmap_24[7:0]) +
	( 4'sd 6) * $signed(input_fmap_25[7:0]) +
	( 5'sd 8) * $signed(input_fmap_26[7:0]) +
	( 3'sd 2) * $signed(input_fmap_27[7:0]) +
	( 3'sd 3) * $signed(input_fmap_28[7:0]) +
	( 2'sd 1) * $signed(input_fmap_29[7:0]) +
	( 4'sd 7) * $signed(input_fmap_30[7:0]) +
	( 4'sd 5) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_22;
assign conv_mac_22 = 
	( 3'sd 2) * $signed(input_fmap_0[7:0]) +
	( 4'sd 5) * $signed(input_fmap_1[7:0]) +
	( 3'sd 3) * $signed(input_fmap_2[7:0]) +
	( 3'sd 2) * $signed(input_fmap_3[7:0]) +
	( 2'sd 1) * $signed(input_fmap_4[7:0]) +
	( 3'sd 2) * $signed(input_fmap_5[7:0]) +
	( 4'sd 7) * $signed(input_fmap_6[7:0]) +
	( 3'sd 3) * $signed(input_fmap_7[7:0]) +
	( 4'sd 6) * $signed(input_fmap_8[7:0]) +
	( 4'sd 4) * $signed(input_fmap_9[7:0]) +
	( 2'sd 1) * $signed(input_fmap_10[7:0]) +
	( 4'sd 6) * $signed(input_fmap_11[7:0]) +
	( 4'sd 7) * $signed(input_fmap_12[7:0]) +
	( 4'sd 7) * $signed(input_fmap_13[7:0]) +
	( 4'sd 6) * $signed(input_fmap_14[7:0]) +
	( 2'sd 1) * $signed(input_fmap_15[7:0]) +
	( 2'sd 1) * $signed(input_fmap_16[7:0]) +
	( 4'sd 7) * $signed(input_fmap_17[7:0]) +
	( 4'sd 7) * $signed(input_fmap_18[7:0]) +
	( 4'sd 5) * $signed(input_fmap_19[7:0]) +
	( 4'sd 7) * $signed(input_fmap_20[7:0]) +
	( 4'sd 4) * $signed(input_fmap_22[7:0]) +
	( 4'sd 6) * $signed(input_fmap_23[7:0]) +
	( 3'sd 2) * $signed(input_fmap_24[7:0]) +
	( 3'sd 2) * $signed(input_fmap_25[7:0]) +
	( 4'sd 5) * $signed(input_fmap_26[7:0]) +
	( 3'sd 2) * $signed(input_fmap_27[7:0]) +
	( 3'sd 2) * $signed(input_fmap_28[7:0]) +
	( 5'sd 8) * $signed(input_fmap_29[7:0]) +
	( 4'sd 6) * $signed(input_fmap_30[7:0]) +
	( 4'sd 7) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_23;
assign conv_mac_23 = 
	( 4'sd 7) * $signed(input_fmap_1[7:0]) +
	( 3'sd 3) * $signed(input_fmap_2[7:0]) +
	( 4'sd 4) * $signed(input_fmap_3[7:0]) +
	( 4'sd 5) * $signed(input_fmap_4[7:0]) +
	( 4'sd 5) * $signed(input_fmap_5[7:0]) +
	( 4'sd 5) * $signed(input_fmap_6[7:0]) +
	( 4'sd 7) * $signed(input_fmap_7[7:0]) +
	( 3'sd 3) * $signed(input_fmap_8[7:0]) +
	( 4'sd 4) * $signed(input_fmap_9[7:0]) +
	( 4'sd 5) * $signed(input_fmap_10[7:0]) +
	( 4'sd 6) * $signed(input_fmap_11[7:0]) +
	( 4'sd 4) * $signed(input_fmap_12[7:0]) +
	( 4'sd 4) * $signed(input_fmap_13[7:0]) +
	( 3'sd 2) * $signed(input_fmap_14[7:0]) +
	( 5'sd 8) * $signed(input_fmap_15[7:0]) +
	( 3'sd 2) * $signed(input_fmap_16[7:0]) +
	( 4'sd 7) * $signed(input_fmap_17[7:0]) +
	( 4'sd 5) * $signed(input_fmap_18[7:0]) +
	( 3'sd 3) * $signed(input_fmap_19[7:0]) +
	( 2'sd 1) * $signed(input_fmap_20[7:0]) +
	( 2'sd 1) * $signed(input_fmap_21[7:0]) +
	( 4'sd 7) * $signed(input_fmap_22[7:0]) +
	( 3'sd 3) * $signed(input_fmap_23[7:0]) +
	( 3'sd 3) * $signed(input_fmap_24[7:0]) +
	( 3'sd 3) * $signed(input_fmap_25[7:0]) +
	( 4'sd 4) * $signed(input_fmap_26[7:0]) +
	( 4'sd 4) * $signed(input_fmap_27[7:0]) +
	( 4'sd 7) * $signed(input_fmap_28[7:0]) +
	( 5'sd 8) * $signed(input_fmap_29[7:0]) +
	( 3'sd 2) * $signed(input_fmap_30[7:0]) +
	( 4'sd 6) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_24;
assign conv_mac_24 = 
	( 4'sd 5) * $signed(input_fmap_0[7:0]) +
	( 2'sd 1) * $signed(input_fmap_1[7:0]) +
	( 3'sd 2) * $signed(input_fmap_2[7:0]) +
	( 4'sd 7) * $signed(input_fmap_3[7:0]) +
	( 4'sd 5) * $signed(input_fmap_4[7:0]) +
	( 3'sd 3) * $signed(input_fmap_5[7:0]) +
	( 3'sd 2) * $signed(input_fmap_6[7:0]) +
	( 3'sd 2) * $signed(input_fmap_7[7:0]) +
	( 4'sd 7) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 4'sd 4) * $signed(input_fmap_10[7:0]) +
	( 3'sd 2) * $signed(input_fmap_11[7:0]) +
	( 4'sd 6) * $signed(input_fmap_12[7:0]) +
	( 2'sd 1) * $signed(input_fmap_13[7:0]) +
	( 3'sd 3) * $signed(input_fmap_14[7:0]) +
	( 4'sd 6) * $signed(input_fmap_15[7:0]) +
	( 3'sd 2) * $signed(input_fmap_16[7:0]) +
	( 4'sd 5) * $signed(input_fmap_18[7:0]) +
	( 4'sd 7) * $signed(input_fmap_19[7:0]) +
	( 4'sd 5) * $signed(input_fmap_20[7:0]) +
	( 4'sd 4) * $signed(input_fmap_21[7:0]) +
	( 4'sd 5) * $signed(input_fmap_22[7:0]) +
	( 4'sd 6) * $signed(input_fmap_23[7:0]) +
	( 4'sd 7) * $signed(input_fmap_24[7:0]) +
	( 2'sd 1) * $signed(input_fmap_25[7:0]) +
	( 4'sd 5) * $signed(input_fmap_26[7:0]) +
	( 3'sd 3) * $signed(input_fmap_27[7:0]) +
	( 4'sd 5) * $signed(input_fmap_28[7:0]) +
	( 3'sd 3) * $signed(input_fmap_29[7:0]) +
	( 3'sd 2) * $signed(input_fmap_30[7:0]) +
	( 4'sd 5) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_25;
assign conv_mac_25 = 
	( 5'sd 8) * $signed(input_fmap_0[7:0]) +
	( 4'sd 7) * $signed(input_fmap_1[7:0]) +
	( 3'sd 2) * $signed(input_fmap_2[7:0]) +
	( 3'sd 2) * $signed(input_fmap_3[7:0]) +
	( 4'sd 4) * $signed(input_fmap_4[7:0]) +
	( 3'sd 3) * $signed(input_fmap_5[7:0]) +
	( 3'sd 3) * $signed(input_fmap_6[7:0]) +
	( 5'sd 8) * $signed(input_fmap_7[7:0]) +
	( 4'sd 6) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 3'sd 2) * $signed(input_fmap_10[7:0]) +
	( 3'sd 3) * $signed(input_fmap_11[7:0]) +
	( 4'sd 7) * $signed(input_fmap_12[7:0]) +
	( 4'sd 6) * $signed(input_fmap_13[7:0]) +
	( 4'sd 6) * $signed(input_fmap_14[7:0]) +
	( 4'sd 6) * $signed(input_fmap_15[7:0]) +
	( 2'sd 1) * $signed(input_fmap_17[7:0]) +
	( 3'sd 2) * $signed(input_fmap_18[7:0]) +
	( 3'sd 2) * $signed(input_fmap_19[7:0]) +
	( 4'sd 6) * $signed(input_fmap_20[7:0]) +
	( 4'sd 7) * $signed(input_fmap_21[7:0]) +
	( 5'sd 8) * $signed(input_fmap_22[7:0]) +
	( 3'sd 2) * $signed(input_fmap_23[7:0]) +
	( 3'sd 2) * $signed(input_fmap_24[7:0]) +
	( 5'sd 8) * $signed(input_fmap_25[7:0]) +
	( 3'sd 3) * $signed(input_fmap_26[7:0]) +
	( 4'sd 7) * $signed(input_fmap_27[7:0]) +
	( 4'sd 4) * $signed(input_fmap_28[7:0]) +
	( 4'sd 7) * $signed(input_fmap_29[7:0]) +
	( 4'sd 4) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_26;
assign conv_mac_26 = 
	( 5'sd 8) * $signed(input_fmap_0[7:0]) +
	( 4'sd 7) * $signed(input_fmap_1[7:0]) +
	( 4'sd 7) * $signed(input_fmap_2[7:0]) +
	( 4'sd 7) * $signed(input_fmap_4[7:0]) +
	( 4'sd 5) * $signed(input_fmap_5[7:0]) +
	( 3'sd 3) * $signed(input_fmap_6[7:0]) +
	( 2'sd 1) * $signed(input_fmap_7[7:0]) +
	( 3'sd 3) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 4'sd 7) * $signed(input_fmap_10[7:0]) +
	( 4'sd 6) * $signed(input_fmap_11[7:0]) +
	( 3'sd 3) * $signed(input_fmap_12[7:0]) +
	( 4'sd 4) * $signed(input_fmap_13[7:0]) +
	( 5'sd 8) * $signed(input_fmap_14[7:0]) +
	( 4'sd 4) * $signed(input_fmap_15[7:0]) +
	( 4'sd 4) * $signed(input_fmap_16[7:0]) +
	( 3'sd 2) * $signed(input_fmap_17[7:0]) +
	( 4'sd 7) * $signed(input_fmap_18[7:0]) +
	( 4'sd 6) * $signed(input_fmap_19[7:0]) +
	( 2'sd 1) * $signed(input_fmap_21[7:0]) +
	( 4'sd 4) * $signed(input_fmap_22[7:0]) +
	( 2'sd 1) * $signed(input_fmap_23[7:0]) +
	( 3'sd 3) * $signed(input_fmap_24[7:0]) +
	( 4'sd 5) * $signed(input_fmap_25[7:0]) +
	( 5'sd 8) * $signed(input_fmap_26[7:0]) +
	( 3'sd 2) * $signed(input_fmap_27[7:0]) +
	( 4'sd 4) * $signed(input_fmap_28[7:0]) +
	( 5'sd 8) * $signed(input_fmap_30[7:0]);

logic signed [31:0] conv_mac_27;
assign conv_mac_27 = 
	( 3'sd 3) * $signed(input_fmap_0[7:0]) +
	( 5'sd 8) * $signed(input_fmap_1[7:0]) +
	( 4'sd 6) * $signed(input_fmap_2[7:0]) +
	( 3'sd 2) * $signed(input_fmap_4[7:0]) +
	( 4'sd 5) * $signed(input_fmap_6[7:0]) +
	( 3'sd 2) * $signed(input_fmap_7[7:0]) +
	( 4'sd 4) * $signed(input_fmap_8[7:0]) +
	( 5'sd 8) * $signed(input_fmap_9[7:0]) +
	( 4'sd 4) * $signed(input_fmap_10[7:0]) +
	( 3'sd 2) * $signed(input_fmap_11[7:0]) +
	( 4'sd 6) * $signed(input_fmap_12[7:0]) +
	( 4'sd 5) * $signed(input_fmap_13[7:0]) +
	( 3'sd 3) * $signed(input_fmap_14[7:0]) +
	( 4'sd 7) * $signed(input_fmap_15[7:0]) +
	( 4'sd 6) * $signed(input_fmap_16[7:0]) +
	( 4'sd 7) * $signed(input_fmap_17[7:0]) +
	( 3'sd 3) * $signed(input_fmap_19[7:0]) +
	( 2'sd 1) * $signed(input_fmap_20[7:0]) +
	( 4'sd 7) * $signed(input_fmap_21[7:0]) +
	( 4'sd 5) * $signed(input_fmap_22[7:0]) +
	( 4'sd 4) * $signed(input_fmap_23[7:0]) +
	( 4'sd 7) * $signed(input_fmap_24[7:0]) +
	( 2'sd 1) * $signed(input_fmap_25[7:0]) +
	( 4'sd 6) * $signed(input_fmap_26[7:0]) +
	( 4'sd 4) * $signed(input_fmap_27[7:0]) +
	( 4'sd 7) * $signed(input_fmap_28[7:0]) +
	( 3'sd 2) * $signed(input_fmap_29[7:0]) +
	( 2'sd 1) * $signed(input_fmap_30[7:0]) +
	( 4'sd 5) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_28;
assign conv_mac_28 = 
	( 3'sd 3) * $signed(input_fmap_0[7:0]) +
	( 4'sd 7) * $signed(input_fmap_1[7:0]) +
	( 2'sd 1) * $signed(input_fmap_2[7:0]) +
	( 4'sd 5) * $signed(input_fmap_3[7:0]) +
	( 4'sd 5) * $signed(input_fmap_4[7:0]) +
	( 4'sd 5) * $signed(input_fmap_5[7:0]) +
	( 4'sd 7) * $signed(input_fmap_6[7:0]) +
	( 3'sd 3) * $signed(input_fmap_7[7:0]) +
	( 2'sd 1) * $signed(input_fmap_8[7:0]) +
	( 4'sd 5) * $signed(input_fmap_9[7:0]) +
	( 3'sd 2) * $signed(input_fmap_10[7:0]) +
	( 2'sd 1) * $signed(input_fmap_11[7:0]) +
	( 4'sd 5) * $signed(input_fmap_12[7:0]) +
	( 4'sd 4) * $signed(input_fmap_13[7:0]) +
	( 4'sd 6) * $signed(input_fmap_15[7:0]) +
	( 2'sd 1) * $signed(input_fmap_16[7:0]) +
	( 4'sd 4) * $signed(input_fmap_17[7:0]) +
	( 3'sd 3) * $signed(input_fmap_18[7:0]) +
	( 2'sd 1) * $signed(input_fmap_19[7:0]) +
	( 4'sd 7) * $signed(input_fmap_20[7:0]) +
	( 5'sd 8) * $signed(input_fmap_21[7:0]) +
	( 4'sd 5) * $signed(input_fmap_22[7:0]) +
	( 4'sd 5) * $signed(input_fmap_23[7:0]) +
	( 3'sd 2) * $signed(input_fmap_24[7:0]) +
	( 4'sd 4) * $signed(input_fmap_25[7:0]) +
	( 3'sd 2) * $signed(input_fmap_26[7:0]) +
	( 4'sd 4) * $signed(input_fmap_27[7:0]) +
	( 4'sd 4) * $signed(input_fmap_28[7:0]) +
	( 3'sd 3) * $signed(input_fmap_29[7:0]) +
	( 3'sd 3) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_29;
assign conv_mac_29 = 
	( 3'sd 2) * $signed(input_fmap_0[7:0]) +
	( 4'sd 7) * $signed(input_fmap_1[7:0]) +
	( 3'sd 3) * $signed(input_fmap_2[7:0]) +
	( 4'sd 4) * $signed(input_fmap_3[7:0]) +
	( 3'sd 2) * $signed(input_fmap_4[7:0]) +
	( 4'sd 5) * $signed(input_fmap_5[7:0]) +
	( 2'sd 1) * $signed(input_fmap_6[7:0]) +
	( 5'sd 8) * $signed(input_fmap_7[7:0]) +
	( 3'sd 2) * $signed(input_fmap_8[7:0]) +
	( 3'sd 2) * $signed(input_fmap_9[7:0]) +
	( 3'sd 2) * $signed(input_fmap_10[7:0]) +
	( 3'sd 2) * $signed(input_fmap_11[7:0]) +
	( 3'sd 3) * $signed(input_fmap_12[7:0]) +
	( 3'sd 3) * $signed(input_fmap_13[7:0]) +
	( 3'sd 2) * $signed(input_fmap_14[7:0]) +
	( 4'sd 5) * $signed(input_fmap_15[7:0]) +
	( 4'sd 7) * $signed(input_fmap_16[7:0]) +
	( 4'sd 4) * $signed(input_fmap_17[7:0]) +
	( 4'sd 5) * $signed(input_fmap_19[7:0]) +
	( 4'sd 5) * $signed(input_fmap_20[7:0]) +
	( 4'sd 5) * $signed(input_fmap_21[7:0]) +
	( 4'sd 5) * $signed(input_fmap_23[7:0]) +
	( 5'sd 8) * $signed(input_fmap_24[7:0]) +
	( 3'sd 3) * $signed(input_fmap_25[7:0]) +
	( 3'sd 3) * $signed(input_fmap_26[7:0]) +
	( 4'sd 6) * $signed(input_fmap_27[7:0]) +
	( 3'sd 2) * $signed(input_fmap_28[7:0]) +
	( 3'sd 2) * $signed(input_fmap_29[7:0]) +
	( 5'sd 8) * $signed(input_fmap_30[7:0]) +
	( 4'sd 6) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_30;
assign conv_mac_30 = 
	( 4'sd 4) * $signed(input_fmap_0[7:0]) +
	( 3'sd 2) * $signed(input_fmap_1[7:0]) +
	( 3'sd 2) * $signed(input_fmap_2[7:0]) +
	( 2'sd 1) * $signed(input_fmap_3[7:0]) +
	( 4'sd 6) * $signed(input_fmap_4[7:0]) +
	( 4'sd 5) * $signed(input_fmap_5[7:0]) +
	( 2'sd 1) * $signed(input_fmap_6[7:0]) +
	( 4'sd 5) * $signed(input_fmap_7[7:0]) +
	( 4'sd 5) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 5'sd 8) * $signed(input_fmap_10[7:0]) +
	( 3'sd 3) * $signed(input_fmap_11[7:0]) +
	( 4'sd 5) * $signed(input_fmap_12[7:0]) +
	( 4'sd 4) * $signed(input_fmap_13[7:0]) +
	( 2'sd 1) * $signed(input_fmap_14[7:0]) +
	( 2'sd 1) * $signed(input_fmap_15[7:0]) +
	( 4'sd 4) * $signed(input_fmap_16[7:0]) +
	( 4'sd 6) * $signed(input_fmap_17[7:0]) +
	( 2'sd 1) * $signed(input_fmap_18[7:0]) +
	( 3'sd 2) * $signed(input_fmap_19[7:0]) +
	( 4'sd 4) * $signed(input_fmap_20[7:0]) +
	( 4'sd 6) * $signed(input_fmap_21[7:0]) +
	( 3'sd 2) * $signed(input_fmap_22[7:0]) +
	( 3'sd 2) * $signed(input_fmap_23[7:0]) +
	( 4'sd 4) * $signed(input_fmap_24[7:0]) +
	( 4'sd 5) * $signed(input_fmap_25[7:0]) +
	( 2'sd 1) * $signed(input_fmap_26[7:0]) +
	( 2'sd 1) * $signed(input_fmap_27[7:0]) +
	( 2'sd 1) * $signed(input_fmap_28[7:0]) +
	( 4'sd 5) * $signed(input_fmap_29[7:0]) +
	( 5'sd 8) * $signed(input_fmap_30[7:0]) +
	( 4'sd 6) * $signed(input_fmap_31[7:0]);

logic signed [31:0] conv_mac_31;
assign conv_mac_31 = 
	( 4'sd 7) * $signed(input_fmap_0[7:0]) +
	( 3'sd 2) * $signed(input_fmap_1[7:0]) +
	( 3'sd 3) * $signed(input_fmap_2[7:0]) +
	( 4'sd 5) * $signed(input_fmap_3[7:0]) +
	( 5'sd 8) * $signed(input_fmap_4[7:0]) +
	( 4'sd 7) * $signed(input_fmap_5[7:0]) +
	( 5'sd 8) * $signed(input_fmap_6[7:0]) +
	( 3'sd 3) * $signed(input_fmap_7[7:0]) +
	( 5'sd 8) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 4'sd 4) * $signed(input_fmap_10[7:0]) +
	( 5'sd 8) * $signed(input_fmap_11[7:0]) +
	( 4'sd 7) * $signed(input_fmap_12[7:0]) +
	( 3'sd 3) * $signed(input_fmap_13[7:0]) +
	( 3'sd 2) * $signed(input_fmap_14[7:0]) +
	( 4'sd 6) * $signed(input_fmap_15[7:0]) +
	( 4'sd 6) * $signed(input_fmap_16[7:0]) +
	( 4'sd 7) * $signed(input_fmap_17[7:0]) +
	( 3'sd 2) * $signed(input_fmap_18[7:0]) +
	( 4'sd 6) * $signed(input_fmap_19[7:0]) +
	( 4'sd 6) * $signed(input_fmap_20[7:0]) +
	( 4'sd 5) * $signed(input_fmap_21[7:0]) +
	( 3'sd 3) * $signed(input_fmap_22[7:0]) +
	( 4'sd 4) * $signed(input_fmap_23[7:0]) +
	( 4'sd 7) * $signed(input_fmap_24[7:0]) +
	( 4'sd 6) * $signed(input_fmap_26[7:0]) +
	( 4'sd 5) * $signed(input_fmap_27[7:0]) +
	( 4'sd 7) * $signed(input_fmap_28[7:0]) +
	( 4'sd 6) * $signed(input_fmap_29[7:0]) +
	( 4'sd 6) * $signed(input_fmap_30[7:0]) +
	( 3'sd 3) * $signed(input_fmap_31[7:0]);

logic [31:0] bias_add_0;
assign bias_add_0 = conv_mac_0 + 3'd2;
logic [31:0] bias_add_1;
assign bias_add_1 = conv_mac_1 + 3'd3;
logic [31:0] bias_add_2;
assign bias_add_2 = conv_mac_2 + 3'd3;
logic [31:0] bias_add_3;
assign bias_add_3 = conv_mac_3 + 5'd8;
logic [31:0] bias_add_4;
assign bias_add_4 = conv_mac_4 + 3'd2;
logic [31:0] bias_add_5;
assign bias_add_5 = conv_mac_5 + 4'd5;
logic [31:0] bias_add_6;
assign bias_add_6 = conv_mac_6 + 4'd7;
logic [31:0] bias_add_7;
assign bias_add_7 = conv_mac_7 + 5'd8;
logic [31:0] bias_add_8;
assign bias_add_8 = conv_mac_8 + 3'd3;
logic [31:0] bias_add_9;
assign bias_add_9 = conv_mac_9 + 4'd4;
logic [31:0] bias_add_10;
assign bias_add_10 = conv_mac_10 + 3'd3;
logic [31:0] bias_add_11;
assign bias_add_11 = conv_mac_11 + 2'd1;
logic [31:0] bias_add_12;
assign bias_add_12 = conv_mac_12;
logic [31:0] bias_add_13;
assign bias_add_13 = conv_mac_13 + 3'd3;
logic [31:0] bias_add_14;
assign bias_add_14 = conv_mac_14 + 4'd6;
logic [31:0] bias_add_15;
assign bias_add_15 = conv_mac_15 + 2'd1;
logic [31:0] bias_add_16;
assign bias_add_16 = conv_mac_16 + 2'd1;
logic [31:0] bias_add_17;
assign bias_add_17 = conv_mac_17 + 4'd7;
logic [31:0] bias_add_18;
assign bias_add_18 = conv_mac_18 + 4'd7;
logic [31:0] bias_add_19;
assign bias_add_19 = conv_mac_19 + 4'd6;
logic [31:0] bias_add_20;
assign bias_add_20 = conv_mac_20 + 3'd2;
logic [31:0] bias_add_21;
assign bias_add_21 = conv_mac_21 + 3'd2;
logic [31:0] bias_add_22;
assign bias_add_22 = conv_mac_22 + 5'd8;
logic [31:0] bias_add_23;
assign bias_add_23 = conv_mac_23 + 4'd6;
logic [31:0] bias_add_24;
assign bias_add_24 = conv_mac_24 + 4'd4;
logic [31:0] bias_add_25;
assign bias_add_25 = conv_mac_25 + 4'd5;
logic [31:0] bias_add_26;
assign bias_add_26 = conv_mac_26 + 4'd7;
logic [31:0] bias_add_27;
assign bias_add_27 = conv_mac_27;
logic [31:0] bias_add_28;
assign bias_add_28 = conv_mac_28 + 2'd1;
logic [31:0] bias_add_29;
assign bias_add_29 = conv_mac_29 + 4'd6;
logic [31:0] bias_add_30;
assign bias_add_30 = conv_mac_30 + 3'd2;
logic [31:0] bias_add_31;
assign bias_add_31 = conv_mac_31 + 3'd2;

logic [7:0] relu_0;
assign relu_0[7:0] = (bias_add_0[31]==0) ? ((bias_add_0<3'd6) ? {{bias_add_0[31],bias_add_0[9:3]}} :'d6) : '0;
logic [7:0] relu_1;
assign relu_1[7:0] = (bias_add_1[31]==0) ? ((bias_add_1<3'd6) ? {{bias_add_1[31],bias_add_1[9:3]}} :'d6) : '0;
logic [7:0] relu_2;
assign relu_2[7:0] = (bias_add_2[31]==0) ? ((bias_add_2<3'd6) ? {{bias_add_2[31],bias_add_2[9:3]}} :'d6) : '0;
logic [7:0] relu_3;
assign relu_3[7:0] = (bias_add_3[31]==0) ? ((bias_add_3<3'd6) ? {{bias_add_3[31],bias_add_3[9:3]}} :'d6) : '0;
logic [7:0] relu_4;
assign relu_4[7:0] = (bias_add_4[31]==0) ? ((bias_add_4<3'd6) ? {{bias_add_4[31],bias_add_4[9:3]}} :'d6) : '0;
logic [7:0] relu_5;
assign relu_5[7:0] = (bias_add_5[31]==0) ? ((bias_add_5<3'd6) ? {{bias_add_5[31],bias_add_5[9:3]}} :'d6) : '0;
logic [7:0] relu_6;
assign relu_6[7:0] = (bias_add_6[31]==0) ? ((bias_add_6<3'd6) ? {{bias_add_6[31],bias_add_6[9:3]}} :'d6) : '0;
logic [7:0] relu_7;
assign relu_7[7:0] = (bias_add_7[31]==0) ? ((bias_add_7<3'd6) ? {{bias_add_7[31],bias_add_7[9:3]}} :'d6) : '0;
logic [7:0] relu_8;
assign relu_8[7:0] = (bias_add_8[31]==0) ? ((bias_add_8<3'd6) ? {{bias_add_8[31],bias_add_8[9:3]}} :'d6) : '0;
logic [7:0] relu_9;
assign relu_9[7:0] = (bias_add_9[31]==0) ? ((bias_add_9<3'd6) ? {{bias_add_9[31],bias_add_9[9:3]}} :'d6) : '0;
logic [7:0] relu_10;
assign relu_10[7:0] = (bias_add_10[31]==0) ? ((bias_add_10<3'd6) ? {{bias_add_10[31],bias_add_10[9:3]}} :'d6) : '0;
logic [7:0] relu_11;
assign relu_11[7:0] = (bias_add_11[31]==0) ? ((bias_add_11<3'd6) ? {{bias_add_11[31],bias_add_11[9:3]}} :'d6) : '0;
logic [7:0] relu_12;
assign relu_12[7:0] = (bias_add_12[31]==0) ? ((bias_add_12<3'd6) ? {{bias_add_12[31],bias_add_12[9:3]}} :'d6) : '0;
logic [7:0] relu_13;
assign relu_13[7:0] = (bias_add_13[31]==0) ? ((bias_add_13<3'd6) ? {{bias_add_13[31],bias_add_13[9:3]}} :'d6) : '0;
logic [7:0] relu_14;
assign relu_14[7:0] = (bias_add_14[31]==0) ? ((bias_add_14<3'd6) ? {{bias_add_14[31],bias_add_14[9:3]}} :'d6) : '0;
logic [7:0] relu_15;
assign relu_15[7:0] = (bias_add_15[31]==0) ? ((bias_add_15<3'd6) ? {{bias_add_15[31],bias_add_15[9:3]}} :'d6) : '0;
logic [7:0] relu_16;
assign relu_16[7:0] = (bias_add_16[31]==0) ? ((bias_add_16<3'd6) ? {{bias_add_16[31],bias_add_16[9:3]}} :'d6) : '0;
logic [7:0] relu_17;
assign relu_17[7:0] = (bias_add_17[31]==0) ? ((bias_add_17<3'd6) ? {{bias_add_17[31],bias_add_17[9:3]}} :'d6) : '0;
logic [7:0] relu_18;
assign relu_18[7:0] = (bias_add_18[31]==0) ? ((bias_add_18<3'd6) ? {{bias_add_18[31],bias_add_18[9:3]}} :'d6) : '0;
logic [7:0] relu_19;
assign relu_19[7:0] = (bias_add_19[31]==0) ? ((bias_add_19<3'd6) ? {{bias_add_19[31],bias_add_19[9:3]}} :'d6) : '0;
logic [7:0] relu_20;
assign relu_20[7:0] = (bias_add_20[31]==0) ? ((bias_add_20<3'd6) ? {{bias_add_20[31],bias_add_20[9:3]}} :'d6) : '0;
logic [7:0] relu_21;
assign relu_21[7:0] = (bias_add_21[31]==0) ? ((bias_add_21<3'd6) ? {{bias_add_21[31],bias_add_21[9:3]}} :'d6) : '0;
logic [7:0] relu_22;
assign relu_22[7:0] = (bias_add_22[31]==0) ? ((bias_add_22<3'd6) ? {{bias_add_22[31],bias_add_22[9:3]}} :'d6) : '0;
logic [7:0] relu_23;
assign relu_23[7:0] = (bias_add_23[31]==0) ? ((bias_add_23<3'd6) ? {{bias_add_23[31],bias_add_23[9:3]}} :'d6) : '0;
logic [7:0] relu_24;
assign relu_24[7:0] = (bias_add_24[31]==0) ? ((bias_add_24<3'd6) ? {{bias_add_24[31],bias_add_24[9:3]}} :'d6) : '0;
logic [7:0] relu_25;
assign relu_25[7:0] = (bias_add_25[31]==0) ? ((bias_add_25<3'd6) ? {{bias_add_25[31],bias_add_25[9:3]}} :'d6) : '0;
logic [7:0] relu_26;
assign relu_26[7:0] = (bias_add_26[31]==0) ? ((bias_add_26<3'd6) ? {{bias_add_26[31],bias_add_26[9:3]}} :'d6) : '0;
logic [7:0] relu_27;
assign relu_27[7:0] = (bias_add_27[31]==0) ? ((bias_add_27<3'd6) ? {{bias_add_27[31],bias_add_27[9:3]}} :'d6) : '0;
logic [7:0] relu_28;
assign relu_28[7:0] = (bias_add_28[31]==0) ? ((bias_add_28<3'd6) ? {{bias_add_28[31],bias_add_28[9:3]}} :'d6) : '0;
logic [7:0] relu_29;
assign relu_29[7:0] = (bias_add_29[31]==0) ? ((bias_add_29<3'd6) ? {{bias_add_29[31],bias_add_29[9:3]}} :'d6) : '0;
logic [7:0] relu_30;
assign relu_30[7:0] = (bias_add_30[31]==0) ? ((bias_add_30<3'd6) ? {{bias_add_30[31],bias_add_30[9:3]}} :'d6) : '0;
logic [7:0] relu_31;
assign relu_31[7:0] = (bias_add_31[31]==0) ? ((bias_add_31<3'd6) ? {{bias_add_31[31],bias_add_31[9:3]}} :'d6) : '0;

assign output_act = {
	relu_31,
	relu_30,
	relu_29,
	relu_28,
	relu_27,
	relu_26,
	relu_25,
	relu_24,
	relu_23,
	relu_22,
	relu_21,
	relu_20,
	relu_19,
	relu_18,
	relu_17,
	relu_16,
	relu_15,
	relu_14,
	relu_13,
	relu_12,
	relu_11,
	relu_10,
	relu_9,
	relu_8,
	relu_7,
	relu_6,
	relu_5,
	relu_4,
	relu_3,
	relu_2,
	relu_1,
	relu_0
};

endmodule

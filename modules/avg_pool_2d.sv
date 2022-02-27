
module avg_pool_2d
#(
    parameter NBITS = 32,
    parameter NFMAPS = 32,
    parameter KER_SIZE = 7
)
(
    input logic clk,
    input logic rstn,
    input logic valid,
    input logic [NFMAPS*NBITS*KER_SIZE*KER_SIZE-1:0] input_act,
    //input logic [NBITS*KER_SIZE*KER_SIZE-1:0] input_act [NFMAPS-1:0],
    output logic [NBITS*NFMAPS-1:0] output_act,
    output logic ready
);

logic [NFMAPS*NBITS*KER_SIZE*KER_SIZE-1:0] input_act_ff;

always_ff @(posedge clk) begin
    if (rstn == 0) begin
        ready <= '0;
    end
    else begin
        ready <= valid;
    end
end

genvar i;
generate
for (i = 0; i < NFMAPS; i++) begin

    always_ff @(posedge clk) begin
        if (rstn == 0) begin
            input_act_ff[(i+1)*NBITS*KER_SIZE*KER_SIZE-1:i*NBITS*KER_SIZE*KER_SIZE] <= '0;
        end
        else begin
            input_act_ff[(i+1)*NBITS*KER_SIZE*KER_SIZE-1:i*NBITS*KER_SIZE*KER_SIZE] <= input_act[(i+1)*NBITS*KER_SIZE*KER_SIZE-1:i*NBITS*KER_SIZE*KER_SIZE];
        end
    end

end
endgenerate

generate
    for (i = 0; i < NFMAPS; i++) begin
			if (KER_SIZE==2)
			begin
        avg_pool_2d_slice #(
            .NBITS (NBITS),
            .KER_SIZE (KER_SIZE)
        ) avg_pool_2d_slice_inst (
            .input_act (input_act_ff[(i+1)*NBITS*KER_SIZE*KER_SIZE-1:i*NBITS*KER_SIZE*KER_SIZE]),
            .output_act (output_act[(i+1)*NBITS-1:(i*NBITS)])
        );
			end
			else if (KER_SIZE==7)
			begin
				   avg_pool_7d_slice #(
            .NBITS (NBITS),
            .KER_SIZE (KER_SIZE)
        ) avg_pool_7d_slice_inst (
            .input_act (input_act_ff[(i+1)*NBITS*KER_SIZE*KER_SIZE-1:i*NBITS*KER_SIZE*KER_SIZE]),
            .output_act (output_act[(i+1)*NBITS-1:(i*NBITS)])
        );
			end
    end
endgenerate

endmodule

// TODO: only works for kernel size of 2x2
// NOTE: result of +-XXX.5 always rounded down
module avg_pool_2d_slice
#(
    parameter NBITS = 32,
    parameter KER_SIZE = 2
)
(
    input logic [NBITS*KER_SIZE*KER_SIZE-1:0] input_act,
    output logic [NBITS-1:0] output_act
);

logic [NBITS-1:0] sum;

always_comb begin
    sum =
        $signed(input_act[1*NBITS-1:0*NBITS]) +
        $signed(input_act[2*NBITS-1:1*NBITS]) +
        $signed(input_act[3*NBITS-1:2*NBITS]) +
        $signed(input_act[4*NBITS-1:3*NBITS]);
    output_act = $signed(sum) >>> 2;
end

endmodule

module avg_pool_7d_slice
#(
    parameter NBITS = 32,
    parameter KER_SIZE = 7
)
(
    input logic [NBITS*KER_SIZE*KER_SIZE-1:0] input_act,
    output logic [NBITS-1:0] output_act
);

logic [(NBITS+6)-1:0] sum;
logic [(2*(NBITS+6)-16)-1:0] average;
 logic [2*(NBITS+6)-1:0] intermediate;

always_comb begin
    sum =
        $signed(input_act[01*NBITS-1:0*NBITS]) +
        $signed(input_act[02*NBITS-1:01*NBITS]) +
        $signed(input_act[03*NBITS-1:02*NBITS]) +
        $signed(input_act[04*NBITS-1:03*NBITS]) +
        $signed(input_act[05*NBITS-1:04*NBITS]) +
        $signed(input_act[06*NBITS-1:05*NBITS]) +
        $signed(input_act[07*NBITS-1:06*NBITS]) +
        $signed(input_act[08*NBITS-1:07*NBITS]) +
        $signed(input_act[09*NBITS-1:08*NBITS]) +
        $signed(input_act[10*NBITS-1:09*NBITS]) +
        $signed(input_act[11*NBITS-1:10*NBITS]) +
        $signed(input_act[12*NBITS-1:11*NBITS]) +
        $signed(input_act[13*NBITS-1:12*NBITS]) +
        $signed(input_act[14*NBITS-1:13*NBITS]) +
        $signed(input_act[15*NBITS-1:14*NBITS]) +
        $signed(input_act[16*NBITS-1:15*NBITS]) +
        $signed(input_act[17*NBITS-1:16*NBITS]) +
        $signed(input_act[18*NBITS-1:17*NBITS]) +
        $signed(input_act[19*NBITS-1:18*NBITS]) +
        $signed(input_act[20*NBITS-1:19*NBITS]) +
        $signed(input_act[21*NBITS-1:20*NBITS]) +
        $signed(input_act[22*NBITS-1:21*NBITS]) +
        $signed(input_act[23*NBITS-1:22*NBITS]) +
        $signed(input_act[24*NBITS-1:23*NBITS]) +
        $signed(input_act[25*NBITS-1:24*NBITS]) +
        $signed(input_act[26*NBITS-1:25*NBITS]) +
        $signed(input_act[27*NBITS-1:26*NBITS]) +
        $signed(input_act[28*NBITS-1:27*NBITS]) +
        $signed(input_act[29*NBITS-1:28*NBITS]) +
        $signed(input_act[30*NBITS-1:29*NBITS]) +
        $signed(input_act[31*NBITS-1:30*NBITS]) +
        $signed(input_act[32*NBITS-1:31*NBITS]) +
        $signed(input_act[33*NBITS-1:32*NBITS]) +
        $signed(input_act[34*NBITS-1:33*NBITS]) +
        $signed(input_act[35*NBITS-1:34*NBITS]) +
        $signed(input_act[36*NBITS-1:35*NBITS]) +
        $signed(input_act[37*NBITS-1:36*NBITS]) +
        $signed(input_act[38*NBITS-1:37*NBITS]) +
        $signed(input_act[39*NBITS-1:38*NBITS]) +
        $signed(input_act[40*NBITS-1:39*NBITS]) +
        $signed(input_act[41*NBITS-1:40*NBITS]) +
        $signed(input_act[42*NBITS-1:41*NBITS]) +
        $signed(input_act[43*NBITS-1:42*NBITS]) +
        $signed(input_act[44*NBITS-1:43*NBITS]) +
        $signed(input_act[45*NBITS-1:44*NBITS]) +
        $signed(input_act[46*NBITS-1:45*NBITS]) +
        $signed(input_act[47*NBITS-1:46*NBITS]) +
        $signed(input_act[48*NBITS-1:47*NBITS]) +
        $signed(input_act[49*NBITS-1:48*NBITS]) ;
   // average = $signed(sum) / 16'd 49;
//   average = ($signed(sum)*1337) >>> 16;  // for divide by 49 
		// just used for synthesis purpose, delete below line later
	//	output_act = average[15:0] + average[31:16];
output_act = average[((2*(NBITS+6)-16)/2)-1:0] + average[(2*(NBITS+6)-16)-1:((2*(NBITS+6)-16)/2)];

end

//array_multiplier array_multiplier_inst(sum,64'd1337,intermediate);
mult #(.width(NBITS+6)) mult_inst (sum[(NBITS+6)-1:0],(NBITS+6)'d1337,intermediate);

assign average = intermediate>>>16;

endmodule

module mult #(parameter width = 38) (a,b,y); 

input [width-1:0] a,b;
output logic [2*width -1:0] y;
assign y = a*b;

endmodule
/*
module array_multiplier(a, b, y);

parameter width = 64;
input [width-1:0] a, b;
output [width-1:0] y;

wire [width*width-1:0] partials;

genvar i;
assign partials[width-1 : 0] = a[0] ? b : 0;
generate for (i = 1; i < width; i = i+1) begin:gen
    assign partials[width*(i+1)-1 : width*i] = (a[i] ? b << i : 0) +
                                   partials[width*i-1 : width*(i-1)];
end endgenerate

assign y = partials[width*width-1 : width*(width-1)];

endmodule
*/



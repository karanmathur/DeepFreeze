/* 
module top (input logic clk, input logic rstn, input logic valid);
   
    parameter KER_SIZE = 3;
           parameter BITWIDTH = 8;
           parameter NFMAPS   = 3;
           parameter STRIDE   = 1;
           parameter PAD      = 1;
           parameter NW       = 32;
           parameter AW       = $clog2(NW);
   logic [NFMAPS*BITWIDTH-1:0] D;
   logic [NFMAPS*KER_SIZE*KER_SIZE*BITWIDTH-1:0] Q;
   logic ready;
   buffer_main #(.KER_SIZE(KER_SIZE),.BITWIDTH(BITWIDTH),.NFMAPS(NFMAPS),.STRIDE(STRIDE),.PAD(PAD),.NW(NW),.AW(AW)) buffer_main_inst (.clk(clk),.rstn(rstn),.valid(valid),.D(D),.Q(Q),.ready(ready));
   endmodule
  */

module buffer_main
#(
    parameter KER_SIZE = 3,
    parameter BITWIDTH = 8,
    parameter NFMAPS   = 3,
    parameter STRIDE   = 1,
    parameter PAD      = 1,
    parameter NW       = 32,
    parameter AW       = $clog2(NW)
)
(
    input logic clk,
    input logic rstn,
    input logic valid,
    input logic [NFMAPS*BITWIDTH-1:0] D,
    //output logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] Q [NFMAPS-1:0],
    output logic [NFMAPS*KER_SIZE*KER_SIZE*BITWIDTH-1:0] Q,
    output logic ready
);

localparam DW = NFMAPS*BITWIDTH;
genvar i,j;

logic [AW-1:0] address_wire                                            ;
logic [KER_SIZE-1:0] write_en_wire                                     ;
logic [KER_SIZE-1:0] read_en_wire                                      ; 
logic [(KER_SIZE)*DW-1:0] sram_read_data_wire                          ;
logic [(KER_SIZE-1)*DW-1:0] sram_km1_read_data                         ; //kernel size - 1 read data coming from SRAM
logic [DW-1:0] incoming_px                                             ; //incoming_pixel
logic [DW-1:0] incoming_px_D1                                          ; //incoming_pixel_delayed

//logic [DW-1:0] sram_read_data_rowwise [KER_SIZE-1:0]                   ;
logic [KER_SIZE*DW-1:0] sram_read_data_rowwise;

//logic [KER_SIZE*BITWIDTH-1:0] pixel_in_fmap_wise [NFMAPS-1:0]          ;
logic [NFMAPS*KER_SIZE*BITWIDTH-1:0] pixel_in_fmap_wise;

//logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_out_fmap_wise [NFMAPS-1:0];
logic [NFMAPS*KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_out_fmap_wise;
logic [3-1:0] col_ptr_wire                                             ;
logic [3-1:0] init_col_ptr_wire                                        ;
logic [3-1:0] col_stride_counter                                       ;
logic [3-1:0] col_stride_counter_nxt                                   ;
logic sram_is_ready,sram_is_ready_D1                                   ;
logic valid_D1                                                         ;
logic ready_wire                                                       ;
logic line_buf_is_ready                                                ;
//PAD signals
logic right_pad_valid                                                  ;
logic bottom_pad_mask                                                  ;
logic [KER_SIZE-1:0] top_pad_mask	                                     ;
logic [KER_SIZE-1:0] left_pad_mask	                                   ;
logic [KER_SIZE-1:0] right_pad_mask	                                   ;
//input flops
logic valid_reg                                                        ;
logic [NFMAPS*BITWIDTH-1:0]D_reg                                       ;
logic row_complete_wire                                                ;
 
assign valid_reg = valid;
assign D_reg = bottom_pad_mask ? D & {NFMAPS*BITWIDTH{1'b0}} : D; //mask dummy data as zeros at bottom pad
assign incoming_px = D_reg;

// delay for incoming new row
always_ff @(posedge clk) 
begin
    if (!rstn) 
        incoming_px_D1 			<= 0;
    else if(sram_is_ready) 
        incoming_px_D1 			<= incoming_px;
    else 
        incoming_px_D1 			<= 0;
end

sram_controller #(
    .KER_SIZE 		(KER_SIZE	),
    .BITWIDTH 		(BITWIDTH	),
    .STRIDE 			(STRIDE		),
    .PAD 					(PAD			),
    .NFMAPS 			(NFMAPS		),
    .INPUT_X_DIM 	(NW				),
    .AW 					(AW				)
) sram_ctrl_inst (
    .clk 			 				(clk							),
    .rstn 			 			(rstn							),
    .valid 			 			(valid_reg				),
    .addr 			 			(address_wire			),
    .write_en 				(write_en_wire		),
    .read_en 		 			(read_en_wire 		),
    .row_is_complete 	(row_complete_wire),
		.top_pad_mask	 		(top_pad_mask			),
		.bottom_pad_mask 	(bottom_pad_mask	),
    .ready 			 			(sram_is_ready		)
);

// TODO: generalize sram array module to different kernel sizes
generate
if (KER_SIZE == 3)
begin
    sram_array_k3 #(
        .KER_SIZE (KER_SIZE),
        .DW 			(DW			),
        .NW 			(NW			),
        .AW 			(AW			)
    ) sram_array_k3_inst (
        .clk 	(clk								),
        .rstn (rstn								),
        .a 		(address_wire				),
        .wen 	(write_en_wire			),
        .ren 	(read_en_wire				),
        .d 		(D_reg							),
        .q 		(sram_km1_read_data	)
    );
		assign sram_read_data_wire = {incoming_px_D1,sram_km1_read_data};
end    
else if (KER_SIZE == 2) 
begin
    sram_array_k2 #(
        .KER_SIZE (KER_SIZE),
        .DW 			(DW),
        .NW 			(NW),
        .AW 			(AW)
    ) sram_array_k2_inst (
        .clk 	(clk								),
        .rstn (rstn								),
        .a 		(address_wire				),
        .wen 	(write_en_wire			),
        .ren 	(read_en_wire				),
        .d 		(D_reg							),
        .q 		(sram_km1_read_data	)
    );
		assign sram_read_data_wire = {incoming_px_D1,sram_km1_read_data};
 end        
else if(KER_SIZE == 5)
begin
    sram_array_k5 #(
         .KER_SIZE (KER_SIZE),
         .DW 			 (DW			),
         .NW 			 (NW			),
         .AW 			 (AW			)
    ) sram_array_k5_inst (
        .clk 	(clk								),
        .rstn (rstn								),
        .a 		(address_wire				),
        .wen 	(write_en_wire			),
        .ren 	(read_en_wire				),
        .d 		(D_reg							),
        .q 		(sram_km1_read_data	)
    );
		assign sram_read_data_wire = {incoming_px_D1,sram_km1_read_data};
end        
else if(KER_SIZE == 7)
begin
    sram_array_k7 #(
         .KER_SIZE (KER_SIZE),
         .DW 			 (DW			),
         .NW 			 (NW			),
         .AW 			 (AW			)
    ) sram_array_k7_inst (
        .clk 	(clk								),
        .rstn (rstn								),
        .a 		(address_wire				),
        .wen 	(write_en_wire			),
        .ren 	(read_en_wire				),
        .d 		(D_reg							),
        .q 		(sram_km1_read_data	)
    );
		assign sram_read_data_wire = {incoming_px_D1,sram_km1_read_data};
end 
endgenerate

// delay for sram read cycle, sram data is ready after a cycle when sram is ready
always_ff @(posedge clk) begin
    if (!rstn) begin
        valid_D1 			    <= '0;
        sram_is_ready_D1 	<= '0;
    end
    else begin
        valid_D1 			    <= valid_reg;
        sram_is_ready_D1 	<= sram_is_ready;
    end
end

line_buffer_controller #(
    .KER_SIZE 		(KER_SIZE	),
    .INPUT_X_DIM 	(NW			),
    .PAD 			(PAD		)
) line_buffer_controller_inst (
    .clk 						  (clk													),
    .rstn 					  (rstn													),
    .valid 					  (valid_D1 && sram_is_ready_D1	),
    .row_complete 		(row_complete_wire						),
    .col_ptr 			    (col_ptr_wire									),
    .right_pad_valid 	(right_pad_valid							),
    .left_pad_mask 		(left_pad_mask								),
    .right_pad_mask 	(right_pad_mask								),
    .init_col_ptr 		(init_col_ptr_wire						)
);

generate
    for (i = 0; i < KER_SIZE; i++) begin
    always@(posedge clk) begin 
       sram_read_data_rowwise[(i+1)*DW-1:i*DW] = sram_read_data_wire [(i+1)*DW-1:(i*DW)] & {KER_SIZE*DW{!top_pad_mask[i]}};
    end   
    end

    for (j = 0; j < NFMAPS; j++) begin
        for (i = 0; i < KER_SIZE; i++) begin
        always@(posedge clk) begin 
            pixel_in_fmap_wise[(j*KER_SIZE*BITWIDTH + i*BITWIDTH)+:BITWIDTH] = sram_read_data_rowwise[(j*KER_SIZE*BITWIDTH + i*BITWIDTH)+:BITWIDTH];
        end    
        end
    end

    // TODO: generalize line buffer arrays to different kernel sizes
    for (i = 0; i < NFMAPS; i++) begin
        if (KER_SIZE == 3) begin
            line_buffer_array_k3 #      (
                .KER_SIZE               (KER_SIZE),
                .BITWIDTH               (BITWIDTH),
								.PAD                    (PAD),
                .AW 		                (AW)) 
								line_buffer_array_k3_inst (
                .clk                    (clk),
                .rstn                   (rstn),
                .pixel_in               (pixel_in_fmap_wise[(i+1)*KER_SIZE*BITWIDTH-1:i*KER_SIZE*BITWIDTH]),
                .col_ptr                (col_ptr_wire),
                .init_col_ptr           (init_col_ptr_wire),
								.left_pad_mask 	        (left_pad_mask),
								.right_pad_mask         (right_pad_mask),
                .pixel_out              (pixel_out_fmap_wise[(i+1)*KER_SIZE*KER_SIZE*BITWIDTH-1:i*KER_SIZE*KER_SIZE*BITWIDTH])
            );
        end
        else if (KER_SIZE == 2) begin
            line_buffer_array_k2 #      (
                .KER_SIZE               (KER_SIZE),
                .BITWIDTH               (BITWIDTH),
                .AW                     (AW)
            ) line_buffer_array_k2_inst (
                .clk                    (clk),
                .rstn                   (rstn),
                .pixel_in               (pixel_in_fmap_wise [(i+1)*KER_SIZE*BITWIDTH-1:i*KER_SIZE*BITWIDTH]),
                .col_ptr                (col_ptr_wire),
                .init_col_ptr           (init_col_ptr_wire),
                .pixel_out              (pixel_out_fmap_wise [(i+1)*KER_SIZE*KER_SIZE*BITWIDTH-1:i*KER_SIZE*KER_SIZE*BITWIDTH])
            );
        end
        else if (KER_SIZE == 5) begin
            line_buffer_array_k5 #      (
                .KER_SIZE               (KER_SIZE),
                .PAD                    (PAD),
                .BITWIDTH               (BITWIDTH),
                .AW                     (AW)
            ) line_buffer_array_k5_inst (
                .clk 			              (clk),
                .rstn 			            (rstn),
                .pixel_in 		          (pixel_in_fmap_wise [(i+1)*KER_SIZE*BITWIDTH-1:i*KER_SIZE*BITWIDTH]),
                .col_ptr 		            (col_ptr_wire),
                .init_col_ptr 	        (init_col_ptr_wire),
                .left_pad_mask 	        (left_pad_mask),
                .right_pad_mask         (right_pad_mask),
                .pixel_out 		          (pixel_out_fmap_wise [(i+1)*KER_SIZE*KER_SIZE*BITWIDTH-1:i*KER_SIZE*KER_SIZE*BITWIDTH])
            );
        end
        else if (KER_SIZE == 7) begin
            line_buffer_array_k7 #      (
                .KER_SIZE               (KER_SIZE),
                .PAD                    (PAD),
                .BITWIDTH               (BITWIDTH),
                .AW                     (AW)
            ) line_buffer_array_k7_inst (
                .clk 			              (clk),
                .rstn 			            (rstn),
                .pixel_in 		          (pixel_in_fmap_wise [(i+1)*KER_SIZE*BITWIDTH-1:i*KER_SIZE*BITWIDTH]),
                .col_ptr 		            (col_ptr_wire),
                .init_col_ptr 	        (init_col_ptr_wire),
                .left_pad_mask 	        (left_pad_mask),
                .right_pad_mask         (right_pad_mask),
                .pixel_out 		          (pixel_out_fmap_wise [(i+1)*KER_SIZE*KER_SIZE*BITWIDTH-1:i*KER_SIZE*KER_SIZE*BITWIDTH])
            );
        end
    end

    for (i = 0; i < NFMAPS; i++) begin
        assign Q[(i+1)*KER_SIZE*KER_SIZE*BITWIDTH-1:(i*KER_SIZE*KER_SIZE*BITWIDTH)] = pixel_out_fmap_wise[(i+1)*KER_SIZE*KER_SIZE*BITWIDTH-1:i*KER_SIZE*KER_SIZE*BITWIDTH];
    end

endgenerate

// ready_logic
always_ff @(posedge clk) begin
    if (!rstn) begin
        col_stride_counter <= '0;
    end
    else if (row_complete_wire) begin
        col_stride_counter <= '0;
    end
    else begin
        col_stride_counter <= col_stride_counter_nxt;
    end
end

// because of one cycle delay of line buffer
always_ff @(posedge clk) begin
    if (!rstn) begin
        ready_wire <= '0;
    end
    else begin
        ready_wire <= (col_stride_counter==0) && (line_buf_is_ready);
    end
end

assign line_buf_is_ready = (init_col_ptr_wire == KER_SIZE-1 && valid_D1);
assign col_stride_counter_nxt = (line_buf_is_ready) ? ((col_stride_counter<STRIDE-1'd1)?col_stride_counter+1'd1:'0 ): col_stride_counter;
assign ready = ready_wire || right_pad_valid;

endmodule



module line_buffer_array_k7
#(
    parameter KER_SIZE = 7,
    parameter BITWIDTH = 8,
    parameter AW       = 8,
    parameter PAD      = 1
)
(
    input logic clk,
    input logic rstn,
    input logic [BITWIDTH*KER_SIZE-1:0] pixel_in,
    input logic [3-1:0] col_ptr,
    input logic [3-1:0] init_col_ptr,
    input logic [KER_SIZE-1:0] left_pad_mask,
    input logic [KER_SIZE-1:0] right_pad_mask,
    output logic [BITWIDTH*KER_SIZE*KER_SIZE-1:0] pixel_out   
);

// wires
//logic [KER_SIZE*BITWIDTH-1:0] pixel_col [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_col;

//logic [KER_SIZE*BITWIDTH-1:0] pixel_row [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_row;

//logic [KER_SIZE*BITWIDTH-1:0] padded_pixel_row [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] padded_pixel_row;

//logic [KER_SIZE*BITWIDTH-1:0] left_padded_pixel_col [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] left_padded_pixel_col;

//logic [KER_SIZE*BITWIDTH-1:0] right_padded_pixel_col [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] right_padded_pixel_col; 

logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_out_wire;
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] stored_pixel_out;
logic ready;

logic [8-1:0] global_col_ptr;
logic ready_reg;

// reg array
genvar i,j;
generate

for (i = 0; i < KER_SIZE; i++) begin
    d_flop #(
        .BITWIDTH (BITWIDTH*KER_SIZE)
    ) reg_inst (
        .clk (clk),
        .rstn (rstn),
        .valid (col_ptr == i),
        .D (pixel_in),
        .Q (pixel_col[(i+1)*KER_SIZE*BITWIDTH -1:i*KER_SIZE*BITWIDTH])
    ); // each d_flop stores a column of data
always@(posedge clk) begin 
 left_padded_pixel_col[(i+1)*KER_SIZE*BITWIDTH -1:i*KER_SIZE*BITWIDTH] = (left_pad_mask[i]==1)? {(KER_SIZE*BITWIDTH){1'b0}} : pixel_col[(i+1)*KER_SIZE*BITWIDTH -1:i*KER_SIZE*BITWIDTH];//left padding
end 
end
endgenerate

// reshape
always_comb begin
    case (1'b1)
(col_ptr == 'd4): pixel_out_wire = {pixel_in[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[4*7*BITWIDTH-1:4*6*BITWIDTH],left_padded_pixel_col[3*7*BITWIDTH-1:3*6*BITWIDTH],left_padded_pixel_col[2*7*BITWIDTH-1:2*6*BITWIDTH],left_padded_pixel_col[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[7*7*BITWIDTH-1:7*6*BITWIDTH],left_padded_pixel_col[6*7*BITWIDTH-1:6*6*BITWIDTH],
                                    pixel_in[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[4*6*BITWIDTH-1:4*5*BITWIDTH],left_padded_pixel_col[3*6*BITWIDTH-1:3*5*BITWIDTH],left_padded_pixel_col[2*6*BITWIDTH-1:2*5*BITWIDTH],left_padded_pixel_col[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[7*6*BITWIDTH-1:7*5*BITWIDTH],left_padded_pixel_col[6*6*BITWIDTH-1:6*5*BITWIDTH],
                                    pixel_in[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[4*5*BITWIDTH-1:4*4*BITWIDTH],left_padded_pixel_col[3*5*BITWIDTH-1:3*4*BITWIDTH],left_padded_pixel_col[2*5*BITWIDTH-1:2*4*BITWIDTH],left_padded_pixel_col[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[7*5*BITWIDTH-1:7*4*BITWIDTH],left_padded_pixel_col[6*5*BITWIDTH-1:6*4*BITWIDTH],
                                    pixel_in[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[4*4*BITWIDTH-1:4*3*BITWIDTH],left_padded_pixel_col[3*4*BITWIDTH-1:3*3*BITWIDTH],left_padded_pixel_col[2*4*BITWIDTH-1:2*3*BITWIDTH],left_padded_pixel_col[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[7*4*BITWIDTH-1:7*3*BITWIDTH],left_padded_pixel_col[6*4*BITWIDTH-1:6*3*BITWIDTH],
                                    pixel_in[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[4*3*BITWIDTH-1:4*2*BITWIDTH],left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[7*3*BITWIDTH-1:7*2*BITWIDTH],left_padded_pixel_col[6*3*BITWIDTH-1:6*2*BITWIDTH],
                                    pixel_in[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[4*2*BITWIDTH-1:4*1*BITWIDTH],left_padded_pixel_col[3*2*BITWIDTH-1:3*1*BITWIDTH],left_padded_pixel_col[2*2*BITWIDTH-1:2*1*BITWIDTH],left_padded_pixel_col[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[7*2*BITWIDTH-1:7*1*BITWIDTH],left_padded_pixel_col[6*2*BITWIDTH-1:6*1*BITWIDTH],
                                    pixel_in[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[4*1*BITWIDTH-1:4*0*BITWIDTH],left_padded_pixel_col[3*1*BITWIDTH-1:3*0*BITWIDTH],left_padded_pixel_col[2*1*BITWIDTH-1:2*0*BITWIDTH],left_padded_pixel_col[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[7*1*BITWIDTH-1:7*0*BITWIDTH],left_padded_pixel_col[6*1*BITWIDTH-1:6*0*BITWIDTH]};
                                    
(col_ptr == 'd3): pixel_out_wire = {pixel_in[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[3*7*BITWIDTH-1:3*6*BITWIDTH],left_padded_pixel_col[2*7*BITWIDTH-1:2*6*BITWIDTH],left_padded_pixel_col[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[7*7*BITWIDTH-1:7*6*BITWIDTH],left_padded_pixel_col[6*7*BITWIDTH-1:6*6*BITWIDTH],left_padded_pixel_col[5*7*BITWIDTH-1:5*6*BITWIDTH],
                                    pixel_in[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[3*6*BITWIDTH-1:3*5*BITWIDTH],left_padded_pixel_col[2*6*BITWIDTH-1:2*5*BITWIDTH],left_padded_pixel_col[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[7*6*BITWIDTH-1:7*5*BITWIDTH],left_padded_pixel_col[6*6*BITWIDTH-1:6*5*BITWIDTH],left_padded_pixel_col[5*6*BITWIDTH-1:5*5*BITWIDTH],
                                    pixel_in[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[3*5*BITWIDTH-1:3*4*BITWIDTH],left_padded_pixel_col[2*5*BITWIDTH-1:2*4*BITWIDTH],left_padded_pixel_col[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[7*5*BITWIDTH-1:7*4*BITWIDTH],left_padded_pixel_col[6*5*BITWIDTH-1:6*4*BITWIDTH],left_padded_pixel_col[5*5*BITWIDTH-1:5*4*BITWIDTH],
                                    pixel_in[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[3*4*BITWIDTH-1:3*3*BITWIDTH],left_padded_pixel_col[2*4*BITWIDTH-1:2*3*BITWIDTH],left_padded_pixel_col[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[7*4*BITWIDTH-1:7*3*BITWIDTH],left_padded_pixel_col[6*4*BITWIDTH-1:6*3*BITWIDTH],left_padded_pixel_col[5*4*BITWIDTH-1:5*3*BITWIDTH],
                                    pixel_in[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[7*3*BITWIDTH-1:7*2*BITWIDTH],left_padded_pixel_col[6*3*BITWIDTH-1:6*2*BITWIDTH],left_padded_pixel_col[5*3*BITWIDTH-1:5*2*BITWIDTH],
                                    pixel_in[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[3*2*BITWIDTH-1:3*1*BITWIDTH],left_padded_pixel_col[2*2*BITWIDTH-1:2*1*BITWIDTH],left_padded_pixel_col[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[7*2*BITWIDTH-1:7*1*BITWIDTH],left_padded_pixel_col[6*2*BITWIDTH-1:6*1*BITWIDTH],left_padded_pixel_col[5*2*BITWIDTH-1:5*1*BITWIDTH],
                                    pixel_in[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[3*1*BITWIDTH-1:3*0*BITWIDTH],left_padded_pixel_col[2*1*BITWIDTH-1:2*0*BITWIDTH],left_padded_pixel_col[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[7*1*BITWIDTH-1:7*0*BITWIDTH],left_padded_pixel_col[6*1*BITWIDTH-1:6*0*BITWIDTH],left_padded_pixel_col[5*1*BITWIDTH-1:5*0*BITWIDTH]};
                                    
(col_ptr == 'd2): pixel_out_wire = {pixel_in[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[2*7*BITWIDTH-1:2*6*BITWIDTH],left_padded_pixel_col[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[7*7*BITWIDTH-1:7*6*BITWIDTH],left_padded_pixel_col[6*7*BITWIDTH-1:6*6*BITWIDTH],left_padded_pixel_col[5*7*BITWIDTH-1:5*6*BITWIDTH],left_padded_pixel_col[4*7*BITWIDTH-1:4*6*BITWIDTH],
                                    pixel_in[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[2*6*BITWIDTH-1:2*5*BITWIDTH],left_padded_pixel_col[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[7*6*BITWIDTH-1:7*5*BITWIDTH],left_padded_pixel_col[6*6*BITWIDTH-1:6*5*BITWIDTH],left_padded_pixel_col[5*6*BITWIDTH-1:5*5*BITWIDTH],left_padded_pixel_col[4*6*BITWIDTH-1:4*5*BITWIDTH],
                                    pixel_in[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[2*5*BITWIDTH-1:2*4*BITWIDTH],left_padded_pixel_col[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[7*5*BITWIDTH-1:7*4*BITWIDTH],left_padded_pixel_col[6*5*BITWIDTH-1:6*4*BITWIDTH],left_padded_pixel_col[5*5*BITWIDTH-1:5*4*BITWIDTH],left_padded_pixel_col[4*5*BITWIDTH-1:4*4*BITWIDTH],
                                    pixel_in[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[2*4*BITWIDTH-1:2*3*BITWIDTH],left_padded_pixel_col[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[7*4*BITWIDTH-1:7*3*BITWIDTH],left_padded_pixel_col[6*4*BITWIDTH-1:6*3*BITWIDTH],left_padded_pixel_col[5*4*BITWIDTH-1:5*3*BITWIDTH],left_padded_pixel_col[4*4*BITWIDTH-1:4*3*BITWIDTH],
                                    pixel_in[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[7*3*BITWIDTH-1:7*2*BITWIDTH],left_padded_pixel_col[6*3*BITWIDTH-1:6*2*BITWIDTH],left_padded_pixel_col[5*3*BITWIDTH-1:5*2*BITWIDTH],left_padded_pixel_col[4*3*BITWIDTH-1:4*2*BITWIDTH],
                                    pixel_in[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[2*2*BITWIDTH-1:2*1*BITWIDTH],left_padded_pixel_col[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[7*2*BITWIDTH-1:7*1*BITWIDTH],left_padded_pixel_col[6*2*BITWIDTH-1:6*1*BITWIDTH],left_padded_pixel_col[5*2*BITWIDTH-1:5*1*BITWIDTH],left_padded_pixel_col[4*2*BITWIDTH-1:4*1*BITWIDTH],
                                    pixel_in[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[2*1*BITWIDTH-1:2*0*BITWIDTH],left_padded_pixel_col[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[7*1*BITWIDTH-1:7*0*BITWIDTH],left_padded_pixel_col[6*1*BITWIDTH-1:6*0*BITWIDTH],left_padded_pixel_col[5*1*BITWIDTH-1:5*0*BITWIDTH],left_padded_pixel_col[4*1*BITWIDTH-1:4*0*BITWIDTH]};   
                                    
(col_ptr == 'd1): pixel_out_wire = {pixel_in[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[7*7*BITWIDTH-1:7*6*BITWIDTH],left_padded_pixel_col[6*7*BITWIDTH-1:6*6*BITWIDTH],left_padded_pixel_col[5*7*BITWIDTH-1:5*6*BITWIDTH],left_padded_pixel_col[4*7*BITWIDTH-1:4*6*BITWIDTH],left_padded_pixel_col[3*7*BITWIDTH-1:3*6*BITWIDTH],
                                    pixel_in[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[7*6*BITWIDTH-1:7*5*BITWIDTH],left_padded_pixel_col[6*6*BITWIDTH-1:6*5*BITWIDTH],left_padded_pixel_col[5*6*BITWIDTH-1:5*5*BITWIDTH],left_padded_pixel_col[4*6*BITWIDTH-1:4*5*BITWIDTH],left_padded_pixel_col[3*6*BITWIDTH-1:3*5*BITWIDTH],
                                    pixel_in[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[7*5*BITWIDTH-1:7*4*BITWIDTH],left_padded_pixel_col[6*5*BITWIDTH-1:6*4*BITWIDTH],left_padded_pixel_col[5*5*BITWIDTH-1:5*4*BITWIDTH],left_padded_pixel_col[4*5*BITWIDTH-1:4*4*BITWIDTH],left_padded_pixel_col[3*5*BITWIDTH-1:3*4*BITWIDTH],
                                    pixel_in[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[7*4*BITWIDTH-1:7*3*BITWIDTH],left_padded_pixel_col[6*4*BITWIDTH-1:6*3*BITWIDTH],left_padded_pixel_col[5*4*BITWIDTH-1:5*3*BITWIDTH],left_padded_pixel_col[4*4*BITWIDTH-1:4*3*BITWIDTH],left_padded_pixel_col[3*4*BITWIDTH-1:3*3*BITWIDTH],
                                    pixel_in[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[7*3*BITWIDTH-1:7*2*BITWIDTH],left_padded_pixel_col[6*3*BITWIDTH-1:6*2*BITWIDTH],left_padded_pixel_col[5*3*BITWIDTH-1:5*2*BITWIDTH],left_padded_pixel_col[4*3*BITWIDTH-1:4*2*BITWIDTH],left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],
                                    pixel_in[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[7*2*BITWIDTH-1:7*1*BITWIDTH],left_padded_pixel_col[6*2*BITWIDTH-1:6*1*BITWIDTH],left_padded_pixel_col[5*2*BITWIDTH-1:5*1*BITWIDTH],left_padded_pixel_col[4*2*BITWIDTH-1:4*1*BITWIDTH],left_padded_pixel_col[3*2*BITWIDTH-1:3*1*BITWIDTH],
                                    pixel_in[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[7*1*BITWIDTH-1:7*0*BITWIDTH],left_padded_pixel_col[6*1*BITWIDTH-1:6*0*BITWIDTH],left_padded_pixel_col[5*1*BITWIDTH-1:5*0*BITWIDTH],left_padded_pixel_col[4*1*BITWIDTH-1:4*0*BITWIDTH],left_padded_pixel_col[3*1*BITWIDTH-1:3*0*BITWIDTH]}; 
                                    
(col_ptr == 'd0): pixel_out_wire = {pixel_in[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[7*7*BITWIDTH-1:7*6*BITWIDTH],left_padded_pixel_col[6*7*BITWIDTH-1:6*6*BITWIDTH],left_padded_pixel_col[5*7*BITWIDTH-1:5*6*BITWIDTH],left_padded_pixel_col[4*7*BITWIDTH-1:4*6*BITWIDTH],left_padded_pixel_col[3*7*BITWIDTH-1:3*6*BITWIDTH],left_padded_pixel_col[2*7*BITWIDTH-1:2*6*BITWIDTH],
                                    pixel_in[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[7*6*BITWIDTH-1:7*5*BITWIDTH],left_padded_pixel_col[6*6*BITWIDTH-1:6*5*BITWIDTH],left_padded_pixel_col[5*6*BITWIDTH-1:5*5*BITWIDTH],left_padded_pixel_col[4*6*BITWIDTH-1:4*5*BITWIDTH],left_padded_pixel_col[3*6*BITWIDTH-1:3*5*BITWIDTH],left_padded_pixel_col[2*6*BITWIDTH-1:2*5*BITWIDTH],
                                    pixel_in[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[7*5*BITWIDTH-1:7*4*BITWIDTH],left_padded_pixel_col[6*5*BITWIDTH-1:6*4*BITWIDTH],left_padded_pixel_col[5*5*BITWIDTH-1:5*4*BITWIDTH],left_padded_pixel_col[4*5*BITWIDTH-1:4*4*BITWIDTH],left_padded_pixel_col[3*5*BITWIDTH-1:3*4*BITWIDTH],left_padded_pixel_col[2*5*BITWIDTH-1:2*4*BITWIDTH],
                                    pixel_in[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[7*4*BITWIDTH-1:7*3*BITWIDTH],left_padded_pixel_col[6*4*BITWIDTH-1:6*3*BITWIDTH],left_padded_pixel_col[5*4*BITWIDTH-1:5*3*BITWIDTH],left_padded_pixel_col[4*4*BITWIDTH-1:4*3*BITWIDTH],left_padded_pixel_col[3*4*BITWIDTH-1:3*3*BITWIDTH],left_padded_pixel_col[2*4*BITWIDTH-1:2*3*BITWIDTH],
                                    pixel_in[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[7*3*BITWIDTH-1:7*2*BITWIDTH],left_padded_pixel_col[6*3*BITWIDTH-1:6*2*BITWIDTH],left_padded_pixel_col[5*3*BITWIDTH-1:5*2*BITWIDTH],left_padded_pixel_col[4*3*BITWIDTH-1:4*2*BITWIDTH],left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],
                                    pixel_in[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[7*2*BITWIDTH-1:7*1*BITWIDTH],left_padded_pixel_col[6*2*BITWIDTH-1:6*1*BITWIDTH],left_padded_pixel_col[5*2*BITWIDTH-1:5*1*BITWIDTH],left_padded_pixel_col[4*2*BITWIDTH-1:4*1*BITWIDTH],left_padded_pixel_col[3*2*BITWIDTH-1:3*1*BITWIDTH],left_padded_pixel_col[2*2*BITWIDTH-1:2*1*BITWIDTH],
                                    pixel_in[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[7*1*BITWIDTH-1:7*0*BITWIDTH],left_padded_pixel_col[6*1*BITWIDTH-1:6*0*BITWIDTH],left_padded_pixel_col[5*1*BITWIDTH-1:5*0*BITWIDTH],left_padded_pixel_col[4*1*BITWIDTH-1:4*0*BITWIDTH],left_padded_pixel_col[3*1*BITWIDTH-1:3*0*BITWIDTH],left_padded_pixel_col[2*1*BITWIDTH-1:2*0*BITWIDTH]};

(col_ptr == 'd5): pixel_out_wire = {pixel_in[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[5*7*BITWIDTH-1:5*6*BITWIDTH],left_padded_pixel_col[4*7*BITWIDTH-1:4*6*BITWIDTH],left_padded_pixel_col[3*7*BITWIDTH-1:3*6*BITWIDTH],left_padded_pixel_col[2*7*BITWIDTH-1:2*6*BITWIDTH],left_padded_pixel_col[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[7*7*BITWIDTH-1:7*6*BITWIDTH],
                                    pixel_in[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[5*6*BITWIDTH-1:5*5*BITWIDTH],left_padded_pixel_col[4*6*BITWIDTH-1:4*5*BITWIDTH],left_padded_pixel_col[3*6*BITWIDTH-1:3*5*BITWIDTH],left_padded_pixel_col[2*6*BITWIDTH-1:2*5*BITWIDTH],left_padded_pixel_col[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[7*6*BITWIDTH-1:7*5*BITWIDTH],
                                    pixel_in[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[5*5*BITWIDTH-1:5*4*BITWIDTH],left_padded_pixel_col[4*5*BITWIDTH-1:4*4*BITWIDTH],left_padded_pixel_col[3*5*BITWIDTH-1:3*4*BITWIDTH],left_padded_pixel_col[2*5*BITWIDTH-1:2*4*BITWIDTH],left_padded_pixel_col[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[7*5*BITWIDTH-1:7*4*BITWIDTH],
                                    pixel_in[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[5*4*BITWIDTH-1:5*3*BITWIDTH],left_padded_pixel_col[4*4*BITWIDTH-1:4*3*BITWIDTH],left_padded_pixel_col[3*4*BITWIDTH-1:3*3*BITWIDTH],left_padded_pixel_col[2*4*BITWIDTH-1:2*3*BITWIDTH],left_padded_pixel_col[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[7*4*BITWIDTH-1:7*3*BITWIDTH],
                                    pixel_in[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[5*3*BITWIDTH-1:5*2*BITWIDTH],left_padded_pixel_col[4*3*BITWIDTH-1:4*2*BITWIDTH],left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[7*3*BITWIDTH-1:7*2*BITWIDTH],
                                    pixel_in[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[5*2*BITWIDTH-1:5*1*BITWIDTH],left_padded_pixel_col[4*2*BITWIDTH-1:4*1*BITWIDTH],left_padded_pixel_col[3*2*BITWIDTH-1:3*1*BITWIDTH],left_padded_pixel_col[2*2*BITWIDTH-1:2*1*BITWIDTH],left_padded_pixel_col[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[7*2*BITWIDTH-1:7*1*BITWIDTH],
                                    pixel_in[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[5*1*BITWIDTH-1:5*0*BITWIDTH],left_padded_pixel_col[4*1*BITWIDTH-1:4*0*BITWIDTH],left_padded_pixel_col[3*1*BITWIDTH-1:3*0*BITWIDTH],left_padded_pixel_col[2*1*BITWIDTH-1:2*0*BITWIDTH],left_padded_pixel_col[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[7*1*BITWIDTH-1:7*0*BITWIDTH]};

(col_ptr == 'd6): pixel_out_wire = {pixel_in[7*BITWIDTH-1:6*BITWIDTH],left_padded_pixel_col[6*7*BITWIDTH-1:6*6*BITWIDTH],left_padded_pixel_col[5*7*BITWIDTH-1:5*6*BITWIDTH],left_padded_pixel_col[4*7*BITWIDTH-1:4*6*BITWIDTH],left_padded_pixel_col[3*7*BITWIDTH-1:3*6*BITWIDTH],left_padded_pixel_col[2*7*BITWIDTH-1:2*6*BITWIDTH],left_padded_pixel_col[7*BITWIDTH-1:6*BITWIDTH],
                                    pixel_in[6*BITWIDTH-1:5*BITWIDTH],left_padded_pixel_col[6*6*BITWIDTH-1:6*5*BITWIDTH],left_padded_pixel_col[5*6*BITWIDTH-1:5*5*BITWIDTH],left_padded_pixel_col[4*6*BITWIDTH-1:4*5*BITWIDTH],left_padded_pixel_col[3*6*BITWIDTH-1:3*5*BITWIDTH],left_padded_pixel_col[2*6*BITWIDTH-1:2*5*BITWIDTH],left_padded_pixel_col[6*BITWIDTH-1:5*BITWIDTH],
                                    pixel_in[5*BITWIDTH-1:4*BITWIDTH],left_padded_pixel_col[6*5*BITWIDTH-1:6*4*BITWIDTH],left_padded_pixel_col[5*5*BITWIDTH-1:5*4*BITWIDTH],left_padded_pixel_col[4*5*BITWIDTH-1:4*4*BITWIDTH],left_padded_pixel_col[3*5*BITWIDTH-1:3*4*BITWIDTH],left_padded_pixel_col[2*5*BITWIDTH-1:2*4*BITWIDTH],left_padded_pixel_col[5*BITWIDTH-1:4*BITWIDTH],
                                    pixel_in[4*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[6*4*BITWIDTH-1:6*3*BITWIDTH],left_padded_pixel_col[5*4*BITWIDTH-1:5*3*BITWIDTH],left_padded_pixel_col[4*4*BITWIDTH-1:4*3*BITWIDTH],left_padded_pixel_col[3*4*BITWIDTH-1:3*3*BITWIDTH],left_padded_pixel_col[2*4*BITWIDTH-1:2*3*BITWIDTH],left_padded_pixel_col[4*BITWIDTH-1:3*BITWIDTH],
                                    pixel_in[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[6*3*BITWIDTH-1:6*2*BITWIDTH],left_padded_pixel_col[5*3*BITWIDTH-1:5*2*BITWIDTH],left_padded_pixel_col[4*3*BITWIDTH-1:4*2*BITWIDTH],left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],
                                    pixel_in[2*BITWIDTH-1:1*BITWIDTH],left_padded_pixel_col[6*2*BITWIDTH-1:6*1*BITWIDTH],left_padded_pixel_col[5*2*BITWIDTH-1:5*1*BITWIDTH],left_padded_pixel_col[4*2*BITWIDTH-1:4*1*BITWIDTH],left_padded_pixel_col[3*2*BITWIDTH-1:3*1*BITWIDTH],left_padded_pixel_col[2*2*BITWIDTH-1:2*1*BITWIDTH],left_padded_pixel_col[2*BITWIDTH-1:1*BITWIDTH],
                                    pixel_in[1*BITWIDTH-1:0*BITWIDTH],left_padded_pixel_col[6*1*BITWIDTH-1:6*0*BITWIDTH],left_padded_pixel_col[5*1*BITWIDTH-1:5*0*BITWIDTH],left_padded_pixel_col[4*1*BITWIDTH-1:4*0*BITWIDTH],left_padded_pixel_col[3*1*BITWIDTH-1:3*0*BITWIDTH],left_padded_pixel_col[2*1*BITWIDTH-1:2*0*BITWIDTH],left_padded_pixel_col[1*BITWIDTH-1:0*BITWIDTH]};
        default:          pixel_out_wire = '0;
    endcase
end



// output flop
always_ff @(posedge clk) begin
    if (!rstn) begin
        stored_pixel_out <= '0;
    end
    else if (ready) begin
        stored_pixel_out <= pixel_out_wire;
    end
    else begin
        stored_pixel_out <= stored_pixel_out;
    end
end

generate
	for (i = 0; i < KER_SIZE ; i++) begin
		assign pixel_row[(i+1)*KER_SIZE*BITWIDTH-1:i*KER_SIZE*BITWIDTH] = stored_pixel_out[KER_SIZE*BITWIDTH*i+:KER_SIZE*BITWIDTH];
		assign pixel_out[KER_SIZE*BITWIDTH*i+:KER_SIZE*BITWIDTH] = padded_pixel_row[(i+1)*KER_SIZE*BITWIDTH-1:i*KER_SIZE*BITWIDTH];
	end
endgenerate

generate
	for (i = 0; i < KER_SIZE ; i++) 
	for (j = 0; j < KER_SIZE ; j++) 
		assign padded_pixel_row[(i*KER_SIZE*BITWIDTH + BITWIDTH*j)+:BITWIDTH] = right_pad_mask[j] ?{BITWIDTH{1'b0}}:pixel_row[(i*KER_SIZE*BITWIDTH + BITWIDTH*j)+:BITWIDTH];

endgenerate


assign ready =  init_col_ptr == KER_SIZE-1;

endmodule

module line_buffer_array_k5
#(
    parameter KER_SIZE = 5,
    parameter BITWIDTH = 8,
    parameter AW       = 8,
    parameter PAD      = 1
)
(
    input logic clk,
    input logic rstn,
    input logic [BITWIDTH*KER_SIZE-1:0] pixel_in,
    input logic [3-1:0] col_ptr,
    input logic [3-1:0] init_col_ptr,
    input logic [KER_SIZE-1:0] left_pad_mask,
    input logic [KER_SIZE-1:0] right_pad_mask,
    output logic [BITWIDTH*KER_SIZE*KER_SIZE-1:0] pixel_out   
);

// wires
//logic [KER_SIZE*BITWIDTH-1:0] pixel_col [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_col;

//logic [KER_SIZE*BITWIDTH-1:0] pixel_row [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_row;

//logic [KER_SIZE*BITWIDTH-1:0] padded_pixel_row [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] padded_pixel_row;

//logic [KER_SIZE*BITWIDTH-1:0] left_padded_pixel_col [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] left_padded_pixel_col;

//logic [KER_SIZE*BITWIDTH-1:0] right_padded_pixel_col [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] right_padded_pixel_col; 

logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_out_wire;
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] stored_pixel_out;
logic ready;

logic [8-1:0] global_col_ptr;
logic ready_reg;

// reg array
genvar i,j;
generate
for (i = 0; i < KER_SIZE; i++) begin
    d_flop #(
        .BITWIDTH (BITWIDTH*KER_SIZE)
    ) reg_inst (
        .clk (clk),
        .rstn (rstn),
        .valid (col_ptr == i),
        .D (pixel_in),
        .Q (pixel_col[(i+1)*KER_SIZE*BITWIDTH -1:i*KER_SIZE*BITWIDTH])
    ); // each d_flop stores a column of data
always@(posedge clk) begin 
 left_padded_pixel_col[(i+1)*KER_SIZE*BITWIDTH -1:i*KER_SIZE*BITWIDTH] = (left_pad_mask[i]==1)? {(KER_SIZE*BITWIDTH){1'b0}} : pixel_col[(i+1)*KER_SIZE*BITWIDTH -1:i*KER_SIZE*BITWIDTH];//left padding
end
end
endgenerate

// reshape
always_comb begin
    case (1'b1)
        (col_ptr == 'd0): pixel_out_wire = {pixel_in[5*BITWIDTH-1:4*BITWIDTH],		left_padded_pixel_col[5*5*BITWIDTH-1:5*4*BITWIDTH],		left_padded_pixel_col[4*5*BITWIDTH-1:4*4*BITWIDTH],		left_padded_pixel_col[3*5*BITWIDTH-1:3*4*BITWIDTH],		left_padded_pixel_col[2*5*BITWIDTH-1:2*4*BITWIDTH],		pixel_in[4*BITWIDTH-1:3*BITWIDTH],		left_padded_pixel_col[5*4*BITWIDTH-1:5*3*BITWIDTH],		left_padded_pixel_col[4*4*BITWIDTH-1:4*3*BITWIDTH],		left_padded_pixel_col[3*4*BITWIDTH-1:3*3*BITWIDTH],		left_padded_pixel_col[2*4*BITWIDTH-1:2*3*BITWIDTH],		pixel_in[3*BITWIDTH-1:2*BITWIDTH],		left_padded_pixel_col[5*3*BITWIDTH-1:5*2*BITWIDTH],		left_padded_pixel_col[4*3*BITWIDTH-1:4*2*BITWIDTH],		left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],		left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],		pixel_in[2*BITWIDTH-1:BITWIDTH],		left_padded_pixel_col[5*2*BITWIDTH-1:5*BITWIDTH],		left_padded_pixel_col[4*2*BITWIDTH-1:4*BITWIDTH],		left_padded_pixel_col[3*2*BITWIDTH-1:3*BITWIDTH],		left_padded_pixel_col[2*2*BITWIDTH-1:2*BITWIDTH],		pixel_in[BITWIDTH-1:0],		left_padded_pixel_col[5*BITWIDTH-1:0],		left_padded_pixel_col[4*BITWIDTH-1:0],		left_padded_pixel_col[3*BITWIDTH-1:0],		left_padded_pixel_col[2*BITWIDTH-1:0]};
        (col_ptr == 'd1): pixel_out_wire = {pixel_in[5*BITWIDTH-1:4*BITWIDTH],		left_padded_pixel_col[5*BITWIDTH-1:4*BITWIDTH],		left_padded_pixel_col[5*5*BITWIDTH-1:5*4*BITWIDTH],		left_padded_pixel_col[4*5*BITWIDTH-1:4*4*BITWIDTH],		left_padded_pixel_col[3*5*BITWIDTH-1:3*4*BITWIDTH],		pixel_in[4*BITWIDTH-1:3*BITWIDTH],		left_padded_pixel_col[4*BITWIDTH-1:3*BITWIDTH],		left_padded_pixel_col[5*4*BITWIDTH-1:5*3*BITWIDTH],		left_padded_pixel_col[4*4*BITWIDTH-1:4*3*BITWIDTH],		left_padded_pixel_col[3*4*BITWIDTH-1:3*3*BITWIDTH],		pixel_in[3*BITWIDTH-1:2*BITWIDTH],		left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],		left_padded_pixel_col[5*3*BITWIDTH-1:5*2*BITWIDTH],		left_padded_pixel_col[4*3*BITWIDTH-1:4*2*BITWIDTH],		left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],		pixel_in[2*BITWIDTH-1:BITWIDTH],		left_padded_pixel_col[2*BITWIDTH-1:BITWIDTH],		left_padded_pixel_col[5*2*BITWIDTH-1:5*BITWIDTH],		left_padded_pixel_col[4*2*BITWIDTH-1:4*BITWIDTH],		left_padded_pixel_col[3*2*BITWIDTH-1:3*BITWIDTH],		pixel_in[BITWIDTH-1:0],		left_padded_pixel_col[BITWIDTH-1:0],		left_padded_pixel_col[5*BITWIDTH-1:0],		left_padded_pixel_col[4*BITWIDTH-1:0],		left_padded_pixel_col[3*BITWIDTH-1:0]};
        (col_ptr == 'd2): pixel_out_wire = {pixel_in[5*BITWIDTH-1:4*BITWIDTH],		left_padded_pixel_col[2*5*BITWIDTH-1:2*4*BITWIDTH],		left_padded_pixel_col[5*BITWIDTH-1:4*BITWIDTH],		left_padded_pixel_col[5*5*BITWIDTH-1:5*4*BITWIDTH],		left_padded_pixel_col[4*5*BITWIDTH-1:4*4*BITWIDTH],		pixel_in[4*BITWIDTH-1:3*BITWIDTH],		left_padded_pixel_col[2*4*BITWIDTH-1:2*3*BITWIDTH],		left_padded_pixel_col[4*BITWIDTH-1:3*BITWIDTH],		left_padded_pixel_col[5*4*BITWIDTH-1:5*3*BITWIDTH],		left_padded_pixel_col[4*4*BITWIDTH-1:4*3*BITWIDTH],		pixel_in[3*BITWIDTH-1:2*BITWIDTH],		left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],		left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],		left_padded_pixel_col[5*3*BITWIDTH-1:5*2*BITWIDTH],		left_padded_pixel_col[4*3*BITWIDTH-1:4*2*BITWIDTH],		pixel_in[2*BITWIDTH-1:BITWIDTH],		left_padded_pixel_col[2*2*BITWIDTH-1:2*BITWIDTH],		left_padded_pixel_col[2*BITWIDTH-1:BITWIDTH],		left_padded_pixel_col[5*2*BITWIDTH-1:5*BITWIDTH],		left_padded_pixel_col[4*2*BITWIDTH-1:4*BITWIDTH],		pixel_in[BITWIDTH-1:0],		left_padded_pixel_col[2*BITWIDTH-1:0],		left_padded_pixel_col[BITWIDTH-1:0],		left_padded_pixel_col[5*BITWIDTH-1:0],		left_padded_pixel_col[4*BITWIDTH-1:0]};
        (col_ptr == 'd3): pixel_out_wire = {pixel_in[5*BITWIDTH-1:4*BITWIDTH],		left_padded_pixel_col[3*5*BITWIDTH-1:3*4*BITWIDTH],		left_padded_pixel_col[2*5*BITWIDTH-1:2*4*BITWIDTH],		left_padded_pixel_col[5*BITWIDTH-1:4*BITWIDTH],		left_padded_pixel_col[5*5*BITWIDTH-1:5*4*BITWIDTH],		pixel_in[4*BITWIDTH-1:3*BITWIDTH],		left_padded_pixel_col[3*4*BITWIDTH-1:3*3*BITWIDTH],		left_padded_pixel_col[2*4*BITWIDTH-1:2*3*BITWIDTH],		left_padded_pixel_col[4*BITWIDTH-1:3*BITWIDTH],		left_padded_pixel_col[5*4*BITWIDTH-1:5*3*BITWIDTH],		pixel_in[3*BITWIDTH-1:2*BITWIDTH],		left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],		left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],		left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],		left_padded_pixel_col[5*3*BITWIDTH-1:5*2*BITWIDTH],		pixel_in[2*BITWIDTH-1:BITWIDTH],		left_padded_pixel_col[3*2*BITWIDTH-1:3*BITWIDTH],		left_padded_pixel_col[2*2*BITWIDTH-1:2*BITWIDTH],		left_padded_pixel_col[2*BITWIDTH-1:BITWIDTH],		left_padded_pixel_col[5*2*BITWIDTH-1:5*BITWIDTH],		pixel_in[BITWIDTH-1:0],		left_padded_pixel_col[3*BITWIDTH-1:0],		left_padded_pixel_col[2*BITWIDTH-1:0],		left_padded_pixel_col[BITWIDTH-1:0],		left_padded_pixel_col[5*BITWIDTH-1:0]};
        (col_ptr == 'd4): pixel_out_wire = {pixel_in[5*BITWIDTH-1:4*BITWIDTH],		left_padded_pixel_col[4*5*BITWIDTH-1:4*4*BITWIDTH],		left_padded_pixel_col[3*5*BITWIDTH-1:3*4*BITWIDTH],		left_padded_pixel_col[2*5*BITWIDTH-1:2*4*BITWIDTH],		left_padded_pixel_col[5*BITWIDTH-1:4*BITWIDTH],		pixel_in[4*BITWIDTH-1:3*BITWIDTH],		left_padded_pixel_col[4*4*BITWIDTH-1:4*3*BITWIDTH],		left_padded_pixel_col[3*4*BITWIDTH-1:3*3*BITWIDTH],		left_padded_pixel_col[2*4*BITWIDTH-1:2*3*BITWIDTH],		left_padded_pixel_col[4*BITWIDTH-1:3*BITWIDTH],		pixel_in[3*BITWIDTH-1:2*BITWIDTH],		left_padded_pixel_col[4*3*BITWIDTH-1:4*2*BITWIDTH],		left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],		left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],		left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],		pixel_in[2*BITWIDTH-1:BITWIDTH],		left_padded_pixel_col[4*2*BITWIDTH-1:4*BITWIDTH],		left_padded_pixel_col[3*2*BITWIDTH-1:3*BITWIDTH],		left_padded_pixel_col[2*2*BITWIDTH-1:2*BITWIDTH],		left_padded_pixel_col[2*BITWIDTH-1:BITWIDTH],		pixel_in[BITWIDTH-1:0],		left_padded_pixel_col[4*BITWIDTH-1:0],		left_padded_pixel_col[3*BITWIDTH-1:0],		left_padded_pixel_col[2*BITWIDTH-1:0],		left_padded_pixel_col[BITWIDTH-1:0]};
        default:          pixel_out_wire = '0;
    endcase
end



// output flop
always_ff @(posedge clk) begin
    if (!rstn) begin
        stored_pixel_out <= '0;
    end
    else if (ready) begin
        stored_pixel_out <= pixel_out_wire;
    end
    else begin
        stored_pixel_out <= stored_pixel_out;
    end
end

generate
	for (i = 0; i < KER_SIZE ; i++) begin
		assign pixel_row[(i+1)*KER_SIZE*BITWIDTH-1:i*KER_SIZE*BITWIDTH] = stored_pixel_out[KER_SIZE*BITWIDTH*i+:KER_SIZE*BITWIDTH];
		assign pixel_out[KER_SIZE*BITWIDTH*i+:KER_SIZE*BITWIDTH] = padded_pixel_row[(i+1)*KER_SIZE*BITWIDTH-1:i*KER_SIZE*BITWIDTH];
	end
endgenerate

generate
	for (i = 0; i < KER_SIZE ; i++) 
	for (j = 0; j < KER_SIZE ; j++) 
		assign padded_pixel_row[(i*KER_SIZE*BITWIDTH + BITWIDTH*j)+:BITWIDTH] = right_pad_mask[j] ?{BITWIDTH{1'b0}}:pixel_row[(i*KER_SIZE*BITWIDTH + BITWIDTH*j)+:BITWIDTH];
endgenerate

assign ready =  init_col_ptr == KER_SIZE-1;

endmodule

module line_buffer_array_k3
#(
    parameter   KER_SIZE    = 3,
    parameter BITWIDTH  = 8,
    parameter AW                = 8,
		parameter PAD = 1								 
)
(
    input logic clk,
    input logic rstn,
    input logic [BITWIDTH*KER_SIZE-1:0] pixel_in,
    input logic [3-1:0] col_ptr,
    input logic [3-1:0] init_col_ptr,
		input logic [KER_SIZE-1:0] left_pad_mask,																				 
		input logic [KER_SIZE-1:0] right_pad_mask,																					
    output logic [BITWIDTH*KER_SIZE*KER_SIZE-1:0] pixel_out   
);

// wires
//logic [KER_SIZE*BITWIDTH-1:0] pixel_col [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_col;

//logic [KER_SIZE*BITWIDTH-1:0] pixel_row [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_row;

//logic [KER_SIZE*BITWIDTH-1:0] padded_pixel_row [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] padded_pixel_row;

//logic [KER_SIZE*BITWIDTH-1:0] left_padded_pixel_col [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] left_padded_pixel_col;

//logic [KER_SIZE*BITWIDTH-1:0] right_padded_pixel_col [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] right_padded_pixel_col; 

logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_out_wire;
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] stored_pixel_out;
logic ready;

logic [8-1:0] global_col_ptr;
logic ready_reg;													 
// reg array
genvar i,j;
generate
for (i = 0; i < KER_SIZE; i++) begin
    d_flop #(
        .BITWIDTH (BITWIDTH*KER_SIZE)
    ) reg_inst (
        .clk (clk),
        .rstn (rstn),
        .valid (col_ptr == i),
        .D (pixel_in),
        .Q (pixel_col[(i+1)*KER_SIZE*BITWIDTH -1:i*KER_SIZE*BITWIDTH])
    ); // each d_flop stores a column of data
always@(posedge clk) begin 
 left_padded_pixel_col[(i+1)*KER_SIZE*BITWIDTH -1:i*KER_SIZE*BITWIDTH] = (left_pad_mask[i]==1)? {(KER_SIZE*BITWIDTH){1'b0}} : pixel_col[(i+1)*KER_SIZE*BITWIDTH -1:i*KER_SIZE*BITWIDTH];//left padding
end
end
endgenerate

// reshape
always_comb begin
    case (1'b1)
			(col_ptr == 'd0): pixel_out_wire = {pixel_in[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],pixel_in[2*BITWIDTH-1:BITWIDTH],left_padded_pixel_col[3*2*BITWIDTH-1:3*BITWIDTH],left_padded_pixel_col[2*2*BITWIDTH-1:2*BITWIDTH],pixel_in[BITWIDTH-1:0],left_padded_pixel_col[3*BITWIDTH-1:0],left_padded_pixel_col[2*BITWIDTH-1:0]};
			(col_ptr == 'd1): pixel_out_wire = {pixel_in[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[3*3*BITWIDTH-1:3*2*BITWIDTH],pixel_in[2*BITWIDTH-1:BITWIDTH],left_padded_pixel_col[2*BITWIDTH-1:BITWIDTH],left_padded_pixel_col[3*2*BITWIDTH-1:3*BITWIDTH],pixel_in[BITWIDTH-1:0],left_padded_pixel_col[BITWIDTH-1:0],left_padded_pixel_col[3*BITWIDTH-1:0]};
			(col_ptr == 'd2): pixel_out_wire = {pixel_in[3*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[2*3*BITWIDTH-1:2*2*BITWIDTH],left_padded_pixel_col[3*BITWIDTH-1:2*BITWIDTH],pixel_in[2*BITWIDTH-1:BITWIDTH],left_padded_pixel_col[2*2*BITWIDTH-1:2*BITWIDTH],left_padded_pixel_col[2*BITWIDTH-1:BITWIDTH],pixel_in[BITWIDTH-1:0],left_padded_pixel_col[2*BITWIDTH-1:0],left_padded_pixel_col[BITWIDTH-1:0]};        
			default:          									pixel_out_wire = '0;
    endcase
end

// output flop
always_ff @(posedge clk) begin
    if (!rstn) begin
        stored_pixel_out <= '0;
    end
    else if (ready) begin
        stored_pixel_out <= pixel_out_wire;
    end
    else begin
        stored_pixel_out <= stored_pixel_out;
    end
end

generate
	for (i = 0; i < KER_SIZE ; i++) begin
		assign pixel_row[(i+1)*KER_SIZE*BITWIDTH-1:i*KER_SIZE*BITWIDTH] = stored_pixel_out[KER_SIZE*BITWIDTH*i+:KER_SIZE*BITWIDTH];
		assign pixel_out[KER_SIZE*BITWIDTH*i+:KER_SIZE*BITWIDTH] = padded_pixel_row[(i+1)*KER_SIZE*BITWIDTH-1:i*KER_SIZE*BITWIDTH];
	end
endgenerate

generate
	for (i = 0; i < KER_SIZE ; i++) 
	for (j = 0; j < KER_SIZE ; j++) 
		assign padded_pixel_row[(i*KER_SIZE*BITWIDTH + BITWIDTH*j)+:BITWIDTH] = right_pad_mask[j] ?{BITWIDTH{1'b0}}:pixel_row[(i*KER_SIZE*BITWIDTH + BITWIDTH*j)+:BITWIDTH];
endgenerate

assign ready =  init_col_ptr == KER_SIZE-1;

endmodule

module line_buffer_array_k2
#(
    parameter KER_SIZE = 3,
    parameter BITWIDTH = 8,
    parameter AW = 8
)
(
    input logic clk,
    input logic rstn,
    input logic [BITWIDTH*KER_SIZE-1:0] pixel_in,
    input logic [3-1:0] col_ptr,
    input logic [3-1:0] init_col_ptr,
    output logic [BITWIDTH*KER_SIZE*KER_SIZE-1:0] pixel_out
);

// wires
//logic [KER_SIZE*BITWIDTH-1:0] pixel_col [KER_SIZE-1:0];
logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_col;

logic [KER_SIZE*KER_SIZE*BITWIDTH-1:0] pixel_out_wire;
logic ready;

// reg array
genvar i;
generate
for (i=0;i<KER_SIZE;i++) begin
    d_flop #(
        .BITWIDTH (BITWIDTH*KER_SIZE)
    ) reg_inst (
        .clk (clk),
        .rstn (rstn),
        .valid (col_ptr == i),
        .D (pixel_in),
        .Q (pixel_col[(i+1)*KER_SIZE*BITWIDTH -1:i*KER_SIZE*BITWIDTH])
    ); // each d_flop stores a column of data
end
endgenerate

// reshape
always_comb begin
    case (1'b1)
        (col_ptr == 'd0): pixel_out_wire = {pixel_in[2*BITWIDTH-1:BITWIDTH],pixel_col[2*2*BITWIDTH-1:2*BITWIDTH],pixel_in[BITWIDTH-1:0],pixel_col[2*BITWIDTH-1:0]};
        (col_ptr == 'd1): pixel_out_wire = {pixel_in[2*BITWIDTH-1:BITWIDTH],pixel_col[2*BITWIDTH-1:BITWIDTH],pixel_in[BITWIDTH-1:0],pixel_col[BITWIDTH-1:0]};
        default:          pixel_out_wire = '0;
    endcase
end

// output flop
always_ff @(posedge clk) begin
    if (!rstn) begin
        pixel_out <= '0;
    end
    else if (ready) begin
        pixel_out <= pixel_out_wire;
    end
    else begin
        pixel_out <= pixel_out;
    end
end

assign ready = (init_col_ptr == KER_SIZE-1);

endmodule

// d_flop
module d_flop
#(
    parameter BITWIDTH = 8
)
(
    input logic clk,
    input logic rstn,
    input logic valid,
    input logic [BITWIDTH-1:0] D,
    output logic [BITWIDTH-1:0] Q
);

always_ff @(posedge clk) begin
    if (rstn == 0) begin
        Q <= '0;
    end
    else if (valid == 1) begin
        Q <= D;
    end
    else begin
        Q <= Q;
    end     
end

endmodule





module line_buffer_controller
#(
    parameter KER_SIZE    = 3,
    parameter INPUT_X_DIM = 3,
    parameter PAD         = 1
)
(
    input logic clk,
    input logic rstn,
    input logic valid,
    input logic row_complete,
    output logic right_pad_valid,
    output logic [3-1:0] col_ptr,
    output logic [KER_SIZE-1:0] left_pad_mask,	 
    output logic [KER_SIZE-1:0] right_pad_mask,	 
    output logic [3-1:0] init_col_ptr
);

logic [3-1:0] init_col_ptr_nxt;
logic [3-1:0] col_ptr_nxt;

logic [7:0] global_col_ptr;
logic [7:0] global_col_ptr_nxt;

//-------------------------------------
logic padrow_complete;
logic row_complete_D1;
logic row_complete_D2;
always_ff @(posedge clk) 
begin
	if (!rstn) 
	begin
			row_complete_D1 	 <='0;
			row_complete_D2 	 <='0;
	end
	else if (padrow_complete)
	begin	
			row_complete_D1 		<= '0;
			row_complete_D2 		<= '0;
	end
	else
	begin
			row_complete_D1 		<= row_complete;
			row_complete_D2 		<= row_complete_D1;
	end
end
assign padrow_complete = row_complete_D1;
//-------------------------------------


// initialize counters
always_ff @(posedge clk) begin
    if (!rstn) begin
        col_ptr 			      <= PAD;//Left padding
        init_col_ptr 		    <= PAD;//Left padding
        global_col_ptr 		  <='0;
    end
    else if (padrow_complete) begin
        col_ptr 				    <= PAD; //Left padding
        init_col_ptr 			  <= PAD;//Left padding
        global_col_ptr 			<= '0;
    end
    else begin
        col_ptr 				    <= col_ptr_nxt;
        init_col_ptr 			  <= init_col_ptr_nxt;
        global_col_ptr 			<= global_col_ptr_nxt;
    end
end


// Increment counters based on conditions
assign col_ptr_nxt 		  	= valid ? (col_ptr==KER_SIZE-1 ? '0 : col_ptr + 1'd1) : col_ptr;
assign global_col_ptr_nxt = padrow_complete ? 'd0 : valid ?  global_col_ptr + 1'd1: global_col_ptr;
assign init_col_ptr_nxt   = valid && init_col_ptr<KER_SIZE-1 ? init_col_ptr + 1'd1 :padrow_complete==1'b1 ? PAD : init_col_ptr;

// Left pad logic
logic [KER_SIZE-1:0]left_pad_shift;

generate
	if(PAD>0) 
	begin
		logic [PAD-1:0] shifted_left_pad_mask;
		always_ff @(posedge clk) 
		begin
			if (!rstn) 
				shifted_left_pad_mask <= {PAD{1'b1}}; 
			else if (padrow_complete) 
				shifted_left_pad_mask <= {PAD{1'b1}}; 
			else if (valid)
				shifted_left_pad_mask <= shifted_left_pad_mask << left_pad_shift; 
			else
				shifted_left_pad_mask <= shifted_left_pad_mask; 
		end
	assign left_pad_mask =  {{KER_SIZE-PAD{1'b0}},shifted_left_pad_mask};
	end
	
	else
	begin
		assign left_pad_mask =  {KER_SIZE{1'b0}};
	end
endgenerate
	
assign left_pad_shift  = global_col_ptr >= KER_SIZE-PAD-1 && global_col_ptr < KER_SIZE-1 ? 1'b1 : 1'b0;

// Right pad logic
logic right_pad_en;
logic [2:0] right_pad_counter;
logic [KER_SIZE-1:0]right_pad_shift;

always_ff @(posedge clk) begin
    if (!rstn) begin
        right_pad_en <= '0;
    end
    else if (global_col_ptr==INPUT_X_DIM-PAD-1) begin
        right_pad_en <= '1;
    end
    else if(right_pad_counter==KER_SIZE-1)begin //PAD + (KER_SIZE-PAD-1)
        right_pad_en <= 0;
    end
end

always_ff @(posedge clk) begin
    if (!rstn) begin
        right_pad_counter <= '0;
    end
    else if (right_pad_counter==KER_SIZE-1) begin
        right_pad_counter <= 0;
    end
    else if (right_pad_en) begin
        right_pad_counter <= right_pad_counter + 1'd1;
    end
    else 
        right_pad_counter <= 0;
end

assign right_pad_shift =  right_pad_en && !(right_pad_counter<PAD+1);
assign right_pad_valid = right_pad_shift;

generate
	if(PAD>0) 
	begin
		logic [KER_SIZE-1:0] right_pad_mask_wire;
		always_ff @(posedge clk) 
		begin
			if (!rstn) 
				right_pad_mask_wire <=  {1'b1,{KER_SIZE-1{1'b0}}};
			else if (global_col_ptr==INPUT_X_DIM-PAD-1) 
				right_pad_mask_wire <=  {1'b1,{KER_SIZE-1{1'b0}}};
			else if (right_pad_shift)
				right_pad_mask_wire <= (right_pad_mask_wire >> 1) | {1'b1,{KER_SIZE-1{1'b0}}};
			else
				right_pad_mask_wire <= {1'b1,{KER_SIZE-1{1'b0}}};
		end
		assign right_pad_mask = right_pad_shift ? right_pad_mask_wire: 0;
	end
	
	else
	begin
		assign right_pad_mask =  {KER_SIZE{1'b0}};
	end
endgenerate
endmodule




module sram_array_k3
#(
    parameter KER_SIZE = 3,
    parameter DW       = 32, // Data width (nbits)
    parameter NW       = 32, // Number of words
    parameter AW       = $clog2(NW)
)
(
    input logic clk,
    input logic rstn,
    input logic [AW-1:0] a, // same for read and write    
    input logic [KER_SIZE-1:0] wen, // active high
    input logic [KER_SIZE-1:0] ren, // active high
    input logic [DW-1:0] d,
    output logic [(KER_SIZE-1)*DW-1:0] q
);

//logic [DW-1:0] q_wire [KER_SIZE-1:0];
logic [KER_SIZE*DW-1:0] q_wire; 

logic [KER_SIZE-1:0] write_en_D1;

always_ff @(posedge clk) begin
    if(!rstn) begin
        write_en_D1 <= '0;
    end
    else begin
        write_en_D1 <= wen;
    end
end

genvar i;
generate
    for (i = 0; i < (KER_SIZE); i++) begin
        array #(
            .DW (DW),
            .NW (NW),
            .AW (AW)
        ) sram_inst (
            .clk (clk),
            .cen (!(wen[i] || ren[i])),
            .gwen (!(wen[i])),
            .a (a),
            .d (d),
            .q (q_wire[(i+1)*DW-1:i*DW])
        );
    end
endgenerate

// reorder rows
always_comb begin
    case (1'b1)
        write_en_D1[0] : q = {q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW]};
        write_en_D1[1] : q = {q_wire[DW-1:0],q_wire[3*DW-1:2*DW]};
        write_en_D1[2] : q = {q_wire[2*DW-1:DW],q_wire[DW-1:0]};
        default :        q = '0;
    endcase
end

endmodule

module sram_array_k5
#(
    parameter KER_SIZE = 5,
    parameter DW = 32, // Data width (nbits)
    parameter NW = 32, // Number of words
    parameter AW = $clog2(NW)
)
(
    input logic clk,
    input logic rstn,
    input logic [AW-1:0] a, // same for read and write    
    input logic [KER_SIZE-1:0] wen, // active high
    input logic [KER_SIZE-1:0] ren, // active high
    input logic [DW-1:0] d,
    output logic [(KER_SIZE-1)*DW-1:0] q
);

//logic [DW-1:0] q_wire [KER_SIZE-1:0];
logic [KER_SIZE*DW-1:0] q_wire; 

logic [KER_SIZE-1:0] write_en_D1; // delayed write enable because of 1 cycle delay of sram

always_ff @(posedge clk) begin
    if(!rstn) begin
        write_en_D1 <= '0;
    end
    else begin
        write_en_D1 <= wen;
    end
end

genvar i;
generate
    for (i = 0; i < (KER_SIZE); i++) begin
        array #(
            .DW (DW),
            .NW (NW),
            .AW (AW)
        ) sram_inst (
            .clk (clk),
            .cen (!(wen[i] || ren[i])),
            .gwen (!(wen[i])),
            .a (a),
            .d (d),
            .q (q_wire[(i+1)*DW-1:i*DW])
        );
    end
endgenerate

// reorder rows
always_comb begin
    case (1'b1)
        write_en_D1[0] : q = {q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW]};
        write_en_D1[1] : q = {q_wire[DW-1:0],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW]};
        write_en_D1[2] : q = {q_wire[2*DW-1:DW],q_wire[DW-1:0],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW]};
        write_en_D1[3] : q = {q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:DW],q_wire[5*DW-1:4*DW]};
        write_en_D1[4] : q = {q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:0]};
        default :        q = '0;
    endcase
end

endmodule

module sram_array_k7
#(
    parameter KER_SIZE = 7,
    parameter DW = 32, // Data width (nbits)
    parameter NW = 32, // Number of words
    parameter AW = $clog2(NW)
)
(
    input logic clk,
    input logic rstn,
    input logic [AW-1:0] a, // same for read and write    
    input logic [KER_SIZE-1:0] wen, // active high
    input logic [KER_SIZE-1:0] ren, // active high
    input logic [DW-1:0] d,
    output logic [(KER_SIZE-1)*DW-1:0] q
);

//logic [DW-1:0] q_wire [KER_SIZE-1:0];
logic [KER_SIZE*DW-1:0] q_wire; 

logic [KER_SIZE-1:0] write_en_D1; // delayed write enable because of 1 cycle delay of sram

always_ff @(posedge clk) begin
    if(!rstn) begin
        write_en_D1 <= '0;
    end
    else begin
        write_en_D1 <= wen;
    end
end

genvar i;
generate
    for (i = 0; i < (KER_SIZE); i++) begin
        array #(
            .DW (DW),
            .NW (NW),
            .AW (AW)
        ) sram_inst (
            .clk (clk),
            .cen (!(wen[i] || ren[i])),
            .gwen (!(wen[i])),
            .a (a),
            .d (d),
            .q (q_wire[(i+1)*DW-1:i*DW])
        );
    end
endgenerate

// reorder rows
always_comb begin
    case (1'b1) 
        write_en_D1[0] : q = {q_wire[7*DW-1:6*DW],q_wire[6*DW-1:5*DW],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW]};
        write_en_D1[1] : q = {q_wire[DW-1:0],q_wire[7*DW-1:6*DW],q_wire[6*DW-1:5*DW],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW]};
        write_en_D1[2] : q = {q_wire[2*DW-1:DW],q_wire[DW-1:0],q_wire[7*DW-1:6*DW],q_wire[6*DW-1:5*DW],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW]};
        write_en_D1[3] : q = {q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:0],q_wire[7*DW-1:6*DW],q_wire[6*DW-1:5*DW],q_wire[5*DW-1:4*DW]};
        write_en_D1[4] : q = {q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:0],q_wire[7*DW-1:6*DW],q_wire[6*DW-1:5*DW]};
        write_en_D1[5] : q = {q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:0],q_wire[7*DW-1:6*DW]};
        write_en_D1[6] : q = {q_wire[6*DW-1:5*DW],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:0]};
        default :        q = '0;
    endcase
end

endmodule

module sram_array_k2
#(
    parameter KER_SIZE = 3,
    parameter DW = 32, // Data width (nbits)
    parameter NW = 32, // Number of words
    parameter AW = $clog2(NW)
)
(
    input logic clk,
    input logic rstn,
    input logic [AW-1:0] a, // same for read and write
    input logic [KER_SIZE-1:0] wen, // active high
    input logic [KER_SIZE-1:0] ren, // active high
    input logic [DW-1:0] d,
    output logic [(KER_SIZE-1)*DW-1:0] q
);

//logic [DW-1:0] q_wire [KER_SIZE-1:0];
logic [KER_SIZE*DW-1:0] q_wire; 

logic [KER_SIZE-1:0] write_en_D1;

always_ff @(posedge clk ) begin
    if(!rstn) begin
        write_en_D1 <= '0;
    end
    else begin
        write_en_D1 <= wen;
    end
end

genvar i;
generate
    for (i = 0; i < (KER_SIZE); i++) begin
        array #(
            .DW (DW),
            .NW (NW),
            .AW (AW)
        ) sram_inst (
            .clk (clk),
            .cen (!(wen[i] || ren[i])),
            .gwen (!(wen[i])),
            .a (a),
            .d (d),
            .q (q_wire[(i+1)*DW-1:i*DW])
        );
    end
endgenerate

// reorder rows
always_comb
begin
    case (1'b1)
        write_en_D1[0] : q = {q_wire[1]};
        write_en_D1[1] : q = {q_wire[0]};
        default :        q = '0;
    endcase
end

endmodule

module array
#(
    parameter DW = 32,
    parameter NW = 32,
    parameter AW = $clog2(NW) 
) 
(
    input logic clk,
    input logic cen, // enable active low
    input logic gwen, // global write enable active low
    input logic [AW-1:0] a,
    input logic [DW-1:0] d,
    output logic [DW-1:0] q
);

logic [DW-1:0] data [0:NW-1];

// write
always @(posedge clk) begin
    if (~cen & ~gwen) begin
        data[a] <= d;
    end
    else begin
        data[a] <= data[a];
    end
end

// read
always @(posedge clk) begin
    if (~cen) begin
        q <= data[a];
    end
    else begin
        q <= q;
    end
end

endmodule




module sram_controller
#(
    parameter KER_SIZE    = 3,
    parameter BITWIDTH    = 8,
    parameter STRIDE      = 8,
    parameter NFMAPS      = 3,
    parameter INPUT_X_DIM = 28,
    parameter PAD         = 1,
    parameter AW          = 5
)
(
  input logic clk,      
  input logic rstn,     
  input logic valid,
  output logic [AW-1:0] addr, // same for read and write    
  output logic [KER_SIZE-1:0] write_en,     
  output logic [KER_SIZE-1:0] read_en,
  output logic ready,
  output logic [KER_SIZE-1:0] top_pad_mask ,
  output logic bottom_pad_mask,
  output logic row_is_complete
);

genvar i;

logic [KER_SIZE:0] row_ptr          ;
logic [KER_SIZE:0] pad_row_ptr      ;
logic [7:0] global_row_ptr          ;
logic [7:0] global_row_ptr_nxt      ;
logic [AW-1:0] col_ptr              ;
logic [3:0] init_row_counter        ;
logic [KER_SIZE:0] row_ptr_nxt      ;
logic [AW-1:0] col_ptr_nxt          ;
logic [3:0] init_row_counter_nxt    ;
logic [3-1:0] row_stride_counter    ;
logic [3-1:0] row_stride_counter_nxt;

//padding
logic [KER_SIZE-1:0]top_pad_shift;
logic [KER_SIZE-1:0] init_top_pad_mask;

always_ff @(posedge clk) begin
    if (!rstn) begin
        row_ptr 			      <= PAD;//top padding
        global_row_ptr 		  <= 'd0;
        col_ptr 			      <= 'd0;
        init_row_counter 	  <= PAD;//top padding
        row_stride_counter 	<= 'd0;
    end
    else begin
        row_ptr 			      <= row_ptr_nxt;
        global_row_ptr 		  <= global_row_ptr_nxt;
        col_ptr 			      <= col_ptr_nxt;
        init_row_counter 	  <= init_row_counter_nxt;
        row_stride_counter 	<= row_stride_counter_nxt;
    end
end

generate
    for (i=0;i<KER_SIZE;i++) begin
        assign write_en[i] = (row_ptr==i); 
    end
endgenerate

logic col_ptr_done;
logic top_pad_en;
assign col_ptr_done           = col_ptr==(INPUT_X_DIM-1);

assign row_is_complete  	    = valid && col_ptr_done;
assign col_ptr_nxt 			      = valid ? (col_ptr_done ? 'd0 : col_ptr + 1'd1) : col_ptr ; 
assign row_ptr_nxt 			      = valid && col_ptr_done ? (row_ptr==KER_SIZE-1 ? 'd0 : row_ptr + 1'd1): row_ptr;
assign global_row_ptr_nxt 	  = valid && col_ptr_done ?  global_row_ptr + 1'd1 : global_row_ptr;
assign init_row_counter_nxt   = valid && col_ptr_done && (init_row_counter<KER_SIZE-1) 	? init_row_counter + 1'd1 : init_row_counter;

assign read_en 	              = {KER_SIZE{init_row_counter == KER_SIZE-1}} & (~write_en); 
assign addr 	                = col_ptr;
assign ready 	                = (init_row_counter == KER_SIZE-1) && (row_stride_counter==0);
assign row_stride_counter_nxt = (col_ptr==(INPUT_X_DIM-1) && valid && init_row_counter == KER_SIZE-1) ? ((row_stride_counter<STRIDE-1'd1)?row_stride_counter+1'd1:'0 ): row_stride_counter;

generate
if(PAD>0)
	begin
		always_ff @(posedge clk) 
			begin
				if (!rstn) 
					top_pad_en   <= 1'd0; 
				else 
					top_pad_en   <= valid && col_ptr_done; 
			end
			
		always_ff @(posedge clk) 
			begin
				if (!rstn) 
					top_pad_mask <= init_top_pad_mask; 
				else if (top_pad_en)
					top_pad_mask <= top_pad_mask >> top_pad_shift; 
				else
					top_pad_mask <= top_pad_mask; 
			end
			
	assign bottom_pad_mask 	= global_row_ptr > INPUT_X_DIM - 1'd1; // tell line buffer that one row is done, pad zeros if needed at the bottom rows
	assign top_pad_shift 		= global_row_ptr > KER_SIZE-PAD && global_row_ptr <KER_SIZE+1 ? 1'b1 : 1'b0;
	
	end
else 
	begin
		assign top_pad_mask 		= 0;
		assign bottom_pad_mask 	= 0;
		assign top_pad_en 			= 0;
		assign top_pad_shift 		= 0;
	end
endgenerate
		
generate
	for (i=0;i<KER_SIZE;i++) 
	begin
		always_ff @(posedge clk) begin
			if (!rstn) 
				init_top_pad_mask[i] <= i<PAD ? 1'b1 : 1'd0; 
			else 
				init_top_pad_mask[i] <= init_top_pad_mask[i];
		end
    end
endgenerate

endmodule



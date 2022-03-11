module conv1_dw (
    input logic clk,
    input logic rstn,
    input logic valid,
    input logic [8*72-1:0] input_act,
    output logic [64-1:0] output_act,
    output logic ready
);
logic we; 
logic [8*72-1:0] input_act_ff;
genvar i;
generate
for (i=0;i<8;i++)
    begin
        always_ff @(posedge clk) begin
            if (rstn == 0) begin
                input_act_ff[(i+1)*72-1:i*72] <= '0;
            end
            else begin
                input_act_ff[(i+1)*72-1:i*72] <= input_act[(i+1)*72-1:i*72];
            end
        end
    end
endgenerate
logic [71:0] input_fmap_0;
assign input_fmap_0 = input_act_ff[71:0];
logic [71:0] input_fmap_1;
assign input_fmap_1 = input_act_ff[143:72];
logic [71:0] input_fmap_2;
assign input_fmap_2 = input_act_ff[215:144];
logic [71:0] input_fmap_3;
assign input_fmap_3 = input_act_ff[287:216];
logic [71:0] input_fmap_4;
assign input_fmap_4 = input_act_ff[359:288];
logic [71:0] input_fmap_5;
assign input_fmap_5 = input_act_ff[431:360];
logic [71:0] input_fmap_6;
assign input_fmap_6 = input_act_ff[503:432];
logic [71:0] input_fmap_7;
assign input_fmap_7 = input_act_ff[575:504];

logic signed [31:0]O0_I0_R0_C0_SM1 ;  assign O0_I0_R0_C0_SM1  = (-6'sd19) * $signed(input_fmap_0[7:0]);
logic signed [31:0]O0_I0_R0_C1_SM1 ;  assign O0_I0_R0_C1_SM1  = (-7'sd51) * $signed(input_fmap_0[15:8]);
logic signed [31:0]O0_I0_R0_C2_SM1 ;  assign O0_I0_R0_C2_SM1  = (-6'sd19) * $signed(input_fmap_0[23:16]);
logic signed [31:0]O0_I0_R1_C0_SM1 ;  assign O0_I0_R1_C0_SM1  = ( 5'sd10) * $signed(input_fmap_0[31:24]);
logic signed [31:0]O0_I0_R1_C1_SM1 ;  assign O0_I0_R1_C1_SM1  = (-4'sd5) * $signed(input_fmap_0[39:32]);
logic signed [31:0]O0_I0_R1_C2_SM1 ;  assign O0_I0_R1_C2_SM1  = (-5'sd8) * $signed(input_fmap_0[47:40]);
logic signed [31:0]O0_I0_R2_C0_SM1 ;  assign O0_I0_R2_C0_SM1  = ( 6'sd19) * $signed(input_fmap_0[55:48]);
logic signed [31:0]O0_I0_R2_C1_SM1 ;  assign O0_I0_R2_C1_SM1  = ( 6'sd23) * $signed(input_fmap_0[63:56]);
logic signed [31:0]O0_I0_R2_C2_SM1 ;  assign O0_I0_R2_C2_SM1  = ( 6'sd19) * $signed(input_fmap_0[71:64]);
logic signed [31:0]O1_I1_R0_C0_SM1 ;  assign O1_I1_R0_C0_SM1  = ( 5'sd13) * $signed(input_fmap_1[7:0]);
logic signed [31:0]O1_I1_R0_C1_SM1 ;  assign O1_I1_R0_C1_SM1  = ( 8'sd69) * $signed(input_fmap_1[15:8]);
logic signed [31:0]O1_I1_R1_C0_SM1 ;  assign O1_I1_R1_C0_SM1  = (-5'sd8) * $signed(input_fmap_1[31:24]);
logic signed [31:0]O1_I1_R1_C1_SM1 ;  assign O1_I1_R1_C1_SM1  = (-8'sd74) * $signed(input_fmap_1[39:32]);
logic signed [31:0]O1_I1_R1_C2_SM1 ;  assign O1_I1_R1_C2_SM1  = ( 4'sd4) * $signed(input_fmap_1[47:40]);
logic signed [31:0]O1_I1_R2_C0_SM1 ;  assign O1_I1_R2_C0_SM1  = (-4'sd6) * $signed(input_fmap_1[55:48]);
logic signed [31:0]O1_I1_R2_C1_SM1 ;  assign O1_I1_R2_C1_SM1  = ( 4'sd7) * $signed(input_fmap_1[63:56]);
logic signed [31:0]O1_I1_R2_C2_SM1 ;  assign O1_I1_R2_C2_SM1  = (-4'sd5) * $signed(input_fmap_1[71:64]);
logic signed [31:0]O2_I2_R0_C0_SM1 ;  assign O2_I2_R0_C0_SM1  = (-4'sd5) * $signed(input_fmap_2[7:0]);
logic signed [31:0]O2_I2_R0_C1_SM1 ;  assign O2_I2_R0_C1_SM1  = (-5'sd9) * $signed(input_fmap_2[15:8]);
logic signed [31:0]O2_I2_R0_C2_SM1 ;  assign O2_I2_R0_C2_SM1  = (-5'sd8) * $signed(input_fmap_2[23:16]);
logic signed [31:0]O2_I2_R1_C0_SM1 ;  assign O2_I2_R1_C0_SM1  = ( 3'sd3) * $signed(input_fmap_2[31:24]);
logic signed [31:0]O2_I2_R1_C1_SM1 ;  assign O2_I2_R1_C1_SM1  = (-3'sd2) * $signed(input_fmap_2[39:32]);
logic signed [31:0]O2_I2_R1_C2_SM1 ;  assign O2_I2_R1_C2_SM1  = (-4'sd7) * $signed(input_fmap_2[47:40]);
logic signed [31:0]O2_I2_R2_C0_SM1 ;  assign O2_I2_R2_C0_SM1  = ( 6'sd17) * $signed(input_fmap_2[55:48]);
logic signed [31:0]O2_I2_R2_C1_SM1 ;  assign O2_I2_R2_C1_SM1  = ( 5'sd14) * $signed(input_fmap_2[63:56]);
logic signed [31:0]O2_I2_R2_C2_SM1 ;  assign O2_I2_R2_C2_SM1  = (-3'sd3) * $signed(input_fmap_2[71:64]);
logic signed [31:0]O3_I3_R0_C0_SM1 ;  assign O3_I3_R0_C0_SM1  = ( 6'sd31) * $signed(input_fmap_3[7:0]);
logic signed [31:0]O3_I3_R0_C1_SM1 ;  assign O3_I3_R0_C1_SM1  = ( 3'sd3) * $signed(input_fmap_3[15:8]);
logic signed [31:0]O3_I3_R0_C2_SM1 ;  assign O3_I3_R0_C2_SM1  = (-7'sd35) * $signed(input_fmap_3[23:16]);
logic signed [31:0]O3_I3_R1_C0_SM1 ;  assign O3_I3_R1_C0_SM1  = ( 6'sd16) * $signed(input_fmap_3[31:24]);
logic signed [31:0]O3_I3_R1_C1_SM1 ;  assign O3_I3_R1_C1_SM1  = (-4'sd6) * $signed(input_fmap_3[39:32]);
logic signed [31:0]O3_I3_R1_C2_SM1 ;  assign O3_I3_R1_C2_SM1  = (-6'sd31) * $signed(input_fmap_3[47:40]);
logic signed [31:0]O3_I3_R2_C0_SM1 ;  assign O3_I3_R2_C0_SM1  = ( 4'sd4) * $signed(input_fmap_3[55:48]);
logic signed [31:0]O3_I3_R2_C1_SM1 ;  assign O3_I3_R2_C1_SM1  = ( 5'sd8) * $signed(input_fmap_3[63:56]);
logic signed [31:0]O3_I3_R2_C2_SM1 ;  assign O3_I3_R2_C2_SM1  = ( 5'sd11) * $signed(input_fmap_3[71:64]);
logic signed [31:0]O4_I4_R0_C0_SM1 ;  assign O4_I4_R0_C0_SM1  = ( 3'sd2) * $signed(input_fmap_4[7:0]);
logic signed [31:0]O4_I4_R0_C1_SM1 ;  assign O4_I4_R0_C1_SM1  = ( 2'sd1) * $signed(input_fmap_4[15:8]);
logic signed [31:0]O4_I4_R0_C2_SM1 ;  assign O4_I4_R0_C2_SM1  = ( 6'sd19) * $signed(input_fmap_4[23:16]);
logic signed [31:0]O4_I4_R1_C0_SM1 ;  assign O4_I4_R1_C0_SM1  = ( 5'sd8) * $signed(input_fmap_4[31:24]);
logic signed [31:0]O4_I4_R1_C1_SM1 ;  assign O4_I4_R1_C1_SM1  = (-5'sd8) * $signed(input_fmap_4[39:32]);
logic signed [31:0]O4_I4_R1_C2_SM1 ;  assign O4_I4_R1_C2_SM1  = ( 4'sd7) * $signed(input_fmap_4[47:40]);
logic signed [31:0]O4_I4_R2_C0_SM1 ;  assign O4_I4_R2_C0_SM1  = (-4'sd6) * $signed(input_fmap_4[55:48]);
logic signed [31:0]O4_I4_R2_C1_SM1 ;  assign O4_I4_R2_C1_SM1  = (-4'sd4) * $signed(input_fmap_4[63:56]);
logic signed [31:0]O4_I4_R2_C2_SM1 ;  assign O4_I4_R2_C2_SM1  = (-4'sd5) * $signed(input_fmap_4[71:64]);
logic signed [31:0]O5_I5_R0_C0_SM1 ;  assign O5_I5_R0_C0_SM1  = ( 4'sd4) * $signed(input_fmap_5[7:0]);
logic signed [31:0]O5_I5_R0_C1_SM1 ;  assign O5_I5_R0_C1_SM1  = ( 8'sd66) * $signed(input_fmap_5[15:8]);
logic signed [31:0]O5_I5_R0_C2_SM1 ;  assign O5_I5_R0_C2_SM1  = (-7'sd37) * $signed(input_fmap_5[23:16]);
logic signed [31:0]O5_I5_R1_C0_SM1 ;  assign O5_I5_R1_C0_SM1  = ( 5'sd9) * $signed(input_fmap_5[31:24]);
logic signed [31:0]O5_I5_R1_C1_SM1 ;  assign O5_I5_R1_C1_SM1  = ( 7'sd45) * $signed(input_fmap_5[39:32]);
logic signed [31:0]O5_I5_R1_C2_SM1 ;  assign O5_I5_R1_C2_SM1  = (-4'sd5) * $signed(input_fmap_5[47:40]);
logic signed [31:0]O5_I5_R2_C0_SM1 ;  assign O5_I5_R2_C0_SM1  = (-6'sd20) * $signed(input_fmap_5[55:48]);
logic signed [31:0]O5_I5_R2_C1_SM1 ;  assign O5_I5_R2_C1_SM1  = (-7'sd36) * $signed(input_fmap_5[63:56]);
logic signed [31:0]O5_I5_R2_C2_SM1 ;  assign O5_I5_R2_C2_SM1  = (-4'sd5) * $signed(input_fmap_5[71:64]);
logic signed [31:0]O6_I6_R0_C0_SM1 ;  assign O6_I6_R0_C0_SM1  = (-7'sd35) * $signed(input_fmap_6[7:0]);
logic signed [31:0]O6_I6_R0_C1_SM1 ;  assign O6_I6_R0_C1_SM1  = ( 6'sd31) * $signed(input_fmap_6[15:8]);
logic signed [31:0]O6_I6_R0_C2_SM1 ;  assign O6_I6_R0_C2_SM1  = ( 7'sd50) * $signed(input_fmap_6[23:16]);
logic signed [31:0]O6_I6_R1_C0_SM1 ;  assign O6_I6_R1_C0_SM1  = (-2'sd1) * $signed(input_fmap_6[31:24]);
logic signed [31:0]O6_I6_R1_C1_SM1 ;  assign O6_I6_R1_C1_SM1  = ( 6'sd27) * $signed(input_fmap_6[39:32]);
logic signed [31:0]O6_I6_R1_C2_SM1 ;  assign O6_I6_R1_C2_SM1  = ( 5'sd13) * $signed(input_fmap_6[47:40]);
logic signed [31:0]O6_I6_R2_C0_SM1 ;  assign O6_I6_R2_C0_SM1  = ( 3'sd2) * $signed(input_fmap_6[55:48]);
logic signed [31:0]O6_I6_R2_C1_SM1 ;  assign O6_I6_R2_C1_SM1  = (-6'sd29) * $signed(input_fmap_6[63:56]);
logic signed [31:0]O6_I6_R2_C2_SM1 ;  assign O6_I6_R2_C2_SM1  = (-7'sd43) * $signed(input_fmap_6[71:64]);
logic signed [31:0]O7_I7_R0_C0_SM1 ;  assign O7_I7_R0_C0_SM1  = ( 4'sd6) * $signed(input_fmap_7[7:0]);
logic signed [31:0]O7_I7_R0_C1_SM1 ;  assign O7_I7_R0_C1_SM1  = (-6'sd31) * $signed(input_fmap_7[15:8]);
logic signed [31:0]O7_I7_R0_C2_SM1 ;  assign O7_I7_R0_C2_SM1  = (-6'sd30) * $signed(input_fmap_7[23:16]);
logic signed [31:0]O7_I7_R1_C0_SM1 ;  assign O7_I7_R1_C0_SM1  = (-4'sd6) * $signed(input_fmap_7[31:24]);
logic signed [31:0]O7_I7_R1_C1_SM1 ;  assign O7_I7_R1_C1_SM1  = (-5'sd13) * $signed(input_fmap_7[39:32]);
logic signed [31:0]O7_I7_R1_C2_SM1 ;  assign O7_I7_R1_C2_SM1  = (-5'sd12) * $signed(input_fmap_7[47:40]);
logic signed [31:0]O7_I7_R2_C0_SM1 ;  assign O7_I7_R2_C0_SM1  = ( 4'sd4) * $signed(input_fmap_7[55:48]);
logic signed [31:0]O7_I7_R2_C1_SM1 ;  assign O7_I7_R2_C1_SM1  = ( 7'sd34) * $signed(input_fmap_7[63:56]);
logic signed [31:0]O7_I7_R2_C2_SM1 ;  assign O7_I7_R2_C2_SM1  = ( 6'sd24) * $signed(input_fmap_7[71:64]);
logic signed [31:0] conv_mac_0;
logic signed [31:0] O0_N0_S0;		always @(posedge clk) O0_N0_S0 <=     O0_I0_R0_C0_SM1   +  O0_I0_R0_C1_SM1  ;
 logic signed [31:0] O0_N2_S0;		always @(posedge clk) O0_N2_S0 <=     O0_I0_R0_C2_SM1   +  O0_I0_R1_C0_SM1  ;
 logic signed [31:0] O0_N4_S0;		always @(posedge clk) O0_N4_S0 <=     O0_I0_R1_C1_SM1   +  O0_I0_R1_C2_SM1  ;
 logic signed [31:0] O0_N6_S0;		always @(posedge clk) O0_N6_S0 <=     O0_I0_R2_C0_SM1   +  O0_I0_R2_C1_SM1  ;
 logic signed [31:0] O0_N8_S0;		always @(posedge clk) O0_N8_S0 <=     O0_I0_R2_C2_SM1      ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O0_N0_S1;		always @(posedge clk) O0_N0_S1 <=     O0_N0_S0  +  O0_N2_S0 ;
 logic signed [31:0] O0_N2_S1;		always @(posedge clk) O0_N2_S1 <=     O0_N4_S0  +  O0_N6_S0 ;
 logic signed [31:0] O0_N4_S1;		always @(posedge clk) O0_N4_S1 <=     O0_N8_S0     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O0_N0_S2;		always @(posedge clk) O0_N0_S2 <=     O0_N0_S1  +  O0_N2_S1 ;
 logic signed [31:0] O0_N2_S2;		always @(posedge clk) O0_N2_S2 <=     O0_N4_S1     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O0_N0_S3;		always @(posedge clk) O0_N0_S3 <=     O0_N0_S2  +  O0_N2_S2 ;
 assign conv_mac_0 = O0_N0_S3;

logic signed [31:0] conv_mac_1;
logic signed [31:0] O1_N0_S0;		always @(posedge clk) O1_N0_S0 <=     O1_I1_R0_C0_SM1   +  O1_I1_R0_C1_SM1  ;
 logic signed [31:0] O1_N2_S0;		always @(posedge clk) O1_N2_S0 <=     O1_I1_R1_C0_SM1   +  O1_I1_R1_C1_SM1  ;
 logic signed [31:0] O1_N4_S0;		always @(posedge clk) O1_N4_S0 <=     O1_I1_R1_C2_SM1   +  O1_I1_R2_C0_SM1  ;
 logic signed [31:0] O1_N6_S0;		always @(posedge clk) O1_N6_S0 <=     O1_I1_R2_C1_SM1   +  O1_I1_R2_C2_SM1  ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O1_N0_S1;		always @(posedge clk) O1_N0_S1 <=     O1_N0_S0  +  O1_N2_S0 ;
 logic signed [31:0] O1_N2_S1;		always @(posedge clk) O1_N2_S1 <=     O1_N4_S0  +  O1_N6_S0 ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O1_N0_S2;		always @(posedge clk) O1_N0_S2 <=     O1_N0_S1  +  O1_N2_S1 ;
 assign conv_mac_1 = O1_N0_S2;

logic signed [31:0] conv_mac_2;
logic signed [31:0] O2_N0_S0;		always @(posedge clk) O2_N0_S0 <=     O2_I2_R0_C0_SM1   +  O2_I2_R0_C1_SM1  ;
 logic signed [31:0] O2_N2_S0;		always @(posedge clk) O2_N2_S0 <=     O2_I2_R0_C2_SM1   +  O2_I2_R1_C0_SM1  ;
 logic signed [31:0] O2_N4_S0;		always @(posedge clk) O2_N4_S0 <=     O2_I2_R1_C1_SM1   +  O2_I2_R1_C2_SM1  ;
 logic signed [31:0] O2_N6_S0;		always @(posedge clk) O2_N6_S0 <=     O2_I2_R2_C0_SM1   +  O2_I2_R2_C1_SM1  ;
 logic signed [31:0] O2_N8_S0;		always @(posedge clk) O2_N8_S0 <=     O2_I2_R2_C2_SM1      ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O2_N0_S1;		always @(posedge clk) O2_N0_S1 <=     O2_N0_S0  +  O2_N2_S0 ;
 logic signed [31:0] O2_N2_S1;		always @(posedge clk) O2_N2_S1 <=     O2_N4_S0  +  O2_N6_S0 ;
 logic signed [31:0] O2_N4_S1;		always @(posedge clk) O2_N4_S1 <=     O2_N8_S0     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O2_N0_S2;		always @(posedge clk) O2_N0_S2 <=     O2_N0_S1  +  O2_N2_S1 ;
 logic signed [31:0] O2_N2_S2;		always @(posedge clk) O2_N2_S2 <=     O2_N4_S1     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O2_N0_S3;		always @(posedge clk) O2_N0_S3 <=     O2_N0_S2  +  O2_N2_S2 ;
 assign conv_mac_2 = O2_N0_S3;

logic signed [31:0] conv_mac_3;
logic signed [31:0] O3_N0_S0;		always @(posedge clk) O3_N0_S0 <=     O3_I3_R0_C0_SM1   +  O3_I3_R0_C1_SM1  ;
 logic signed [31:0] O3_N2_S0;		always @(posedge clk) O3_N2_S0 <=     O3_I3_R0_C2_SM1   +  O3_I3_R1_C0_SM1  ;
 logic signed [31:0] O3_N4_S0;		always @(posedge clk) O3_N4_S0 <=     O3_I3_R1_C1_SM1   +  O3_I3_R1_C2_SM1  ;
 logic signed [31:0] O3_N6_S0;		always @(posedge clk) O3_N6_S0 <=     O3_I3_R2_C0_SM1   +  O3_I3_R2_C1_SM1  ;
 logic signed [31:0] O3_N8_S0;		always @(posedge clk) O3_N8_S0 <=     O3_I3_R2_C2_SM1      ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O3_N0_S1;		always @(posedge clk) O3_N0_S1 <=     O3_N0_S0  +  O3_N2_S0 ;
 logic signed [31:0] O3_N2_S1;		always @(posedge clk) O3_N2_S1 <=     O3_N4_S0  +  O3_N6_S0 ;
 logic signed [31:0] O3_N4_S1;		always @(posedge clk) O3_N4_S1 <=     O3_N8_S0     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O3_N0_S2;		always @(posedge clk) O3_N0_S2 <=     O3_N0_S1  +  O3_N2_S1 ;
 logic signed [31:0] O3_N2_S2;		always @(posedge clk) O3_N2_S2 <=     O3_N4_S1     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O3_N0_S3;		always @(posedge clk) O3_N0_S3 <=     O3_N0_S2  +  O3_N2_S2 ;
 assign conv_mac_3 = O3_N0_S3;

logic signed [31:0] conv_mac_4;
logic signed [31:0] O4_N0_S0;		always @(posedge clk) O4_N0_S0 <=     O4_I4_R0_C0_SM1   +  O4_I4_R0_C1_SM1  ;
 logic signed [31:0] O4_N2_S0;		always @(posedge clk) O4_N2_S0 <=     O4_I4_R0_C2_SM1   +  O4_I4_R1_C0_SM1  ;
 logic signed [31:0] O4_N4_S0;		always @(posedge clk) O4_N4_S0 <=     O4_I4_R1_C1_SM1   +  O4_I4_R1_C2_SM1  ;
 logic signed [31:0] O4_N6_S0;		always @(posedge clk) O4_N6_S0 <=     O4_I4_R2_C0_SM1   +  O4_I4_R2_C1_SM1  ;
 logic signed [31:0] O4_N8_S0;		always @(posedge clk) O4_N8_S0 <=     O4_I4_R2_C2_SM1      ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O4_N0_S1;		always @(posedge clk) O4_N0_S1 <=     O4_N0_S0  +  O4_N2_S0 ;
 logic signed [31:0] O4_N2_S1;		always @(posedge clk) O4_N2_S1 <=     O4_N4_S0  +  O4_N6_S0 ;
 logic signed [31:0] O4_N4_S1;		always @(posedge clk) O4_N4_S1 <=     O4_N8_S0     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O4_N0_S2;		always @(posedge clk) O4_N0_S2 <=     O4_N0_S1  +  O4_N2_S1 ;
 logic signed [31:0] O4_N2_S2;		always @(posedge clk) O4_N2_S2 <=     O4_N4_S1     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O4_N0_S3;		always @(posedge clk) O4_N0_S3 <=     O4_N0_S2  +  O4_N2_S2 ;
 assign conv_mac_4 = O4_N0_S3;

logic signed [31:0] conv_mac_5;
logic signed [31:0] O5_N0_S0;		always @(posedge clk) O5_N0_S0 <=     O5_I5_R0_C0_SM1   +  O5_I5_R0_C1_SM1  ;
 logic signed [31:0] O5_N2_S0;		always @(posedge clk) O5_N2_S0 <=     O5_I5_R0_C2_SM1   +  O5_I5_R1_C0_SM1  ;
 logic signed [31:0] O5_N4_S0;		always @(posedge clk) O5_N4_S0 <=     O5_I5_R1_C1_SM1   +  O5_I5_R1_C2_SM1  ;
 logic signed [31:0] O5_N6_S0;		always @(posedge clk) O5_N6_S0 <=     O5_I5_R2_C0_SM1   +  O5_I5_R2_C1_SM1  ;
 logic signed [31:0] O5_N8_S0;		always @(posedge clk) O5_N8_S0 <=     O5_I5_R2_C2_SM1      ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O5_N0_S1;		always @(posedge clk) O5_N0_S1 <=     O5_N0_S0  +  O5_N2_S0 ;
 logic signed [31:0] O5_N2_S1;		always @(posedge clk) O5_N2_S1 <=     O5_N4_S0  +  O5_N6_S0 ;
 logic signed [31:0] O5_N4_S1;		always @(posedge clk) O5_N4_S1 <=     O5_N8_S0     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O5_N0_S2;		always @(posedge clk) O5_N0_S2 <=     O5_N0_S1  +  O5_N2_S1 ;
 logic signed [31:0] O5_N2_S2;		always @(posedge clk) O5_N2_S2 <=     O5_N4_S1     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O5_N0_S3;		always @(posedge clk) O5_N0_S3 <=     O5_N0_S2  +  O5_N2_S2 ;
 assign conv_mac_5 = O5_N0_S3;

logic signed [31:0] conv_mac_6;
logic signed [31:0] O6_N0_S0;		always @(posedge clk) O6_N0_S0 <=     O6_I6_R0_C0_SM1   +  O6_I6_R0_C1_SM1  ;
 logic signed [31:0] O6_N2_S0;		always @(posedge clk) O6_N2_S0 <=     O6_I6_R0_C2_SM1   +  O6_I6_R1_C0_SM1  ;
 logic signed [31:0] O6_N4_S0;		always @(posedge clk) O6_N4_S0 <=     O6_I6_R1_C1_SM1   +  O6_I6_R1_C2_SM1  ;
 logic signed [31:0] O6_N6_S0;		always @(posedge clk) O6_N6_S0 <=     O6_I6_R2_C0_SM1   +  O6_I6_R2_C1_SM1  ;
 logic signed [31:0] O6_N8_S0;		always @(posedge clk) O6_N8_S0 <=     O6_I6_R2_C2_SM1      ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O6_N0_S1;		always @(posedge clk) O6_N0_S1 <=     O6_N0_S0  +  O6_N2_S0 ;
 logic signed [31:0] O6_N2_S1;		always @(posedge clk) O6_N2_S1 <=     O6_N4_S0  +  O6_N6_S0 ;
 logic signed [31:0] O6_N4_S1;		always @(posedge clk) O6_N4_S1 <=     O6_N8_S0     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O6_N0_S2;		always @(posedge clk) O6_N0_S2 <=     O6_N0_S1  +  O6_N2_S1 ;
 logic signed [31:0] O6_N2_S2;		always @(posedge clk) O6_N2_S2 <=     O6_N4_S1     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O6_N0_S3;		always @(posedge clk) O6_N0_S3 <=     O6_N0_S2  +  O6_N2_S2 ;
 assign conv_mac_6 = O6_N0_S3;

logic signed [31:0] conv_mac_7;
logic signed [31:0] O7_N0_S0;		always @(posedge clk) O7_N0_S0 <=     O7_I7_R0_C0_SM1   +  O7_I7_R0_C1_SM1  ;
 logic signed [31:0] O7_N2_S0;		always @(posedge clk) O7_N2_S0 <=     O7_I7_R0_C2_SM1   +  O7_I7_R1_C0_SM1  ;
 logic signed [31:0] O7_N4_S0;		always @(posedge clk) O7_N4_S0 <=     O7_I7_R1_C1_SM1   +  O7_I7_R1_C2_SM1  ;
 logic signed [31:0] O7_N6_S0;		always @(posedge clk) O7_N6_S0 <=     O7_I7_R2_C0_SM1   +  O7_I7_R2_C1_SM1  ;
 logic signed [31:0] O7_N8_S0;		always @(posedge clk) O7_N8_S0 <=     O7_I7_R2_C2_SM1      ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O7_N0_S1;		always @(posedge clk) O7_N0_S1 <=     O7_N0_S0  +  O7_N2_S0 ;
 logic signed [31:0] O7_N2_S1;		always @(posedge clk) O7_N2_S1 <=     O7_N4_S0  +  O7_N6_S0 ;
 logic signed [31:0] O7_N4_S1;		always @(posedge clk) O7_N4_S1 <=     O7_N8_S0     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O7_N0_S2;		always @(posedge clk) O7_N0_S2 <=     O7_N0_S1  +  O7_N2_S1 ;
 logic signed [31:0] O7_N2_S2;		always @(posedge clk) O7_N2_S2 <=     O7_N4_S1     ;
 //----------------------adder tree stage complete--------------------------------//
logic signed [31:0] O7_N0_S3;		always @(posedge clk) O7_N0_S3 <=     O7_N0_S2  +  O7_N2_S2 ;
 assign conv_mac_7 = O7_N0_S3;

logic valid_D1;
always_ff @(posedge clk) begin
	if (rstn == 0) valid_D1<= 0 ;
	else valid_D1<=valid;
end
logic valid_D2;
always_ff @(posedge clk) begin
	if (rstn == 0) valid_D2<= 0 ;
	else valid_D2<=valid_D1;
end
logic valid_D3;
always_ff @(posedge clk) begin
	if (rstn == 0) valid_D3<= 0 ;
	else valid_D3<=valid_D2;
end
logic valid_D4;
always_ff @(posedge clk) begin
	if (rstn == 0) valid_D4<= 0 ;
	else valid_D4<=valid_D3;
end
always_ff @(posedge clk) begin
	if (rstn == 0) ready <= 0 ;
	else ready <=valid_D4;
end
logic [31:0] bias_add_0;
assign bias_add_0 = conv_mac_0 + 7'd41;
logic [31:0] bias_add_1;
assign bias_add_1 = conv_mac_1 + 6'd19;
logic [31:0] bias_add_2;
assign bias_add_2 = conv_mac_2 - 4'd7;
logic [31:0] bias_add_3;
assign bias_add_3 = conv_mac_3 + 7'd46;
logic [31:0] bias_add_4;
assign bias_add_4 = conv_mac_4 - 6'd22;
logic [31:0] bias_add_5;
assign bias_add_5 = conv_mac_5 + 6'd27;
logic [31:0] bias_add_6;
assign bias_add_6 = conv_mac_6 + 5'd14;
logic [31:0] bias_add_7;
assign bias_add_7 = conv_mac_7 + 7'd34;

logic [7:0] relu_0;
assign relu_0[7:0] = (bias_add_0[31]==0) ? ((bias_add_0<3'd6) ? {{bias_add_0[31],bias_add_0[10:4]}} :'d6) : '0;
logic [7:0] relu_1;
assign relu_1[7:0] = (bias_add_1[31]==0) ? ((bias_add_1<3'd6) ? {{bias_add_1[31],bias_add_1[10:4]}} :'d6) : '0;
logic [7:0] relu_2;
assign relu_2[7:0] = (bias_add_2[31]==0) ? ((bias_add_2<3'd6) ? {{bias_add_2[31],bias_add_2[10:4]}} :'d6) : '0;
logic [7:0] relu_3;
assign relu_3[7:0] = (bias_add_3[31]==0) ? ((bias_add_3<3'd6) ? {{bias_add_3[31],bias_add_3[10:4]}} :'d6) : '0;
logic [7:0] relu_4;
assign relu_4[7:0] = (bias_add_4[31]==0) ? ((bias_add_4<3'd6) ? {{bias_add_4[31],bias_add_4[10:4]}} :'d6) : '0;
logic [7:0] relu_5;
assign relu_5[7:0] = (bias_add_5[31]==0) ? ((bias_add_5<3'd6) ? {{bias_add_5[31],bias_add_5[10:4]}} :'d6) : '0;
logic [7:0] relu_6;
assign relu_6[7:0] = (bias_add_6[31]==0) ? ((bias_add_6<3'd6) ? {{bias_add_6[31],bias_add_6[10:4]}} :'d6) : '0;
logic [7:0] relu_7;
assign relu_7[7:0] = (bias_add_7[31]==0) ? ((bias_add_7<3'd6) ? {{bias_add_7[31],bias_add_7[10:4]}} :'d6) : '0;

assign output_act = {
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

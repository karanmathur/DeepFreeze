module conv3_pw (
    input logic clk,
    input logic rstn,
    input logic valid,
    input logic [128-1:0] input_act,
    output logic [256-1:0] output_act,
    output logic ready
);

logic [128-1:0] input_act_ff;
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

logic signed [31:0] conv_mac_0;
assign conv_mac_0 = 
	( 6'sd 26) * $signed(input_fmap_0[7:0]) +
	( 7'sd 40) * $signed(input_fmap_1[7:0]) +
	( 6'sd 26) * $signed(input_fmap_2[7:0]) +
	( 7'sd 48) * $signed(input_fmap_3[7:0]) +
	( 6'sd 19) * $signed(input_fmap_4[7:0]) +
	( 7'sd 49) * $signed(input_fmap_5[7:0]) +
	( 7'sd 48) * $signed(input_fmap_6[7:0]) +
	( 7'sd 54) * $signed(input_fmap_7[7:0]) +
	( 8'sd 74) * $signed(input_fmap_8[7:0]) +
	( 8'sd 108) * $signed(input_fmap_9[7:0]) +
	( 4'sd 6) * $signed(input_fmap_10[7:0]) +
	( 5'sd 14) * $signed(input_fmap_11[7:0]) +
	( 5'sd 15) * $signed(input_fmap_12[7:0]) +
	( 4'sd 7) * $signed(input_fmap_13[7:0]) +
	( 8'sd 79) * $signed(input_fmap_14[7:0]) +
	( 4'sd 4) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_1;
assign conv_mac_1 = 
	( 8'sd 84) * $signed(input_fmap_0[7:0]) +
	( 8'sd 103) * $signed(input_fmap_1[7:0]) +
	( 8'sd 105) * $signed(input_fmap_2[7:0]) +
	( 8'sd 110) * $signed(input_fmap_3[7:0]) +
	( 7'sd 46) * $signed(input_fmap_4[7:0]) +
	( 6'sd 29) * $signed(input_fmap_5[7:0]) +
	( 5'sd 8) * $signed(input_fmap_6[7:0]) +
	( 8'sd 107) * $signed(input_fmap_7[7:0]) +
	( 8'sd 82) * $signed(input_fmap_8[7:0]) +
	( 8'sd 86) * $signed(input_fmap_9[7:0]) +
	( 8'sd 81) * $signed(input_fmap_10[7:0]) +
	( 7'sd 49) * $signed(input_fmap_11[7:0]) +
	( 7'sd 51) * $signed(input_fmap_12[7:0]) +
	( 7'sd 35) * $signed(input_fmap_13[7:0]) +
	( 8'sd 78) * $signed(input_fmap_14[7:0]) +
	( 7'sd 37) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_2;
assign conv_mac_2 = 
	( 8'sd 76) * $signed(input_fmap_0[7:0]) +
	( 7'sd 33) * $signed(input_fmap_1[7:0]) +
	( 8'sd 86) * $signed(input_fmap_2[7:0]) +
	( 7'sd 53) * $signed(input_fmap_3[7:0]) +
	( 8'sd 74) * $signed(input_fmap_4[7:0]) +
	( 8'sd 70) * $signed(input_fmap_5[7:0]) +
	( 8'sd 78) * $signed(input_fmap_6[7:0]) +
	( 3'sd 2) * $signed(input_fmap_7[7:0]) +
	( 8'sd 126) * $signed(input_fmap_8[7:0]) +
	( 8'sd 121) * $signed(input_fmap_9[7:0]) +
	( 8'sd 116) * $signed(input_fmap_10[7:0]) +
	( 5'sd 8) * $signed(input_fmap_11[7:0]) +
	( 8'sd 113) * $signed(input_fmap_12[7:0]) +
	( 7'sd 39) * $signed(input_fmap_13[7:0]) +
	( 7'sd 35) * $signed(input_fmap_14[7:0]) +
	( 7'sd 34) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_3;
assign conv_mac_3 = 
	( 7'sd 34) * $signed(input_fmap_0[7:0]) +
	( 8'sd 126) * $signed(input_fmap_1[7:0]) +
	( 8'sd 69) * $signed(input_fmap_2[7:0]) +
	( 8'sd 73) * $signed(input_fmap_3[7:0]) +
	( 8'sd 91) * $signed(input_fmap_4[7:0]) +
	( 8'sd 114) * $signed(input_fmap_5[7:0]) +
	( 8'sd 75) * $signed(input_fmap_6[7:0]) +
	( 8'sd 85) * $signed(input_fmap_7[7:0]) +
	( 8'sd 76) * $signed(input_fmap_8[7:0]) +
	( 8'sd 111) * $signed(input_fmap_9[7:0]) +
	( 8'sd 86) * $signed(input_fmap_10[7:0]) +
	( 6'sd 19) * $signed(input_fmap_11[7:0]) +
	( 8'sd 122) * $signed(input_fmap_12[7:0]) +
	( 7'sd 58) * $signed(input_fmap_13[7:0]) +
	( 8'sd 122) * $signed(input_fmap_14[7:0]) +
	( 8'sd 87) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_4;
assign conv_mac_4 = 
	( 8'sd 99) * $signed(input_fmap_0[7:0]) +
	( 6'sd 30) * $signed(input_fmap_1[7:0]) +
	( 4'sd 6) * $signed(input_fmap_2[7:0]) +
	( 8'sd 123) * $signed(input_fmap_3[7:0]) +
	( 8'sd 97) * $signed(input_fmap_4[7:0]) +
	( 6'sd 22) * $signed(input_fmap_5[7:0]) +
	( 7'sd 34) * $signed(input_fmap_6[7:0]) +
	( 7'sd 58) * $signed(input_fmap_7[7:0]) +
	( 5'sd 13) * $signed(input_fmap_8[7:0]) +
	( 6'sd 22) * $signed(input_fmap_9[7:0]) +
	( 7'sd 58) * $signed(input_fmap_10[7:0]) +
	( 7'sd 59) * $signed(input_fmap_11[7:0]) +
	( 6'sd 19) * $signed(input_fmap_12[7:0]) +
	( 6'sd 23) * $signed(input_fmap_13[7:0]) +
	( 8'sd 106) * $signed(input_fmap_14[7:0]) +
	( 8'sd 70) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_5;
assign conv_mac_5 = 
	( 8'sd 90) * $signed(input_fmap_0[7:0]) +
	( 4'sd 4) * $signed(input_fmap_1[7:0]) +
	( 8'sd 76) * $signed(input_fmap_2[7:0]) +
	( 6'sd 20) * $signed(input_fmap_3[7:0]) +
	( 8'sd 123) * $signed(input_fmap_4[7:0]) +
	( 8'sd 78) * $signed(input_fmap_5[7:0]) +
	( 5'sd 12) * $signed(input_fmap_6[7:0]) +
	( 8'sd 87) * $signed(input_fmap_7[7:0]) +
	( 8'sd 64) * $signed(input_fmap_8[7:0]) +
	( 8'sd 104) * $signed(input_fmap_9[7:0]) +
	( 5'sd 8) * $signed(input_fmap_10[7:0]) +
	( 6'sd 27) * $signed(input_fmap_11[7:0]) +
	( 8'sd 68) * $signed(input_fmap_12[7:0]) +
	( 8'sd 116) * $signed(input_fmap_13[7:0]) +
	( 8'sd 65) * $signed(input_fmap_14[7:0]) +
	( 8'sd 68) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_6;
assign conv_mac_6 = 
	( 8'sd 108) * $signed(input_fmap_0[7:0]) +
	( 6'sd 21) * $signed(input_fmap_1[7:0]) +
	( 6'sd 20) * $signed(input_fmap_2[7:0]) +
	( 8'sd 84) * $signed(input_fmap_3[7:0]) +
	( 7'sd 57) * $signed(input_fmap_4[7:0]) +
	( 6'sd 29) * $signed(input_fmap_5[7:0]) +
	( 8'sd 67) * $signed(input_fmap_6[7:0]) +
	( 8'sd 74) * $signed(input_fmap_7[7:0]) +
	( 7'sd 49) * $signed(input_fmap_8[7:0]) +
	( 8'sd 97) * $signed(input_fmap_9[7:0]) +
	( 8'sd 102) * $signed(input_fmap_10[7:0]) +
	( 7'sd 33) * $signed(input_fmap_11[7:0]) +
	( 8'sd 100) * $signed(input_fmap_12[7:0]) +
	( 7'sd 54) * $signed(input_fmap_13[7:0]) +
	( 7'sd 52) * $signed(input_fmap_14[7:0]) +
	( 8'sd 100) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_7;
assign conv_mac_7 = 
	( 8'sd 124) * $signed(input_fmap_0[7:0]) +
	( 8'sd 100) * $signed(input_fmap_1[7:0]) +
	( 7'sd 39) * $signed(input_fmap_2[7:0]) +
	( 8'sd 125) * $signed(input_fmap_3[7:0]) +
	( 6'sd 31) * $signed(input_fmap_4[7:0]) +
	( 8'sd 67) * $signed(input_fmap_5[7:0]) +
	( 7'sd 37) * $signed(input_fmap_6[7:0]) +
	( 8'sd 64) * $signed(input_fmap_7[7:0]) +
	( 7'sd 34) * $signed(input_fmap_8[7:0]) +
	( 8'sd 64) * $signed(input_fmap_9[7:0]) +
	( 5'sd 15) * $signed(input_fmap_10[7:0]) +
	( 8'sd 81) * $signed(input_fmap_11[7:0]) +
	( 7'sd 53) * $signed(input_fmap_12[7:0]) +
	( 8'sd 102) * $signed(input_fmap_13[7:0]) +
	( 6'sd 20) * $signed(input_fmap_14[7:0]) +
	( 8'sd 102) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_8;
assign conv_mac_8 = 
	( 5'sd 11) * $signed(input_fmap_0[7:0]) +
	( 7'sd 58) * $signed(input_fmap_1[7:0]) +
	( 6'sd 16) * $signed(input_fmap_2[7:0]) +
	( 7'sd 38) * $signed(input_fmap_3[7:0]) +
	( 6'sd 23) * $signed(input_fmap_4[7:0]) +
	( 7'sd 43) * $signed(input_fmap_5[7:0]) +
	( 6'sd 26) * $signed(input_fmap_6[7:0]) +
	( 8'sd 93) * $signed(input_fmap_7[7:0]) +
	( 8'sd 75) * $signed(input_fmap_8[7:0]) +
	( 8'sd 79) * $signed(input_fmap_9[7:0]) +
	( 8'sd 68) * $signed(input_fmap_10[7:0]) +
	( 8'sd 102) * $signed(input_fmap_11[7:0]) +
	( 7'sd 54) * $signed(input_fmap_12[7:0]) +
	( 8'sd 119) * $signed(input_fmap_13[7:0]) +
	( 8'sd 87) * $signed(input_fmap_14[7:0]) +
	( 7'sd 43) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_9;
assign conv_mac_9 = 
	( 5'sd 9) * $signed(input_fmap_0[7:0]) +
	( 7'sd 61) * $signed(input_fmap_1[7:0]) +
	( 7'sd 35) * $signed(input_fmap_2[7:0]) +
	( 6'sd 30) * $signed(input_fmap_3[7:0]) +
	( 8'sd 118) * $signed(input_fmap_4[7:0]) +
	( 7'sd 35) * $signed(input_fmap_5[7:0]) +
	( 8'sd 100) * $signed(input_fmap_6[7:0]) +
	( 7'sd 41) * $signed(input_fmap_7[7:0]) +
	( 8'sd 75) * $signed(input_fmap_8[7:0]) +
	( 7'sd 57) * $signed(input_fmap_9[7:0]) +
	( 8'sd 120) * $signed(input_fmap_10[7:0]) +
	( 8'sd 126) * $signed(input_fmap_11[7:0]) +
	( 3'sd 3) * $signed(input_fmap_12[7:0]) +
	( 8'sd 83) * $signed(input_fmap_13[7:0]) +
	( 8'sd 67) * $signed(input_fmap_14[7:0]) +
	( 7'sd 36) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_10;
assign conv_mac_10 = 
	( 7'sd 36) * $signed(input_fmap_0[7:0]) +
	( 8'sd 78) * $signed(input_fmap_1[7:0]) +
	( 6'sd 26) * $signed(input_fmap_2[7:0]) +
	( 7'sd 33) * $signed(input_fmap_3[7:0]) +
	( 6'sd 31) * $signed(input_fmap_4[7:0]) +
	( 7'sd 46) * $signed(input_fmap_5[7:0]) +
	( 8'sd 122) * $signed(input_fmap_6[7:0]) +
	( 8'sd 81) * $signed(input_fmap_7[7:0]) +
	( 8'sd 114) * $signed(input_fmap_8[7:0]) +
	( 8'sd 82) * $signed(input_fmap_9[7:0]) +
	( 6'sd 30) * $signed(input_fmap_10[7:0]) +
	( 7'sd 55) * $signed(input_fmap_11[7:0]) +
	( 8'sd 120) * $signed(input_fmap_12[7:0]) +
	( 8'sd 121) * $signed(input_fmap_13[7:0]) +
	( 6'sd 28) * $signed(input_fmap_14[7:0]) +
	( 8'sd 104) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_11;
assign conv_mac_11 = 
	( 8'sd 109) * $signed(input_fmap_0[7:0]) +
	( 7'sd 62) * $signed(input_fmap_1[7:0]) +
	( 6'sd 27) * $signed(input_fmap_2[7:0]) +
	( 8'sd 73) * $signed(input_fmap_3[7:0]) +
	( 8'sd 78) * $signed(input_fmap_4[7:0]) +
	( 3'sd 3) * $signed(input_fmap_5[7:0]) +
	( 7'sd 40) * $signed(input_fmap_6[7:0]) +
	( 7'sd 37) * $signed(input_fmap_7[7:0]) +
	( 8'sd 94) * $signed(input_fmap_8[7:0]) +
	( 4'sd 6) * $signed(input_fmap_9[7:0]) +
	( 8'sd 87) * $signed(input_fmap_10[7:0]) +
	( 8'sd 120) * $signed(input_fmap_11[7:0]) +
	( 8'sd 94) * $signed(input_fmap_12[7:0]) +
	( 6'sd 30) * $signed(input_fmap_13[7:0]) +
	( 8'sd 124) * $signed(input_fmap_14[7:0]) +
	( 8'sd 106) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_12;
assign conv_mac_12 = 
	( 8'sd 112) * $signed(input_fmap_0[7:0]) +
	( 8'sd 114) * $signed(input_fmap_1[7:0]) +
	( 8'sd 110) * $signed(input_fmap_2[7:0]) +
	( 8'sd 79) * $signed(input_fmap_3[7:0]) +
	( 8'sd 67) * $signed(input_fmap_4[7:0]) +
	( 8'sd 109) * $signed(input_fmap_5[7:0]) +
	( 8'sd 108) * $signed(input_fmap_6[7:0]) +
	( 7'sd 46) * $signed(input_fmap_7[7:0]) +
	( 8'sd 81) * $signed(input_fmap_8[7:0]) +
	( 8'sd 86) * $signed(input_fmap_9[7:0]) +
	( 4'sd 6) * $signed(input_fmap_10[7:0]) +
	( 8'sd 79) * $signed(input_fmap_11[7:0]) +
	( 8'sd 70) * $signed(input_fmap_12[7:0]) +
	( 6'sd 29) * $signed(input_fmap_13[7:0]) +
	( 8'sd 68) * $signed(input_fmap_14[7:0]) +
	( 8'sd 81) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_13;
assign conv_mac_13 = 
	( 6'sd 25) * $signed(input_fmap_0[7:0]) +
	( 7'sd 39) * $signed(input_fmap_1[7:0]) +
	( 8'sd 111) * $signed(input_fmap_2[7:0]) +
	( 5'sd 13) * $signed(input_fmap_3[7:0]) +
	( 6'sd 20) * $signed(input_fmap_4[7:0]) +
	( 8'sd 109) * $signed(input_fmap_5[7:0]) +
	( 8'sd 87) * $signed(input_fmap_6[7:0]) +
	( 8'sd 124) * $signed(input_fmap_7[7:0]) +
	( 8'sd 74) * $signed(input_fmap_8[7:0]) +
	( 8'sd 86) * $signed(input_fmap_9[7:0]) +
	( 3'sd 2) * $signed(input_fmap_10[7:0]) +
	( 7'sd 36) * $signed(input_fmap_11[7:0]) +
	( 7'sd 49) * $signed(input_fmap_12[7:0]) +
	( 7'sd 51) * $signed(input_fmap_13[7:0]) +
	( 8'sd 65) * $signed(input_fmap_14[7:0]) +
	( 8'sd 119) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_14;
assign conv_mac_14 = 
	( 8'sd 68) * $signed(input_fmap_0[7:0]) +
	( 8'sd 100) * $signed(input_fmap_1[7:0]) +
	( 8'sd 99) * $signed(input_fmap_2[7:0]) +
	( 8'sd 100) * $signed(input_fmap_3[7:0]) +
	( 8'sd 125) * $signed(input_fmap_4[7:0]) +
	( 8'sd 83) * $signed(input_fmap_5[7:0]) +
	( 8'sd 98) * $signed(input_fmap_6[7:0]) +
	( 8'sd 67) * $signed(input_fmap_7[7:0]) +
	( 6'sd 22) * $signed(input_fmap_8[7:0]) +
	( 7'sd 63) * $signed(input_fmap_9[7:0]) +
	( 7'sd 57) * $signed(input_fmap_10[7:0]) +
	( 8'sd 116) * $signed(input_fmap_11[7:0]) +
	( 6'sd 17) * $signed(input_fmap_12[7:0]) +
	( 8'sd 117) * $signed(input_fmap_13[7:0]) +
	( 7'sd 36) * $signed(input_fmap_14[7:0]) +
	( 7'sd 54) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_15;
assign conv_mac_15 = 
	( 7'sd 58) * $signed(input_fmap_0[7:0]) +
	( 8'sd 101) * $signed(input_fmap_1[7:0]) +
	( 8'sd 79) * $signed(input_fmap_2[7:0]) +
	( 8'sd 72) * $signed(input_fmap_3[7:0]) +
	( 8'sd 66) * $signed(input_fmap_4[7:0]) +
	( 8'sd 125) * $signed(input_fmap_5[7:0]) +
	( 7'sd 40) * $signed(input_fmap_6[7:0]) +
	( 8'sd 68) * $signed(input_fmap_7[7:0]) +
	( 8'sd 101) * $signed(input_fmap_8[7:0]) +
	( 8'sd 111) * $signed(input_fmap_9[7:0]) +
	( 8'sd 111) * $signed(input_fmap_10[7:0]) +
	( 8'sd 120) * $signed(input_fmap_11[7:0]) +
	( 8'sd 81) * $signed(input_fmap_12[7:0]) +
	( 7'sd 61) * $signed(input_fmap_13[7:0]) +
	( 8'sd 96) * $signed(input_fmap_14[7:0]) +
	( 8'sd 89) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_16;
assign conv_mac_16 = 
	( 8'sd 110) * $signed(input_fmap_0[7:0]) +
	( 7'sd 56) * $signed(input_fmap_1[7:0]) +
	( 7'sd 54) * $signed(input_fmap_2[7:0]) +
	( 8'sd 126) * $signed(input_fmap_3[7:0]) +
	( 5'sd 11) * $signed(input_fmap_4[7:0]) +
	( 8'sd 119) * $signed(input_fmap_5[7:0]) +
	( 8'sd 94) * $signed(input_fmap_6[7:0]) +
	( 5'sd 14) * $signed(input_fmap_7[7:0]) +
	( 8'sd 107) * $signed(input_fmap_8[7:0]) +
	( 7'sd 46) * $signed(input_fmap_9[7:0]) +
	( 8'sd 117) * $signed(input_fmap_10[7:0]) +
	( 2'sd 1) * $signed(input_fmap_11[7:0]) +
	( 7'sd 54) * $signed(input_fmap_12[7:0]) +
	( 8'sd 117) * $signed(input_fmap_13[7:0]) +
	( 8'sd 100) * $signed(input_fmap_14[7:0]) +
	( 8'sd 85) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_17;
assign conv_mac_17 = 
	( 7'sd 33) * $signed(input_fmap_0[7:0]) +
	( 8'sd 64) * $signed(input_fmap_1[7:0]) +
	( 8'sd 108) * $signed(input_fmap_2[7:0]) +
	( 8'sd 69) * $signed(input_fmap_3[7:0]) +
	( 6'sd 18) * $signed(input_fmap_4[7:0]) +
	( 8'sd 79) * $signed(input_fmap_5[7:0]) +
	( 8'sd 93) * $signed(input_fmap_6[7:0]) +
	( 6'sd 16) * $signed(input_fmap_7[7:0]) +
	( 8'sd 73) * $signed(input_fmap_8[7:0]) +
	( 7'sd 61) * $signed(input_fmap_9[7:0]) +
	( 6'sd 28) * $signed(input_fmap_10[7:0]) +
	( 8'sd 101) * $signed(input_fmap_11[7:0]) +
	( 7'sd 46) * $signed(input_fmap_12[7:0]) +
	( 8'sd 90) * $signed(input_fmap_13[7:0]) +
	( 7'sd 57) * $signed(input_fmap_14[7:0]) +
	( 7'sd 58) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_18;
assign conv_mac_18 = 
	( 8'sd 84) * $signed(input_fmap_0[7:0]) +
	( 7'sd 46) * $signed(input_fmap_1[7:0]) +
	( 7'sd 44) * $signed(input_fmap_2[7:0]) +
	( 8'sd 100) * $signed(input_fmap_3[7:0]) +
	( 8'sd 98) * $signed(input_fmap_4[7:0]) +
	( 5'sd 13) * $signed(input_fmap_5[7:0]) +
	( 8'sd 118) * $signed(input_fmap_6[7:0]) +
	( 8'sd 118) * $signed(input_fmap_7[7:0]) +
	( 8'sd 103) * $signed(input_fmap_8[7:0]) +
	( 8'sd 102) * $signed(input_fmap_9[7:0]) +
	( 8'sd 67) * $signed(input_fmap_10[7:0]) +
	( 7'sd 50) * $signed(input_fmap_11[7:0]) +
	( 8'sd 65) * $signed(input_fmap_12[7:0]) +
	( 6'sd 20) * $signed(input_fmap_13[7:0]) +
	( 8'sd 102) * $signed(input_fmap_14[7:0]) +
	( 8'sd 75) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_19;
assign conv_mac_19 = 
	( 8'sd 117) * $signed(input_fmap_0[7:0]) +
	( 8'sd 109) * $signed(input_fmap_1[7:0]) +
	( 8'sd 70) * $signed(input_fmap_2[7:0]) +
	( 8'sd 73) * $signed(input_fmap_3[7:0]) +
	( 8'sd 67) * $signed(input_fmap_4[7:0]) +
	( 7'sd 48) * $signed(input_fmap_5[7:0]) +
	( 7'sd 36) * $signed(input_fmap_6[7:0]) +
	( 7'sd 54) * $signed(input_fmap_7[7:0]) +
	( 8'sd 81) * $signed(input_fmap_8[7:0]) +
	( 3'sd 2) * $signed(input_fmap_9[7:0]) +
	( 4'sd 4) * $signed(input_fmap_10[7:0]) +
	( 7'sd 37) * $signed(input_fmap_11[7:0]) +
	( 7'sd 41) * $signed(input_fmap_12[7:0]) +
	( 7'sd 46) * $signed(input_fmap_13[7:0]) +
	( 7'sd 49) * $signed(input_fmap_14[7:0]) +
	( 8'sd 123) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_20;
assign conv_mac_20 = 
	( 7'sd 53) * $signed(input_fmap_0[7:0]) +
	( 3'sd 3) * $signed(input_fmap_1[7:0]) +
	( 7'sd 59) * $signed(input_fmap_2[7:0]) +
	( 5'sd 9) * $signed(input_fmap_3[7:0]) +
	( 8'sd 124) * $signed(input_fmap_4[7:0]) +
	( 3'sd 2) * $signed(input_fmap_5[7:0]) +
	( 7'sd 34) * $signed(input_fmap_6[7:0]) +
	( 8'sd 127) * $signed(input_fmap_7[7:0]) +
	( 8'sd 96) * $signed(input_fmap_8[7:0]) +
	( 8'sd 115) * $signed(input_fmap_9[7:0]) +
	( 5'sd 15) * $signed(input_fmap_10[7:0]) +
	( 4'sd 5) * $signed(input_fmap_11[7:0]) +
	( 7'sd 46) * $signed(input_fmap_12[7:0]) +
	( 8'sd 108) * $signed(input_fmap_13[7:0]) +
	( 8'sd 84) * $signed(input_fmap_14[7:0]) +
	( 7'sd 39) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_21;
assign conv_mac_21 = 
	( 8'sd 127) * $signed(input_fmap_0[7:0]) +
	( 6'sd 18) * $signed(input_fmap_1[7:0]) +
	( 8'sd 112) * $signed(input_fmap_2[7:0]) +
	( 8'sd 83) * $signed(input_fmap_3[7:0]) +
	( 6'sd 28) * $signed(input_fmap_4[7:0]) +
	( 8'sd 126) * $signed(input_fmap_5[7:0]) +
	( 8'sd 72) * $signed(input_fmap_6[7:0]) +
	( 6'sd 22) * $signed(input_fmap_7[7:0]) +
	( 8'sd 107) * $signed(input_fmap_8[7:0]) +
	( 8'sd 96) * $signed(input_fmap_9[7:0]) +
	( 8'sd 99) * $signed(input_fmap_10[7:0]) +
	( 6'sd 28) * $signed(input_fmap_11[7:0]) +
	( 2'sd 1) * $signed(input_fmap_12[7:0]) +
	( 8'sd 124) * $signed(input_fmap_13[7:0]) +
	( 8'sd 95) * $signed(input_fmap_14[7:0]) +
	( 8'sd 78) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_22;
assign conv_mac_22 = 
	( 6'sd 18) * $signed(input_fmap_0[7:0]) +
	( 4'sd 4) * $signed(input_fmap_1[7:0]) +
	( 8'sd 73) * $signed(input_fmap_2[7:0]) +
	( 8'sd 89) * $signed(input_fmap_3[7:0]) +
	( 8'sd 79) * $signed(input_fmap_4[7:0]) +
	( 6'sd 30) * $signed(input_fmap_5[7:0]) +
	( 8'sd 97) * $signed(input_fmap_6[7:0]) +
	( 6'sd 31) * $signed(input_fmap_7[7:0]) +
	( 8'sd 87) * $signed(input_fmap_8[7:0]) +
	( 8'sd 70) * $signed(input_fmap_9[7:0]) +
	( 4'sd 4) * $signed(input_fmap_10[7:0]) +
	( 6'sd 20) * $signed(input_fmap_11[7:0]) +
	( 8'sd 88) * $signed(input_fmap_12[7:0]) +
	( 8'sd 109) * $signed(input_fmap_13[7:0]) +
	( 7'sd 44) * $signed(input_fmap_14[7:0]) +
	( 8'sd 72) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_23;
assign conv_mac_23 = 
	( 6'sd 18) * $signed(input_fmap_0[7:0]) +
	( 7'sd 35) * $signed(input_fmap_1[7:0]) +
	( 8'sd 66) * $signed(input_fmap_2[7:0]) +
	( 5'sd 14) * $signed(input_fmap_3[7:0]) +
	( 8'sd 76) * $signed(input_fmap_4[7:0]) +
	( 8'sd 111) * $signed(input_fmap_5[7:0]) +
	( 6'sd 27) * $signed(input_fmap_6[7:0]) +
	( 8'sd 123) * $signed(input_fmap_7[7:0]) +
	( 7'sd 37) * $signed(input_fmap_8[7:0]) +
	( 7'sd 44) * $signed(input_fmap_9[7:0]) +
	( 4'sd 5) * $signed(input_fmap_10[7:0]) +
	( 7'sd 38) * $signed(input_fmap_11[7:0]) +
	( 8'sd 79) * $signed(input_fmap_12[7:0]) +
	( 7'sd 56) * $signed(input_fmap_13[7:0]) +
	( 7'sd 52) * $signed(input_fmap_14[7:0]) +
	( 8'sd 126) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_24;
assign conv_mac_24 = 
	( 8'sd 79) * $signed(input_fmap_0[7:0]) +
	( 8'sd 104) * $signed(input_fmap_1[7:0]) +
	( 7'sd 43) * $signed(input_fmap_2[7:0]) +
	( 8'sd 113) * $signed(input_fmap_3[7:0]) +
	( 6'sd 20) * $signed(input_fmap_4[7:0]) +
	( 8'sd 122) * $signed(input_fmap_5[7:0]) +
	( 6'sd 23) * $signed(input_fmap_6[7:0]) +
	( 8'sd 119) * $signed(input_fmap_7[7:0]) +
	( 6'sd 24) * $signed(input_fmap_8[7:0]) +
	( 6'sd 31) * $signed(input_fmap_9[7:0]) +
	( 8'sd 93) * $signed(input_fmap_10[7:0]) +
	( 6'sd 26) * $signed(input_fmap_11[7:0]) +
	( 3'sd 3) * $signed(input_fmap_12[7:0]) +
	( 6'sd 28) * $signed(input_fmap_13[7:0]) +
	( 8'sd 119) * $signed(input_fmap_14[7:0]) +
	( 2'sd 1) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_25;
assign conv_mac_25 = 
	( 8'sd 125) * $signed(input_fmap_0[7:0]) +
	( 8'sd 112) * $signed(input_fmap_1[7:0]) +
	( 8'sd 91) * $signed(input_fmap_2[7:0]) +
	( 8'sd 78) * $signed(input_fmap_3[7:0]) +
	( 7'sd 40) * $signed(input_fmap_4[7:0]) +
	( 3'sd 3) * $signed(input_fmap_5[7:0]) +
	( 8'sd 94) * $signed(input_fmap_6[7:0]) +
	( 6'sd 16) * $signed(input_fmap_7[7:0]) +
	( 7'sd 54) * $signed(input_fmap_8[7:0]) +
	( 7'sd 39) * $signed(input_fmap_9[7:0]) +
	( 8'sd 67) * $signed(input_fmap_10[7:0]) +
	( 5'sd 11) * $signed(input_fmap_11[7:0]) +
	( 8'sd 109) * $signed(input_fmap_12[7:0]) +
	( 6'sd 26) * $signed(input_fmap_13[7:0]) +
	( 7'sd 40) * $signed(input_fmap_14[7:0]) +
	( 8'sd 80) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_26;
assign conv_mac_26 = 
	( 7'sd 48) * $signed(input_fmap_0[7:0]) +
	( 8'sd 80) * $signed(input_fmap_1[7:0]) +
	( 6'sd 23) * $signed(input_fmap_2[7:0]) +
	( 8'sd 101) * $signed(input_fmap_3[7:0]) +
	( 4'sd 7) * $signed(input_fmap_4[7:0]) +
	( 3'sd 3) * $signed(input_fmap_5[7:0]) +
	( 6'sd 24) * $signed(input_fmap_6[7:0]) +
	( 8'sd 115) * $signed(input_fmap_7[7:0]) +
	( 7'sd 48) * $signed(input_fmap_8[7:0]) +
	( 8'sd 83) * $signed(input_fmap_9[7:0]) +
	( 7'sd 59) * $signed(input_fmap_10[7:0]) +
	( 8'sd 67) * $signed(input_fmap_11[7:0]) +
	( 8'sd 78) * $signed(input_fmap_12[7:0]) +
	( 7'sd 39) * $signed(input_fmap_13[7:0]) +
	( 8'sd 103) * $signed(input_fmap_14[7:0]) +
	( 5'sd 13) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_27;
assign conv_mac_27 = 
	( 5'sd 8) * $signed(input_fmap_0[7:0]) +
	( 8'sd 66) * $signed(input_fmap_1[7:0]) +
	( 7'sd 40) * $signed(input_fmap_2[7:0]) +
	( 7'sd 44) * $signed(input_fmap_3[7:0]) +
	( 8'sd 89) * $signed(input_fmap_4[7:0]) +
	( 8'sd 70) * $signed(input_fmap_5[7:0]) +
	( 8'sd 108) * $signed(input_fmap_6[7:0]) +
	( 7'sd 41) * $signed(input_fmap_7[7:0]) +
	( 7'sd 59) * $signed(input_fmap_8[7:0]) +
	( 5'sd 11) * $signed(input_fmap_9[7:0]) +
	( 8'sd 113) * $signed(input_fmap_10[7:0]) +
	( 7'sd 54) * $signed(input_fmap_11[7:0]) +
	( 7'sd 38) * $signed(input_fmap_12[7:0]) +
	( 7'sd 37) * $signed(input_fmap_13[7:0]) +
	( 7'sd 53) * $signed(input_fmap_14[7:0]) +
	( 7'sd 37) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_28;
assign conv_mac_28 = 
	( 6'sd 27) * $signed(input_fmap_0[7:0]) +
	( 4'sd 6) * $signed(input_fmap_1[7:0]) +
	( 8'sd 110) * $signed(input_fmap_2[7:0]) +
	( 8'sd 110) * $signed(input_fmap_3[7:0]) +
	( 6'sd 27) * $signed(input_fmap_4[7:0]) +
	( 7'sd 57) * $signed(input_fmap_5[7:0]) +
	( 6'sd 16) * $signed(input_fmap_6[7:0]) +
	( 7'sd 55) * $signed(input_fmap_7[7:0]) +
	( 8'sd 103) * $signed(input_fmap_8[7:0]) +
	( 7'sd 50) * $signed(input_fmap_9[7:0]) +
	( 8'sd 119) * $signed(input_fmap_10[7:0]) +
	( 7'sd 51) * $signed(input_fmap_11[7:0]) +
	( 6'sd 26) * $signed(input_fmap_12[7:0]) +
	( 7'sd 63) * $signed(input_fmap_13[7:0]) +
	( 8'sd 90) * $signed(input_fmap_14[7:0]) +
	( 8'sd 81) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_29;
assign conv_mac_29 = 
	( 8'sd 97) * $signed(input_fmap_0[7:0]) +
	( 8'sd 77) * $signed(input_fmap_1[7:0]) +
	( 7'sd 48) * $signed(input_fmap_2[7:0]) +
	( 5'sd 12) * $signed(input_fmap_3[7:0]) +
	( 7'sd 33) * $signed(input_fmap_4[7:0]) +
	( 6'sd 28) * $signed(input_fmap_5[7:0]) +
	( 4'sd 6) * $signed(input_fmap_6[7:0]) +
	( 8'sd 65) * $signed(input_fmap_7[7:0]) +
	( 8'sd 78) * $signed(input_fmap_8[7:0]) +
	( 8'sd 89) * $signed(input_fmap_9[7:0]) +
	( 7'sd 56) * $signed(input_fmap_10[7:0]) +
	( 6'sd 28) * $signed(input_fmap_11[7:0]) +
	( 8'sd 102) * $signed(input_fmap_12[7:0]) +
	( 3'sd 2) * $signed(input_fmap_13[7:0]) +
	( 8'sd 92) * $signed(input_fmap_14[7:0]) +
	( 8'sd 121) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_30;
assign conv_mac_30 = 
	( 8'sd 95) * $signed(input_fmap_0[7:0]) +
	( 8'sd 96) * $signed(input_fmap_1[7:0]) +
	( 8'sd 125) * $signed(input_fmap_2[7:0]) +
	( 8'sd 124) * $signed(input_fmap_3[7:0]) +
	( 4'sd 7) * $signed(input_fmap_4[7:0]) +
	( 8'sd 105) * $signed(input_fmap_5[7:0]) +
	( 8'sd 105) * $signed(input_fmap_6[7:0]) +
	( 8'sd 89) * $signed(input_fmap_7[7:0]) +
	( 5'sd 14) * $signed(input_fmap_8[7:0]) +
	( 5'sd 13) * $signed(input_fmap_9[7:0]) +
	( 8'sd 97) * $signed(input_fmap_10[7:0]) +
	( 8'sd 67) * $signed(input_fmap_11[7:0]) +
	( 8'sd 69) * $signed(input_fmap_12[7:0]) +
	( 4'sd 5) * $signed(input_fmap_13[7:0]) +
	( 5'sd 8) * $signed(input_fmap_14[7:0]) +
	( 5'sd 12) * $signed(input_fmap_15[7:0]);

logic signed [31:0] conv_mac_31;
assign conv_mac_31 = 
	( 7'sd 35) * $signed(input_fmap_0[7:0]) +
	( 5'sd 8) * $signed(input_fmap_1[7:0]) +
	( 8'sd 77) * $signed(input_fmap_2[7:0]) +
	( 8'sd 120) * $signed(input_fmap_3[7:0]) +
	( 8'sd 119) * $signed(input_fmap_4[7:0]) +
	( 8'sd 89) * $signed(input_fmap_5[7:0]) +
	( 7'sd 50) * $signed(input_fmap_6[7:0]) +
	( 8'sd 90) * $signed(input_fmap_7[7:0]) +
	( 6'sd 29) * $signed(input_fmap_8[7:0]) +
	( 8'sd 111) * $signed(input_fmap_9[7:0]) +
	( 8'sd 124) * $signed(input_fmap_10[7:0]) +
	( 7'sd 43) * $signed(input_fmap_11[7:0]) +
	( 8'sd 77) * $signed(input_fmap_12[7:0]) +
	( 7'sd 52) * $signed(input_fmap_13[7:0]) +
	( 8'sd 112) * $signed(input_fmap_14[7:0]) +
	( 4'sd 6) * $signed(input_fmap_15[7:0]);

logic [31:0] bias_add_0;
assign bias_add_0 = conv_mac_0 + 7'd49;
logic [31:0] bias_add_1;
assign bias_add_1 = conv_mac_1 + 8'd86;
logic [31:0] bias_add_2;
assign bias_add_2 = conv_mac_2 + 3'd2;
logic [31:0] bias_add_3;
assign bias_add_3 = conv_mac_3 + 8'd124;
logic [31:0] bias_add_4;
assign bias_add_4 = conv_mac_4 + 7'd63;
logic [31:0] bias_add_5;
assign bias_add_5 = conv_mac_5 + 7'd40;
logic [31:0] bias_add_6;
assign bias_add_6 = conv_mac_6 + 8'd69;
logic [31:0] bias_add_7;
assign bias_add_7 = conv_mac_7 + 6'd19;
logic [31:0] bias_add_8;
assign bias_add_8 = conv_mac_8 + 5'd8;
logic [31:0] bias_add_9;
assign bias_add_9 = conv_mac_9 + 4'd5;
logic [31:0] bias_add_10;
assign bias_add_10 = conv_mac_10 + 7'd54;
logic [31:0] bias_add_11;
assign bias_add_11 = conv_mac_11 + 7'd44;
logic [31:0] bias_add_12;
assign bias_add_12 = conv_mac_12 + 6'd21;
logic [31:0] bias_add_13;
assign bias_add_13 = conv_mac_13 + 8'd102;
logic [31:0] bias_add_14;
assign bias_add_14 = conv_mac_14 + 8'd117;
logic [31:0] bias_add_15;
assign bias_add_15 = conv_mac_15 + 2'd1;
logic [31:0] bias_add_16;
assign bias_add_16 = conv_mac_16 + 8'd113;
logic [31:0] bias_add_17;
assign bias_add_17 = conv_mac_17 + 8'd107;
logic [31:0] bias_add_18;
assign bias_add_18 = conv_mac_18 + 8'd112;
logic [31:0] bias_add_19;
assign bias_add_19 = conv_mac_19 + 6'd25;
logic [31:0] bias_add_20;
assign bias_add_20 = conv_mac_20 + 7'd48;
logic [31:0] bias_add_21;
assign bias_add_21 = conv_mac_21 + 7'd33;
logic [31:0] bias_add_22;
assign bias_add_22 = conv_mac_22 + 7'd45;
logic [31:0] bias_add_23;
assign bias_add_23 = conv_mac_23 + 8'd79;
logic [31:0] bias_add_24;
assign bias_add_24 = conv_mac_24 + 6'd19;
logic [31:0] bias_add_25;
assign bias_add_25 = conv_mac_25 + 6'd25;
logic [31:0] bias_add_26;
assign bias_add_26 = conv_mac_26 + 4'd5;
logic [31:0] bias_add_27;
assign bias_add_27 = conv_mac_27 + 8'd101;
logic [31:0] bias_add_28;
assign bias_add_28 = conv_mac_28 + 8'd101;
logic [31:0] bias_add_29;
assign bias_add_29 = conv_mac_29 + 8'd96;
logic [31:0] bias_add_30;
assign bias_add_30 = conv_mac_30 + 7'd37;
logic [31:0] bias_add_31;
assign bias_add_31 = conv_mac_31 + 8'd98;

logic [7:0] relu_0;
assign relu_0[7:0] = (bias_add_0[31]==0) ? ((bias_add_0<3'd6) ? {{bias_add_0[31],bias_add_0[13:7]}} :'d6) : '0;
logic [7:0] relu_1;
assign relu_1[7:0] = (bias_add_1[31]==0) ? ((bias_add_1<3'd6) ? {{bias_add_1[31],bias_add_1[13:7]}} :'d6) : '0;
logic [7:0] relu_2;
assign relu_2[7:0] = (bias_add_2[31]==0) ? ((bias_add_2<3'd6) ? {{bias_add_2[31],bias_add_2[13:7]}} :'d6) : '0;
logic [7:0] relu_3;
assign relu_3[7:0] = (bias_add_3[31]==0) ? ((bias_add_3<3'd6) ? {{bias_add_3[31],bias_add_3[13:7]}} :'d6) : '0;
logic [7:0] relu_4;
assign relu_4[7:0] = (bias_add_4[31]==0) ? ((bias_add_4<3'd6) ? {{bias_add_4[31],bias_add_4[13:7]}} :'d6) : '0;
logic [7:0] relu_5;
assign relu_5[7:0] = (bias_add_5[31]==0) ? ((bias_add_5<3'd6) ? {{bias_add_5[31],bias_add_5[13:7]}} :'d6) : '0;
logic [7:0] relu_6;
assign relu_6[7:0] = (bias_add_6[31]==0) ? ((bias_add_6<3'd6) ? {{bias_add_6[31],bias_add_6[13:7]}} :'d6) : '0;
logic [7:0] relu_7;
assign relu_7[7:0] = (bias_add_7[31]==0) ? ((bias_add_7<3'd6) ? {{bias_add_7[31],bias_add_7[13:7]}} :'d6) : '0;
logic [7:0] relu_8;
assign relu_8[7:0] = (bias_add_8[31]==0) ? ((bias_add_8<3'd6) ? {{bias_add_8[31],bias_add_8[13:7]}} :'d6) : '0;
logic [7:0] relu_9;
assign relu_9[7:0] = (bias_add_9[31]==0) ? ((bias_add_9<3'd6) ? {{bias_add_9[31],bias_add_9[13:7]}} :'d6) : '0;
logic [7:0] relu_10;
assign relu_10[7:0] = (bias_add_10[31]==0) ? ((bias_add_10<3'd6) ? {{bias_add_10[31],bias_add_10[13:7]}} :'d6) : '0;
logic [7:0] relu_11;
assign relu_11[7:0] = (bias_add_11[31]==0) ? ((bias_add_11<3'd6) ? {{bias_add_11[31],bias_add_11[13:7]}} :'d6) : '0;
logic [7:0] relu_12;
assign relu_12[7:0] = (bias_add_12[31]==0) ? ((bias_add_12<3'd6) ? {{bias_add_12[31],bias_add_12[13:7]}} :'d6) : '0;
logic [7:0] relu_13;
assign relu_13[7:0] = (bias_add_13[31]==0) ? ((bias_add_13<3'd6) ? {{bias_add_13[31],bias_add_13[13:7]}} :'d6) : '0;
logic [7:0] relu_14;
assign relu_14[7:0] = (bias_add_14[31]==0) ? ((bias_add_14<3'd6) ? {{bias_add_14[31],bias_add_14[13:7]}} :'d6) : '0;
logic [7:0] relu_15;
assign relu_15[7:0] = (bias_add_15[31]==0) ? ((bias_add_15<3'd6) ? {{bias_add_15[31],bias_add_15[13:7]}} :'d6) : '0;
logic [7:0] relu_16;
assign relu_16[7:0] = (bias_add_16[31]==0) ? ((bias_add_16<3'd6) ? {{bias_add_16[31],bias_add_16[13:7]}} :'d6) : '0;
logic [7:0] relu_17;
assign relu_17[7:0] = (bias_add_17[31]==0) ? ((bias_add_17<3'd6) ? {{bias_add_17[31],bias_add_17[13:7]}} :'d6) : '0;
logic [7:0] relu_18;
assign relu_18[7:0] = (bias_add_18[31]==0) ? ((bias_add_18<3'd6) ? {{bias_add_18[31],bias_add_18[13:7]}} :'d6) : '0;
logic [7:0] relu_19;
assign relu_19[7:0] = (bias_add_19[31]==0) ? ((bias_add_19<3'd6) ? {{bias_add_19[31],bias_add_19[13:7]}} :'d6) : '0;
logic [7:0] relu_20;
assign relu_20[7:0] = (bias_add_20[31]==0) ? ((bias_add_20<3'd6) ? {{bias_add_20[31],bias_add_20[13:7]}} :'d6) : '0;
logic [7:0] relu_21;
assign relu_21[7:0] = (bias_add_21[31]==0) ? ((bias_add_21<3'd6) ? {{bias_add_21[31],bias_add_21[13:7]}} :'d6) : '0;
logic [7:0] relu_22;
assign relu_22[7:0] = (bias_add_22[31]==0) ? ((bias_add_22<3'd6) ? {{bias_add_22[31],bias_add_22[13:7]}} :'d6) : '0;
logic [7:0] relu_23;
assign relu_23[7:0] = (bias_add_23[31]==0) ? ((bias_add_23<3'd6) ? {{bias_add_23[31],bias_add_23[13:7]}} :'d6) : '0;
logic [7:0] relu_24;
assign relu_24[7:0] = (bias_add_24[31]==0) ? ((bias_add_24<3'd6) ? {{bias_add_24[31],bias_add_24[13:7]}} :'d6) : '0;
logic [7:0] relu_25;
assign relu_25[7:0] = (bias_add_25[31]==0) ? ((bias_add_25<3'd6) ? {{bias_add_25[31],bias_add_25[13:7]}} :'d6) : '0;
logic [7:0] relu_26;
assign relu_26[7:0] = (bias_add_26[31]==0) ? ((bias_add_26<3'd6) ? {{bias_add_26[31],bias_add_26[13:7]}} :'d6) : '0;
logic [7:0] relu_27;
assign relu_27[7:0] = (bias_add_27[31]==0) ? ((bias_add_27<3'd6) ? {{bias_add_27[31],bias_add_27[13:7]}} :'d6) : '0;
logic [7:0] relu_28;
assign relu_28[7:0] = (bias_add_28[31]==0) ? ((bias_add_28<3'd6) ? {{bias_add_28[31],bias_add_28[13:7]}} :'d6) : '0;
logic [7:0] relu_29;
assign relu_29[7:0] = (bias_add_29[31]==0) ? ((bias_add_29<3'd6) ? {{bias_add_29[31],bias_add_29[13:7]}} :'d6) : '0;
logic [7:0] relu_30;
assign relu_30[7:0] = (bias_add_30[31]==0) ? ((bias_add_30<3'd6) ? {{bias_add_30[31],bias_add_30[13:7]}} :'d6) : '0;
logic [7:0] relu_31;
assign relu_31[7:0] = (bias_add_31[31]==0) ? ((bias_add_31<3'd6) ? {{bias_add_31[31],bias_add_31[13:7]}} :'d6) : '0;

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

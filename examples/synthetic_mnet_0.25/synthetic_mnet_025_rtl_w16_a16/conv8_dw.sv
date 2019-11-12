module conv8_dw (
    input logic clk,
    input logic rstn,
    input logic valid,
    input logic [18432-1:0] input_act,
    output logic [2048-1:0] output_act,
    output logic ready
);

logic [18432-1:0] input_act_ff;
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

logic [143:0] input_fmap_0;
assign input_fmap_0 = input_act_ff[143:0];
logic [143:0] input_fmap_1;
assign input_fmap_1 = input_act_ff[287:144];
logic [143:0] input_fmap_2;
assign input_fmap_2 = input_act_ff[431:288];
logic [143:0] input_fmap_3;
assign input_fmap_3 = input_act_ff[575:432];
logic [143:0] input_fmap_4;
assign input_fmap_4 = input_act_ff[719:576];
logic [143:0] input_fmap_5;
assign input_fmap_5 = input_act_ff[863:720];
logic [143:0] input_fmap_6;
assign input_fmap_6 = input_act_ff[1007:864];
logic [143:0] input_fmap_7;
assign input_fmap_7 = input_act_ff[1151:1008];
logic [143:0] input_fmap_8;
assign input_fmap_8 = input_act_ff[1295:1152];
logic [143:0] input_fmap_9;
assign input_fmap_9 = input_act_ff[1439:1296];
logic [143:0] input_fmap_10;
assign input_fmap_10 = input_act_ff[1583:1440];
logic [143:0] input_fmap_11;
assign input_fmap_11 = input_act_ff[1727:1584];
logic [143:0] input_fmap_12;
assign input_fmap_12 = input_act_ff[1871:1728];
logic [143:0] input_fmap_13;
assign input_fmap_13 = input_act_ff[2015:1872];
logic [143:0] input_fmap_14;
assign input_fmap_14 = input_act_ff[2159:2016];
logic [143:0] input_fmap_15;
assign input_fmap_15 = input_act_ff[2303:2160];
logic [143:0] input_fmap_16;
assign input_fmap_16 = input_act_ff[2447:2304];
logic [143:0] input_fmap_17;
assign input_fmap_17 = input_act_ff[2591:2448];
logic [143:0] input_fmap_18;
assign input_fmap_18 = input_act_ff[2735:2592];
logic [143:0] input_fmap_19;
assign input_fmap_19 = input_act_ff[2879:2736];
logic [143:0] input_fmap_20;
assign input_fmap_20 = input_act_ff[3023:2880];
logic [143:0] input_fmap_21;
assign input_fmap_21 = input_act_ff[3167:3024];
logic [143:0] input_fmap_22;
assign input_fmap_22 = input_act_ff[3311:3168];
logic [143:0] input_fmap_23;
assign input_fmap_23 = input_act_ff[3455:3312];
logic [143:0] input_fmap_24;
assign input_fmap_24 = input_act_ff[3599:3456];
logic [143:0] input_fmap_25;
assign input_fmap_25 = input_act_ff[3743:3600];
logic [143:0] input_fmap_26;
assign input_fmap_26 = input_act_ff[3887:3744];
logic [143:0] input_fmap_27;
assign input_fmap_27 = input_act_ff[4031:3888];
logic [143:0] input_fmap_28;
assign input_fmap_28 = input_act_ff[4175:4032];
logic [143:0] input_fmap_29;
assign input_fmap_29 = input_act_ff[4319:4176];
logic [143:0] input_fmap_30;
assign input_fmap_30 = input_act_ff[4463:4320];
logic [143:0] input_fmap_31;
assign input_fmap_31 = input_act_ff[4607:4464];
logic [143:0] input_fmap_32;
assign input_fmap_32 = input_act_ff[4751:4608];
logic [143:0] input_fmap_33;
assign input_fmap_33 = input_act_ff[4895:4752];
logic [143:0] input_fmap_34;
assign input_fmap_34 = input_act_ff[5039:4896];
logic [143:0] input_fmap_35;
assign input_fmap_35 = input_act_ff[5183:5040];
logic [143:0] input_fmap_36;
assign input_fmap_36 = input_act_ff[5327:5184];
logic [143:0] input_fmap_37;
assign input_fmap_37 = input_act_ff[5471:5328];
logic [143:0] input_fmap_38;
assign input_fmap_38 = input_act_ff[5615:5472];
logic [143:0] input_fmap_39;
assign input_fmap_39 = input_act_ff[5759:5616];
logic [143:0] input_fmap_40;
assign input_fmap_40 = input_act_ff[5903:5760];
logic [143:0] input_fmap_41;
assign input_fmap_41 = input_act_ff[6047:5904];
logic [143:0] input_fmap_42;
assign input_fmap_42 = input_act_ff[6191:6048];
logic [143:0] input_fmap_43;
assign input_fmap_43 = input_act_ff[6335:6192];
logic [143:0] input_fmap_44;
assign input_fmap_44 = input_act_ff[6479:6336];
logic [143:0] input_fmap_45;
assign input_fmap_45 = input_act_ff[6623:6480];
logic [143:0] input_fmap_46;
assign input_fmap_46 = input_act_ff[6767:6624];
logic [143:0] input_fmap_47;
assign input_fmap_47 = input_act_ff[6911:6768];
logic [143:0] input_fmap_48;
assign input_fmap_48 = input_act_ff[7055:6912];
logic [143:0] input_fmap_49;
assign input_fmap_49 = input_act_ff[7199:7056];
logic [143:0] input_fmap_50;
assign input_fmap_50 = input_act_ff[7343:7200];
logic [143:0] input_fmap_51;
assign input_fmap_51 = input_act_ff[7487:7344];
logic [143:0] input_fmap_52;
assign input_fmap_52 = input_act_ff[7631:7488];
logic [143:0] input_fmap_53;
assign input_fmap_53 = input_act_ff[7775:7632];
logic [143:0] input_fmap_54;
assign input_fmap_54 = input_act_ff[7919:7776];
logic [143:0] input_fmap_55;
assign input_fmap_55 = input_act_ff[8063:7920];
logic [143:0] input_fmap_56;
assign input_fmap_56 = input_act_ff[8207:8064];
logic [143:0] input_fmap_57;
assign input_fmap_57 = input_act_ff[8351:8208];
logic [143:0] input_fmap_58;
assign input_fmap_58 = input_act_ff[8495:8352];
logic [143:0] input_fmap_59;
assign input_fmap_59 = input_act_ff[8639:8496];
logic [143:0] input_fmap_60;
assign input_fmap_60 = input_act_ff[8783:8640];
logic [143:0] input_fmap_61;
assign input_fmap_61 = input_act_ff[8927:8784];
logic [143:0] input_fmap_62;
assign input_fmap_62 = input_act_ff[9071:8928];
logic [143:0] input_fmap_63;
assign input_fmap_63 = input_act_ff[9215:9072];
logic [143:0] input_fmap_64;
assign input_fmap_64 = input_act_ff[9359:9216];
logic [143:0] input_fmap_65;
assign input_fmap_65 = input_act_ff[9503:9360];
logic [143:0] input_fmap_66;
assign input_fmap_66 = input_act_ff[9647:9504];
logic [143:0] input_fmap_67;
assign input_fmap_67 = input_act_ff[9791:9648];
logic [143:0] input_fmap_68;
assign input_fmap_68 = input_act_ff[9935:9792];
logic [143:0] input_fmap_69;
assign input_fmap_69 = input_act_ff[10079:9936];
logic [143:0] input_fmap_70;
assign input_fmap_70 = input_act_ff[10223:10080];
logic [143:0] input_fmap_71;
assign input_fmap_71 = input_act_ff[10367:10224];
logic [143:0] input_fmap_72;
assign input_fmap_72 = input_act_ff[10511:10368];
logic [143:0] input_fmap_73;
assign input_fmap_73 = input_act_ff[10655:10512];
logic [143:0] input_fmap_74;
assign input_fmap_74 = input_act_ff[10799:10656];
logic [143:0] input_fmap_75;
assign input_fmap_75 = input_act_ff[10943:10800];
logic [143:0] input_fmap_76;
assign input_fmap_76 = input_act_ff[11087:10944];
logic [143:0] input_fmap_77;
assign input_fmap_77 = input_act_ff[11231:11088];
logic [143:0] input_fmap_78;
assign input_fmap_78 = input_act_ff[11375:11232];
logic [143:0] input_fmap_79;
assign input_fmap_79 = input_act_ff[11519:11376];
logic [143:0] input_fmap_80;
assign input_fmap_80 = input_act_ff[11663:11520];
logic [143:0] input_fmap_81;
assign input_fmap_81 = input_act_ff[11807:11664];
logic [143:0] input_fmap_82;
assign input_fmap_82 = input_act_ff[11951:11808];
logic [143:0] input_fmap_83;
assign input_fmap_83 = input_act_ff[12095:11952];
logic [143:0] input_fmap_84;
assign input_fmap_84 = input_act_ff[12239:12096];
logic [143:0] input_fmap_85;
assign input_fmap_85 = input_act_ff[12383:12240];
logic [143:0] input_fmap_86;
assign input_fmap_86 = input_act_ff[12527:12384];
logic [143:0] input_fmap_87;
assign input_fmap_87 = input_act_ff[12671:12528];
logic [143:0] input_fmap_88;
assign input_fmap_88 = input_act_ff[12815:12672];
logic [143:0] input_fmap_89;
assign input_fmap_89 = input_act_ff[12959:12816];
logic [143:0] input_fmap_90;
assign input_fmap_90 = input_act_ff[13103:12960];
logic [143:0] input_fmap_91;
assign input_fmap_91 = input_act_ff[13247:13104];
logic [143:0] input_fmap_92;
assign input_fmap_92 = input_act_ff[13391:13248];
logic [143:0] input_fmap_93;
assign input_fmap_93 = input_act_ff[13535:13392];
logic [143:0] input_fmap_94;
assign input_fmap_94 = input_act_ff[13679:13536];
logic [143:0] input_fmap_95;
assign input_fmap_95 = input_act_ff[13823:13680];
logic [143:0] input_fmap_96;
assign input_fmap_96 = input_act_ff[13967:13824];
logic [143:0] input_fmap_97;
assign input_fmap_97 = input_act_ff[14111:13968];
logic [143:0] input_fmap_98;
assign input_fmap_98 = input_act_ff[14255:14112];
logic [143:0] input_fmap_99;
assign input_fmap_99 = input_act_ff[14399:14256];
logic [143:0] input_fmap_100;
assign input_fmap_100 = input_act_ff[14543:14400];
logic [143:0] input_fmap_101;
assign input_fmap_101 = input_act_ff[14687:14544];
logic [143:0] input_fmap_102;
assign input_fmap_102 = input_act_ff[14831:14688];
logic [143:0] input_fmap_103;
assign input_fmap_103 = input_act_ff[14975:14832];
logic [143:0] input_fmap_104;
assign input_fmap_104 = input_act_ff[15119:14976];
logic [143:0] input_fmap_105;
assign input_fmap_105 = input_act_ff[15263:15120];
logic [143:0] input_fmap_106;
assign input_fmap_106 = input_act_ff[15407:15264];
logic [143:0] input_fmap_107;
assign input_fmap_107 = input_act_ff[15551:15408];
logic [143:0] input_fmap_108;
assign input_fmap_108 = input_act_ff[15695:15552];
logic [143:0] input_fmap_109;
assign input_fmap_109 = input_act_ff[15839:15696];
logic [143:0] input_fmap_110;
assign input_fmap_110 = input_act_ff[15983:15840];
logic [143:0] input_fmap_111;
assign input_fmap_111 = input_act_ff[16127:15984];
logic [143:0] input_fmap_112;
assign input_fmap_112 = input_act_ff[16271:16128];
logic [143:0] input_fmap_113;
assign input_fmap_113 = input_act_ff[16415:16272];
logic [143:0] input_fmap_114;
assign input_fmap_114 = input_act_ff[16559:16416];
logic [143:0] input_fmap_115;
assign input_fmap_115 = input_act_ff[16703:16560];
logic [143:0] input_fmap_116;
assign input_fmap_116 = input_act_ff[16847:16704];
logic [143:0] input_fmap_117;
assign input_fmap_117 = input_act_ff[16991:16848];
logic [143:0] input_fmap_118;
assign input_fmap_118 = input_act_ff[17135:16992];
logic [143:0] input_fmap_119;
assign input_fmap_119 = input_act_ff[17279:17136];
logic [143:0] input_fmap_120;
assign input_fmap_120 = input_act_ff[17423:17280];
logic [143:0] input_fmap_121;
assign input_fmap_121 = input_act_ff[17567:17424];
logic [143:0] input_fmap_122;
assign input_fmap_122 = input_act_ff[17711:17568];
logic [143:0] input_fmap_123;
assign input_fmap_123 = input_act_ff[17855:17712];
logic [143:0] input_fmap_124;
assign input_fmap_124 = input_act_ff[17999:17856];
logic [143:0] input_fmap_125;
assign input_fmap_125 = input_act_ff[18143:18000];
logic [143:0] input_fmap_126;
assign input_fmap_126 = input_act_ff[18287:18144];
logic [143:0] input_fmap_127;
assign input_fmap_127 = input_act_ff[18431:18288];

logic signed [31:0] dw_conv_mac_0;
assign dw_conv_mac_0 = 
	 16'sd 18491 * $signed(input_fmap_0[15:0]) +
	 14'sd 4835 * $signed(input_fmap_0[31:16]) +
	 15'sd 8835 * $signed(input_fmap_0[47:32]) +
	 13'sd 4014 * $signed(input_fmap_0[63:48]) +
	 16'sd 25209 * $signed(input_fmap_0[79:64]) +
	 16'sd 24228 * $signed(input_fmap_0[95:80]) +
	 15'sd 16062 * $signed(input_fmap_0[111:96]) +
	 14'sd 6966 * $signed(input_fmap_0[127:112]) +
	 16'sd 28868 * $signed(input_fmap_0[143:128]);

logic signed [31:0] dw_conv_mac_1;
assign dw_conv_mac_1 = 
	 16'sd 19591 * $signed(input_fmap_1[15:0]) +
	 16'sd 18658 * $signed(input_fmap_1[31:16]) +
	 16'sd 29172 * $signed(input_fmap_1[47:32]) +
	 16'sd 25960 * $signed(input_fmap_1[63:48]) +
	 16'sd 31208 * $signed(input_fmap_1[79:64]) +
	 15'sd 11337 * $signed(input_fmap_1[95:80]) +
	 16'sd 19762 * $signed(input_fmap_1[111:96]) +
	 15'sd 15170 * $signed(input_fmap_1[127:112]) +
	 13'sd 2978 * $signed(input_fmap_1[143:128]);

logic signed [31:0] dw_conv_mac_2;
assign dw_conv_mac_2 = 
	 16'sd 28896 * $signed(input_fmap_2[15:0]) +
	 15'sd 13666 * $signed(input_fmap_2[31:16]) +
	 16'sd 21232 * $signed(input_fmap_2[47:32]) +
	 14'sd 6053 * $signed(input_fmap_2[63:48]) +
	 15'sd 11721 * $signed(input_fmap_2[79:64]) +
	 15'sd 14275 * $signed(input_fmap_2[95:80]) +
	 16'sd 17673 * $signed(input_fmap_2[111:96]) +
	 16'sd 26646 * $signed(input_fmap_2[127:112]) +
	 16'sd 24994 * $signed(input_fmap_2[143:128]);

logic signed [31:0] dw_conv_mac_3;
assign dw_conv_mac_3 = 
	 15'sd 10822 * $signed(input_fmap_3[15:0]) +
	 16'sd 23547 * $signed(input_fmap_3[31:16]) +
	 15'sd 13449 * $signed(input_fmap_3[47:32]) +
	 16'sd 27544 * $signed(input_fmap_3[63:48]) +
	 16'sd 21523 * $signed(input_fmap_3[79:64]) +
	 16'sd 22495 * $signed(input_fmap_3[95:80]) +
	 15'sd 9387 * $signed(input_fmap_3[111:96]) +
	 15'sd 12550 * $signed(input_fmap_3[127:112]) +
	 16'sd 31727 * $signed(input_fmap_3[143:128]);

logic signed [31:0] dw_conv_mac_4;
assign dw_conv_mac_4 = 
	 16'sd 22635 * $signed(input_fmap_4[15:0]) +
	 13'sd 3599 * $signed(input_fmap_4[31:16]) +
	 16'sd 16582 * $signed(input_fmap_4[47:32]) +
	 12'sd 1333 * $signed(input_fmap_4[63:48]) +
	 15'sd 13178 * $signed(input_fmap_4[79:64]) +
	 16'sd 23821 * $signed(input_fmap_4[95:80]) +
	 15'sd 13055 * $signed(input_fmap_4[111:96]) +
	 15'sd 13541 * $signed(input_fmap_4[127:112]) +
	 16'sd 32637 * $signed(input_fmap_4[143:128]);

logic signed [31:0] dw_conv_mac_5;
assign dw_conv_mac_5 = 
	 15'sd 8263 * $signed(input_fmap_5[15:0]) +
	 14'sd 7917 * $signed(input_fmap_5[31:16]) +
	 16'sd 32544 * $signed(input_fmap_5[47:32]) +
	 16'sd 27074 * $signed(input_fmap_5[63:48]) +
	 14'sd 6379 * $signed(input_fmap_5[79:64]) +
	 15'sd 8726 * $signed(input_fmap_5[95:80]) +
	 16'sd 20048 * $signed(input_fmap_5[111:96]) +
	 15'sd 14398 * $signed(input_fmap_5[127:112]) +
	 16'sd 19738 * $signed(input_fmap_5[143:128]);

logic signed [31:0] dw_conv_mac_6;
assign dw_conv_mac_6 = 
	 16'sd 26568 * $signed(input_fmap_6[15:0]) +
	 14'sd 8014 * $signed(input_fmap_6[31:16]) +
	 14'sd 4518 * $signed(input_fmap_6[47:32]) +
	 15'sd 11261 * $signed(input_fmap_6[63:48]) +
	 14'sd 4412 * $signed(input_fmap_6[79:64]) +
	 16'sd 29152 * $signed(input_fmap_6[95:80]) +
	 15'sd 9095 * $signed(input_fmap_6[111:96]) +
	 16'sd 30906 * $signed(input_fmap_6[127:112]) +
	 16'sd 20720 * $signed(input_fmap_6[143:128]);

logic signed [31:0] dw_conv_mac_7;
assign dw_conv_mac_7 = 
	 16'sd 24417 * $signed(input_fmap_7[15:0]) +
	 14'sd 4516 * $signed(input_fmap_7[31:16]) +
	 14'sd 4396 * $signed(input_fmap_7[47:32]) +
	 14'sd 8089 * $signed(input_fmap_7[63:48]) +
	 16'sd 16583 * $signed(input_fmap_7[79:64]) +
	 16'sd 29105 * $signed(input_fmap_7[95:80]) +
	 16'sd 19996 * $signed(input_fmap_7[111:96]) +
	 16'sd 17854 * $signed(input_fmap_7[127:112]) +
	 16'sd 28324 * $signed(input_fmap_7[143:128]);

logic signed [31:0] dw_conv_mac_8;
assign dw_conv_mac_8 = 
	 14'sd 6792 * $signed(input_fmap_8[15:0]) +
	 14'sd 6186 * $signed(input_fmap_8[31:16]) +
	 12'sd 1200 * $signed(input_fmap_8[47:32]) +
	 14'sd 8133 * $signed(input_fmap_8[63:48]) +
	 16'sd 23179 * $signed(input_fmap_8[79:64]) +
	 16'sd 21665 * $signed(input_fmap_8[95:80]) +
	 16'sd 22262 * $signed(input_fmap_8[111:96]) +
	 16'sd 27562 * $signed(input_fmap_8[127:112]) +
	 14'sd 8154 * $signed(input_fmap_8[143:128]);

logic signed [31:0] dw_conv_mac_9;
assign dw_conv_mac_9 = 
	 16'sd 28110 * $signed(input_fmap_9[15:0]) +
	 16'sd 32307 * $signed(input_fmap_9[31:16]) +
	 13'sd 2719 * $signed(input_fmap_9[47:32]) +
	 15'sd 11418 * $signed(input_fmap_9[63:48]) +
	 16'sd 30931 * $signed(input_fmap_9[79:64]) +
	 16'sd 17427 * $signed(input_fmap_9[95:80]) +
	 16'sd 30143 * $signed(input_fmap_9[111:96]) +
	 16'sd 21724 * $signed(input_fmap_9[127:112]) +
	 16'sd 26545 * $signed(input_fmap_9[143:128]);

logic signed [31:0] dw_conv_mac_10;
assign dw_conv_mac_10 = 
	 16'sd 21066 * $signed(input_fmap_10[15:0]) +
	 15'sd 8486 * $signed(input_fmap_10[31:16]) +
	 16'sd 17260 * $signed(input_fmap_10[47:32]) +
	 16'sd 27288 * $signed(input_fmap_10[63:48]) +
	 13'sd 3064 * $signed(input_fmap_10[79:64]) +
	 16'sd 20448 * $signed(input_fmap_10[95:80]) +
	 15'sd 9843 * $signed(input_fmap_10[111:96]) +
	 13'sd 3098 * $signed(input_fmap_10[127:112]) +
	 16'sd 32481 * $signed(input_fmap_10[143:128]);

logic signed [31:0] dw_conv_mac_11;
assign dw_conv_mac_11 = 
	 15'sd 14210 * $signed(input_fmap_11[15:0]) +
	 16'sd 28263 * $signed(input_fmap_11[31:16]) +
	 16'sd 26871 * $signed(input_fmap_11[47:32]) +
	 16'sd 21727 * $signed(input_fmap_11[63:48]) +
	 16'sd 29790 * $signed(input_fmap_11[79:64]) +
	 16'sd 19439 * $signed(input_fmap_11[95:80]) +
	 11'sd 790 * $signed(input_fmap_11[111:96]) +
	 16'sd 28050 * $signed(input_fmap_11[127:112]) +
	 15'sd 15815 * $signed(input_fmap_11[143:128]);

logic signed [31:0] dw_conv_mac_12;
assign dw_conv_mac_12 = 
	 16'sd 22286 * $signed(input_fmap_12[15:0]) +
	 15'sd 15642 * $signed(input_fmap_12[31:16]) +
	 16'sd 27403 * $signed(input_fmap_12[47:32]) +
	 16'sd 21638 * $signed(input_fmap_12[63:48]) +
	 16'sd 32590 * $signed(input_fmap_12[79:64]) +
	 16'sd 24483 * $signed(input_fmap_12[95:80]) +
	 15'sd 11668 * $signed(input_fmap_12[111:96]) +
	 14'sd 5267 * $signed(input_fmap_12[127:112]) +
	 15'sd 9161 * $signed(input_fmap_12[143:128]);

logic signed [31:0] dw_conv_mac_13;
assign dw_conv_mac_13 = 
	 15'sd 15178 * $signed(input_fmap_13[15:0]) +
	 16'sd 27293 * $signed(input_fmap_13[31:16]) +
	 16'sd 22865 * $signed(input_fmap_13[47:32]) +
	 15'sd 9106 * $signed(input_fmap_13[63:48]) +
	 16'sd 17868 * $signed(input_fmap_13[79:64]) +
	 16'sd 22629 * $signed(input_fmap_13[95:80]) +
	 16'sd 19419 * $signed(input_fmap_13[111:96]) +
	 13'sd 2251 * $signed(input_fmap_13[127:112]) +
	 16'sd 20228 * $signed(input_fmap_13[143:128]);

logic signed [31:0] dw_conv_mac_14;
assign dw_conv_mac_14 = 
	 15'sd 9109 * $signed(input_fmap_14[15:0]) +
	 16'sd 30247 * $signed(input_fmap_14[31:16]) +
	 16'sd 25401 * $signed(input_fmap_14[47:32]) +
	 16'sd 20726 * $signed(input_fmap_14[63:48]) +
	 16'sd 18671 * $signed(input_fmap_14[79:64]) +
	 16'sd 31871 * $signed(input_fmap_14[95:80]) +
	 16'sd 26547 * $signed(input_fmap_14[111:96]) +
	 16'sd 23023 * $signed(input_fmap_14[127:112]) +
	 16'sd 26176 * $signed(input_fmap_14[143:128]);

logic signed [31:0] dw_conv_mac_15;
assign dw_conv_mac_15 = 
	 14'sd 5421 * $signed(input_fmap_15[15:0]) +
	 15'sd 15538 * $signed(input_fmap_15[31:16]) +
	 16'sd 21016 * $signed(input_fmap_15[47:32]) +
	 12'sd 1633 * $signed(input_fmap_15[63:48]) +
	 15'sd 9415 * $signed(input_fmap_15[79:64]) +
	 14'sd 6473 * $signed(input_fmap_15[95:80]) +
	 16'sd 24544 * $signed(input_fmap_15[111:96]) +
	 15'sd 9073 * $signed(input_fmap_15[127:112]) +
	 11'sd 664 * $signed(input_fmap_15[143:128]);

logic signed [31:0] dw_conv_mac_16;
assign dw_conv_mac_16 = 
	 11'sd 809 * $signed(input_fmap_16[15:0]) +
	 16'sd 28470 * $signed(input_fmap_16[31:16]) +
	 16'sd 32602 * $signed(input_fmap_16[47:32]) +
	 16'sd 25996 * $signed(input_fmap_16[63:48]) +
	 16'sd 25531 * $signed(input_fmap_16[79:64]) +
	 14'sd 7339 * $signed(input_fmap_16[95:80]) +
	 16'sd 21320 * $signed(input_fmap_16[111:96]) +
	 15'sd 8805 * $signed(input_fmap_16[127:112]) +
	 15'sd 13764 * $signed(input_fmap_16[143:128]);

logic signed [31:0] dw_conv_mac_17;
assign dw_conv_mac_17 = 
	 16'sd 27884 * $signed(input_fmap_17[15:0]) +
	 16'sd 20508 * $signed(input_fmap_17[31:16]) +
	 15'sd 9469 * $signed(input_fmap_17[47:32]) +
	 14'sd 4231 * $signed(input_fmap_17[63:48]) +
	 16'sd 21327 * $signed(input_fmap_17[79:64]) +
	 16'sd 24605 * $signed(input_fmap_17[95:80]) +
	 16'sd 28377 * $signed(input_fmap_17[111:96]) +
	 16'sd 26062 * $signed(input_fmap_17[127:112]) +
	 13'sd 3380 * $signed(input_fmap_17[143:128]);

logic signed [31:0] dw_conv_mac_18;
assign dw_conv_mac_18 = 
	 16'sd 24660 * $signed(input_fmap_18[15:0]) +
	 16'sd 16453 * $signed(input_fmap_18[31:16]) +
	 15'sd 9155 * $signed(input_fmap_18[47:32]) +
	 16'sd 28388 * $signed(input_fmap_18[63:48]) +
	 16'sd 29263 * $signed(input_fmap_18[79:64]) +
	 13'sd 3616 * $signed(input_fmap_18[95:80]) +
	 15'sd 13766 * $signed(input_fmap_18[111:96]) +
	 13'sd 3097 * $signed(input_fmap_18[127:112]) +
	 13'sd 2128 * $signed(input_fmap_18[143:128]);

logic signed [31:0] dw_conv_mac_19;
assign dw_conv_mac_19 = 
	 16'sd 25472 * $signed(input_fmap_19[15:0]) +
	 16'sd 29513 * $signed(input_fmap_19[31:16]) +
	 16'sd 20732 * $signed(input_fmap_19[47:32]) +
	 13'sd 2162 * $signed(input_fmap_19[63:48]) +
	 16'sd 24031 * $signed(input_fmap_19[79:64]) +
	 14'sd 5824 * $signed(input_fmap_19[95:80]) +
	 16'sd 25396 * $signed(input_fmap_19[111:96]) +
	 16'sd 30214 * $signed(input_fmap_19[127:112]) +
	 16'sd 17960 * $signed(input_fmap_19[143:128]);

logic signed [31:0] dw_conv_mac_20;
assign dw_conv_mac_20 = 
	 13'sd 3731 * $signed(input_fmap_20[15:0]) +
	 16'sd 30833 * $signed(input_fmap_20[31:16]) +
	 14'sd 4760 * $signed(input_fmap_20[47:32]) +
	 14'sd 7004 * $signed(input_fmap_20[63:48]) +
	 15'sd 11346 * $signed(input_fmap_20[79:64]) +
	 16'sd 20507 * $signed(input_fmap_20[95:80]) +
	 15'sd 12306 * $signed(input_fmap_20[111:96]) +
	 16'sd 18921 * $signed(input_fmap_20[127:112]) +
	 16'sd 19841 * $signed(input_fmap_20[143:128]);

logic signed [31:0] dw_conv_mac_21;
assign dw_conv_mac_21 = 
	 16'sd 18240 * $signed(input_fmap_21[15:0]) +
	 16'sd 31433 * $signed(input_fmap_21[31:16]) +
	 15'sd 9260 * $signed(input_fmap_21[47:32]) +
	 16'sd 18637 * $signed(input_fmap_21[63:48]) +
	 16'sd 22914 * $signed(input_fmap_21[79:64]) +
	 16'sd 21463 * $signed(input_fmap_21[95:80]) +
	 16'sd 19103 * $signed(input_fmap_21[111:96]) +
	 16'sd 20071 * $signed(input_fmap_21[127:112]) +
	 16'sd 24822 * $signed(input_fmap_21[143:128]);

logic signed [31:0] dw_conv_mac_22;
assign dw_conv_mac_22 = 
	 16'sd 18488 * $signed(input_fmap_22[15:0]) +
	 15'sd 11811 * $signed(input_fmap_22[31:16]) +
	 16'sd 27555 * $signed(input_fmap_22[47:32]) +
	 12'sd 1256 * $signed(input_fmap_22[63:48]) +
	 16'sd 28336 * $signed(input_fmap_22[79:64]) +
	 16'sd 20919 * $signed(input_fmap_22[95:80]) +
	 12'sd 1951 * $signed(input_fmap_22[111:96]) +
	 15'sd 16028 * $signed(input_fmap_22[127:112]) +
	 14'sd 5104 * $signed(input_fmap_22[143:128]);

logic signed [31:0] dw_conv_mac_23;
assign dw_conv_mac_23 = 
	 12'sd 1522 * $signed(input_fmap_23[15:0]) +
	 8'sd 95 * $signed(input_fmap_23[31:16]) +
	 14'sd 5704 * $signed(input_fmap_23[47:32]) +
	 14'sd 4208 * $signed(input_fmap_23[63:48]) +
	 15'sd 15338 * $signed(input_fmap_23[79:64]) +
	 15'sd 14502 * $signed(input_fmap_23[95:80]) +
	 13'sd 3168 * $signed(input_fmap_23[111:96]) +
	 15'sd 14287 * $signed(input_fmap_23[127:112]) +
	 15'sd 10598 * $signed(input_fmap_23[143:128]);

logic signed [31:0] dw_conv_mac_24;
assign dw_conv_mac_24 = 
	 14'sd 5616 * $signed(input_fmap_24[15:0]) +
	 16'sd 20358 * $signed(input_fmap_24[31:16]) +
	 16'sd 29858 * $signed(input_fmap_24[47:32]) +
	 16'sd 28968 * $signed(input_fmap_24[63:48]) +
	 15'sd 16143 * $signed(input_fmap_24[79:64]) +
	 16'sd 21711 * $signed(input_fmap_24[95:80]) +
	 14'sd 7323 * $signed(input_fmap_24[111:96]) +
	 16'sd 25364 * $signed(input_fmap_24[127:112]) +
	 15'sd 15131 * $signed(input_fmap_24[143:128]);

logic signed [31:0] dw_conv_mac_25;
assign dw_conv_mac_25 = 
	 16'sd 19217 * $signed(input_fmap_25[15:0]) +
	 14'sd 5414 * $signed(input_fmap_25[31:16]) +
	 15'sd 9476 * $signed(input_fmap_25[47:32]) +
	 14'sd 5425 * $signed(input_fmap_25[63:48]) +
	 15'sd 12272 * $signed(input_fmap_25[79:64]) +
	 15'sd 14152 * $signed(input_fmap_25[95:80]) +
	 16'sd 18639 * $signed(input_fmap_25[111:96]) +
	 16'sd 20135 * $signed(input_fmap_25[127:112]) +
	 16'sd 17979 * $signed(input_fmap_25[143:128]);

logic signed [31:0] dw_conv_mac_26;
assign dw_conv_mac_26 = 
	 15'sd 10780 * $signed(input_fmap_26[15:0]) +
	 14'sd 4297 * $signed(input_fmap_26[31:16]) +
	 16'sd 19420 * $signed(input_fmap_26[47:32]) +
	 15'sd 10661 * $signed(input_fmap_26[63:48]) +
	 16'sd 31195 * $signed(input_fmap_26[79:64]) +
	 15'sd 12170 * $signed(input_fmap_26[95:80]) +
	 16'sd 25836 * $signed(input_fmap_26[111:96]) +
	 16'sd 22450 * $signed(input_fmap_26[127:112]) +
	 15'sd 10118 * $signed(input_fmap_26[143:128]);

logic signed [31:0] dw_conv_mac_27;
assign dw_conv_mac_27 = 
	 14'sd 7073 * $signed(input_fmap_27[15:0]) +
	 12'sd 1397 * $signed(input_fmap_27[31:16]) +
	 16'sd 16515 * $signed(input_fmap_27[47:32]) +
	 13'sd 2917 * $signed(input_fmap_27[63:48]) +
	 15'sd 11830 * $signed(input_fmap_27[79:64]) +
	 16'sd 32571 * $signed(input_fmap_27[95:80]) +
	 16'sd 22005 * $signed(input_fmap_27[111:96]) +
	 15'sd 8658 * $signed(input_fmap_27[127:112]) +
	 15'sd 9353 * $signed(input_fmap_27[143:128]);

logic signed [31:0] dw_conv_mac_28;
assign dw_conv_mac_28 = 
	 13'sd 2512 * $signed(input_fmap_28[15:0]) +
	 12'sd 1750 * $signed(input_fmap_28[31:16]) +
	 15'sd 14968 * $signed(input_fmap_28[47:32]) +
	 16'sd 16934 * $signed(input_fmap_28[63:48]) +
	 15'sd 16251 * $signed(input_fmap_28[79:64]) +
	 16'sd 27817 * $signed(input_fmap_28[95:80]) +
	 16'sd 18587 * $signed(input_fmap_28[111:96]) +
	 13'sd 3484 * $signed(input_fmap_28[127:112]) +
	 12'sd 1931 * $signed(input_fmap_28[143:128]);

logic signed [31:0] dw_conv_mac_29;
assign dw_conv_mac_29 = 
	 16'sd 25420 * $signed(input_fmap_29[15:0]) +
	 15'sd 12541 * $signed(input_fmap_29[31:16]) +
	 12'sd 1441 * $signed(input_fmap_29[47:32]) +
	 16'sd 20702 * $signed(input_fmap_29[63:48]) +
	 13'sd 3475 * $signed(input_fmap_29[79:64]) +
	 16'sd 16884 * $signed(input_fmap_29[95:80]) +
	 14'sd 4330 * $signed(input_fmap_29[111:96]) +
	 14'sd 7635 * $signed(input_fmap_29[127:112]) +
	 16'sd 21288 * $signed(input_fmap_29[143:128]);

logic signed [31:0] dw_conv_mac_30;
assign dw_conv_mac_30 = 
	 16'sd 31433 * $signed(input_fmap_30[15:0]) +
	 15'sd 14113 * $signed(input_fmap_30[31:16]) +
	 16'sd 31408 * $signed(input_fmap_30[47:32]) +
	 15'sd 10644 * $signed(input_fmap_30[63:48]) +
	 14'sd 7601 * $signed(input_fmap_30[79:64]) +
	 15'sd 10307 * $signed(input_fmap_30[95:80]) +
	 16'sd 26141 * $signed(input_fmap_30[111:96]) +
	 15'sd 11825 * $signed(input_fmap_30[127:112]) +
	 10'sd 446 * $signed(input_fmap_30[143:128]);

logic signed [31:0] dw_conv_mac_31;
assign dw_conv_mac_31 = 
	 16'sd 23446 * $signed(input_fmap_31[15:0]) +
	 14'sd 6718 * $signed(input_fmap_31[31:16]) +
	 15'sd 10602 * $signed(input_fmap_31[47:32]) +
	 16'sd 27226 * $signed(input_fmap_31[63:48]) +
	 15'sd 9135 * $signed(input_fmap_31[79:64]) +
	 15'sd 13639 * $signed(input_fmap_31[95:80]) +
	 16'sd 32063 * $signed(input_fmap_31[111:96]) +
	 16'sd 18477 * $signed(input_fmap_31[127:112]) +
	 16'sd 18736 * $signed(input_fmap_31[143:128]);

logic signed [31:0] dw_conv_mac_32;
assign dw_conv_mac_32 = 
	 16'sd 26512 * $signed(input_fmap_32[15:0]) +
	 16'sd 16591 * $signed(input_fmap_32[31:16]) +
	 16'sd 31956 * $signed(input_fmap_32[47:32]) +
	 16'sd 22489 * $signed(input_fmap_32[63:48]) +
	 14'sd 8165 * $signed(input_fmap_32[79:64]) +
	 16'sd 30097 * $signed(input_fmap_32[95:80]) +
	 16'sd 19174 * $signed(input_fmap_32[111:96]) +
	 16'sd 19550 * $signed(input_fmap_32[127:112]) +
	 10'sd 425 * $signed(input_fmap_32[143:128]);

logic signed [31:0] dw_conv_mac_33;
assign dw_conv_mac_33 = 
	 16'sd 26323 * $signed(input_fmap_33[15:0]) +
	 14'sd 5969 * $signed(input_fmap_33[31:16]) +
	 15'sd 10740 * $signed(input_fmap_33[47:32]) +
	 13'sd 3640 * $signed(input_fmap_33[63:48]) +
	 16'sd 29965 * $signed(input_fmap_33[79:64]) +
	 14'sd 7301 * $signed(input_fmap_33[95:80]) +
	 15'sd 8500 * $signed(input_fmap_33[111:96]) +
	 15'sd 12184 * $signed(input_fmap_33[127:112]) +
	 16'sd 18096 * $signed(input_fmap_33[143:128]);

logic signed [31:0] dw_conv_mac_34;
assign dw_conv_mac_34 = 
	 16'sd 27142 * $signed(input_fmap_34[15:0]) +
	 15'sd 15769 * $signed(input_fmap_34[31:16]) +
	 16'sd 19120 * $signed(input_fmap_34[47:32]) +
	 15'sd 9360 * $signed(input_fmap_34[63:48]) +
	 14'sd 6247 * $signed(input_fmap_34[79:64]) +
	 16'sd 30709 * $signed(input_fmap_34[95:80]) +
	 14'sd 6817 * $signed(input_fmap_34[111:96]) +
	 16'sd 21356 * $signed(input_fmap_34[127:112]) +
	 16'sd 22919 * $signed(input_fmap_34[143:128]);

logic signed [31:0] dw_conv_mac_35;
assign dw_conv_mac_35 = 
	 16'sd 24933 * $signed(input_fmap_35[15:0]) +
	 16'sd 18403 * $signed(input_fmap_35[31:16]) +
	 14'sd 5189 * $signed(input_fmap_35[47:32]) +
	 15'sd 11044 * $signed(input_fmap_35[63:48]) +
	 15'sd 14418 * $signed(input_fmap_35[79:64]) +
	 16'sd 16754 * $signed(input_fmap_35[95:80]) +
	 16'sd 25247 * $signed(input_fmap_35[111:96]) +
	 15'sd 11051 * $signed(input_fmap_35[127:112]) +
	 15'sd 16088 * $signed(input_fmap_35[143:128]);

logic signed [31:0] dw_conv_mac_36;
assign dw_conv_mac_36 = 
	 16'sd 24928 * $signed(input_fmap_36[15:0]) +
	 16'sd 29306 * $signed(input_fmap_36[31:16]) +
	 16'sd 26686 * $signed(input_fmap_36[47:32]) +
	 15'sd 14289 * $signed(input_fmap_36[63:48]) +
	 16'sd 17207 * $signed(input_fmap_36[79:64]) +
	 14'sd 7703 * $signed(input_fmap_36[95:80]) +
	 16'sd 18237 * $signed(input_fmap_36[111:96]) +
	 16'sd 22094 * $signed(input_fmap_36[127:112]) +
	 13'sd 3219 * $signed(input_fmap_36[143:128]);

logic signed [31:0] dw_conv_mac_37;
assign dw_conv_mac_37 = 
	 16'sd 30028 * $signed(input_fmap_37[15:0]) +
	 16'sd 17121 * $signed(input_fmap_37[31:16]) +
	 15'sd 13211 * $signed(input_fmap_37[47:32]) +
	 15'sd 10857 * $signed(input_fmap_37[63:48]) +
	 16'sd 31062 * $signed(input_fmap_37[79:64]) +
	 15'sd 12800 * $signed(input_fmap_37[95:80]) +
	 15'sd 9463 * $signed(input_fmap_37[111:96]) +
	 16'sd 23283 * $signed(input_fmap_37[127:112]) +
	 15'sd 15176 * $signed(input_fmap_37[143:128]);

logic signed [31:0] dw_conv_mac_38;
assign dw_conv_mac_38 = 
	 13'sd 2127 * $signed(input_fmap_38[15:0]) +
	 14'sd 4491 * $signed(input_fmap_38[31:16]) +
	 16'sd 29926 * $signed(input_fmap_38[47:32]) +
	 16'sd 20387 * $signed(input_fmap_38[63:48]) +
	 16'sd 29939 * $signed(input_fmap_38[79:64]) +
	 15'sd 8885 * $signed(input_fmap_38[95:80]) +
	 15'sd 13144 * $signed(input_fmap_38[111:96]) +
	 14'sd 6955 * $signed(input_fmap_38[127:112]) +
	 12'sd 1716 * $signed(input_fmap_38[143:128]);

logic signed [31:0] dw_conv_mac_39;
assign dw_conv_mac_39 = 
	 15'sd 12275 * $signed(input_fmap_39[15:0]) +
	 16'sd 27364 * $signed(input_fmap_39[31:16]) +
	 16'sd 25765 * $signed(input_fmap_39[47:32]) +
	 14'sd 7940 * $signed(input_fmap_39[63:48]) +
	 15'sd 13815 * $signed(input_fmap_39[79:64]) +
	 16'sd 26460 * $signed(input_fmap_39[95:80]) +
	 16'sd 21262 * $signed(input_fmap_39[111:96]) +
	 15'sd 11615 * $signed(input_fmap_39[127:112]) +
	 16'sd 21342 * $signed(input_fmap_39[143:128]);

logic signed [31:0] dw_conv_mac_40;
assign dw_conv_mac_40 = 
	 16'sd 22139 * $signed(input_fmap_40[15:0]) +
	 16'sd 22141 * $signed(input_fmap_40[31:16]) +
	 16'sd 25762 * $signed(input_fmap_40[47:32]) +
	 16'sd 16633 * $signed(input_fmap_40[63:48]) +
	 16'sd 20996 * $signed(input_fmap_40[79:64]) +
	 15'sd 11898 * $signed(input_fmap_40[95:80]) +
	 15'sd 13225 * $signed(input_fmap_40[111:96]) +
	 16'sd 28100 * $signed(input_fmap_40[127:112]) +
	 15'sd 10391 * $signed(input_fmap_40[143:128]);

logic signed [31:0] dw_conv_mac_41;
assign dw_conv_mac_41 = 
	 16'sd 30276 * $signed(input_fmap_41[15:0]) +
	 11'sd 778 * $signed(input_fmap_41[31:16]) +
	 13'sd 2146 * $signed(input_fmap_41[47:32]) +
	 16'sd 28279 * $signed(input_fmap_41[63:48]) +
	 15'sd 15549 * $signed(input_fmap_41[79:64]) +
	 12'sd 1413 * $signed(input_fmap_41[95:80]) +
	 16'sd 19999 * $signed(input_fmap_41[111:96]) +
	 12'sd 2030 * $signed(input_fmap_41[127:112]) +
	 16'sd 18576 * $signed(input_fmap_41[143:128]);

logic signed [31:0] dw_conv_mac_42;
assign dw_conv_mac_42 = 
	 16'sd 16723 * $signed(input_fmap_42[15:0]) +
	 12'sd 2047 * $signed(input_fmap_42[31:16]) +
	 16'sd 23268 * $signed(input_fmap_42[47:32]) +
	 14'sd 6680 * $signed(input_fmap_42[63:48]) +
	 16'sd 28913 * $signed(input_fmap_42[79:64]) +
	 16'sd 22998 * $signed(input_fmap_42[95:80]) +
	 13'sd 3398 * $signed(input_fmap_42[111:96]) +
	 16'sd 30351 * $signed(input_fmap_42[127:112]) +
	 14'sd 4600 * $signed(input_fmap_42[143:128]);

logic signed [31:0] dw_conv_mac_43;
assign dw_conv_mac_43 = 
	 16'sd 28280 * $signed(input_fmap_43[15:0]) +
	 16'sd 24595 * $signed(input_fmap_43[31:16]) +
	 16'sd 19648 * $signed(input_fmap_43[47:32]) +
	 15'sd 8700 * $signed(input_fmap_43[63:48]) +
	 15'sd 8625 * $signed(input_fmap_43[79:64]) +
	 15'sd 15745 * $signed(input_fmap_43[95:80]) +
	 16'sd 16788 * $signed(input_fmap_43[111:96]) +
	 15'sd 9496 * $signed(input_fmap_43[127:112]) +
	 16'sd 30396 * $signed(input_fmap_43[143:128]);

logic signed [31:0] dw_conv_mac_44;
assign dw_conv_mac_44 = 
	 16'sd 16916 * $signed(input_fmap_44[15:0]) +
	 16'sd 17044 * $signed(input_fmap_44[31:16]) +
	 16'sd 28010 * $signed(input_fmap_44[47:32]) +
	 16'sd 32166 * $signed(input_fmap_44[63:48]) +
	 16'sd 16907 * $signed(input_fmap_44[79:64]) +
	 6'sd 27 * $signed(input_fmap_44[95:80]) +
	 15'sd 12765 * $signed(input_fmap_44[111:96]) +
	 15'sd 15943 * $signed(input_fmap_44[127:112]) +
	 16'sd 18465 * $signed(input_fmap_44[143:128]);

logic signed [31:0] dw_conv_mac_45;
assign dw_conv_mac_45 = 
	 16'sd 20590 * $signed(input_fmap_45[15:0]) +
	 16'sd 27402 * $signed(input_fmap_45[31:16]) +
	 16'sd 31968 * $signed(input_fmap_45[47:32]) +
	 16'sd 17330 * $signed(input_fmap_45[63:48]) +
	 16'sd 29996 * $signed(input_fmap_45[79:64]) +
	 14'sd 6194 * $signed(input_fmap_45[95:80]) +
	 15'sd 13862 * $signed(input_fmap_45[111:96]) +
	 15'sd 13155 * $signed(input_fmap_45[127:112]) +
	 16'sd 31651 * $signed(input_fmap_45[143:128]);

logic signed [31:0] dw_conv_mac_46;
assign dw_conv_mac_46 = 
	 16'sd 17361 * $signed(input_fmap_46[15:0]) +
	 16'sd 25489 * $signed(input_fmap_46[31:16]) +
	 16'sd 21529 * $signed(input_fmap_46[47:32]) +
	 15'sd 9969 * $signed(input_fmap_46[63:48]) +
	 16'sd 17306 * $signed(input_fmap_46[79:64]) +
	 16'sd 31637 * $signed(input_fmap_46[95:80]) +
	 11'sd 908 * $signed(input_fmap_46[111:96]) +
	 15'sd 14370 * $signed(input_fmap_46[127:112]) +
	 11'sd 754 * $signed(input_fmap_46[143:128]);

logic signed [31:0] dw_conv_mac_47;
assign dw_conv_mac_47 = 
	 15'sd 11975 * $signed(input_fmap_47[15:0]) +
	 16'sd 22358 * $signed(input_fmap_47[31:16]) +
	 16'sd 32306 * $signed(input_fmap_47[47:32]) +
	 15'sd 13644 * $signed(input_fmap_47[63:48]) +
	 15'sd 8320 * $signed(input_fmap_47[79:64]) +
	 16'sd 18510 * $signed(input_fmap_47[95:80]) +
	 16'sd 27206 * $signed(input_fmap_47[111:96]) +
	 16'sd 19781 * $signed(input_fmap_47[127:112]) +
	 13'sd 3557 * $signed(input_fmap_47[143:128]);

logic signed [31:0] dw_conv_mac_48;
assign dw_conv_mac_48 = 
	 15'sd 12840 * $signed(input_fmap_48[15:0]) +
	 16'sd 30763 * $signed(input_fmap_48[31:16]) +
	 16'sd 27025 * $signed(input_fmap_48[47:32]) +
	 14'sd 6919 * $signed(input_fmap_48[63:48]) +
	 16'sd 23550 * $signed(input_fmap_48[79:64]) +
	 16'sd 16846 * $signed(input_fmap_48[95:80]) +
	 16'sd 16743 * $signed(input_fmap_48[111:96]) +
	 14'sd 5055 * $signed(input_fmap_48[127:112]) +
	 16'sd 21208 * $signed(input_fmap_48[143:128]);

logic signed [31:0] dw_conv_mac_49;
assign dw_conv_mac_49 = 
	 16'sd 18310 * $signed(input_fmap_49[15:0]) +
	 14'sd 6763 * $signed(input_fmap_49[31:16]) +
	 16'sd 31813 * $signed(input_fmap_49[47:32]) +
	 16'sd 28931 * $signed(input_fmap_49[63:48]) +
	 15'sd 9993 * $signed(input_fmap_49[79:64]) +
	 14'sd 5662 * $signed(input_fmap_49[95:80]) +
	 15'sd 10544 * $signed(input_fmap_49[111:96]) +
	 14'sd 4890 * $signed(input_fmap_49[127:112]) +
	 16'sd 17133 * $signed(input_fmap_49[143:128]);

logic signed [31:0] dw_conv_mac_50;
assign dw_conv_mac_50 = 
	 12'sd 2005 * $signed(input_fmap_50[15:0]) +
	 15'sd 9854 * $signed(input_fmap_50[31:16]) +
	 12'sd 1760 * $signed(input_fmap_50[47:32]) +
	 15'sd 12567 * $signed(input_fmap_50[63:48]) +
	 13'sd 4029 * $signed(input_fmap_50[79:64]) +
	 16'sd 28992 * $signed(input_fmap_50[95:80]) +
	 14'sd 5244 * $signed(input_fmap_50[111:96]) +
	 16'sd 25607 * $signed(input_fmap_50[127:112]) +
	 12'sd 1758 * $signed(input_fmap_50[143:128]);

logic signed [31:0] dw_conv_mac_51;
assign dw_conv_mac_51 = 
	 11'sd 999 * $signed(input_fmap_51[15:0]) +
	 16'sd 19599 * $signed(input_fmap_51[31:16]) +
	 16'sd 22229 * $signed(input_fmap_51[47:32]) +
	 15'sd 11805 * $signed(input_fmap_51[63:48]) +
	 16'sd 27284 * $signed(input_fmap_51[79:64]) +
	 14'sd 4996 * $signed(input_fmap_51[95:80]) +
	 14'sd 5782 * $signed(input_fmap_51[111:96]) +
	 16'sd 17399 * $signed(input_fmap_51[127:112]) +
	 14'sd 6136 * $signed(input_fmap_51[143:128]);

logic signed [31:0] dw_conv_mac_52;
assign dw_conv_mac_52 = 
	 15'sd 9083 * $signed(input_fmap_52[15:0]) +
	 16'sd 31128 * $signed(input_fmap_52[31:16]) +
	 16'sd 20197 * $signed(input_fmap_52[47:32]) +
	 14'sd 6430 * $signed(input_fmap_52[63:48]) +
	 16'sd 21124 * $signed(input_fmap_52[79:64]) +
	 16'sd 20075 * $signed(input_fmap_52[95:80]) +
	 12'sd 1853 * $signed(input_fmap_52[111:96]) +
	 16'sd 22532 * $signed(input_fmap_52[127:112]) +
	 13'sd 4070 * $signed(input_fmap_52[143:128]);

logic signed [31:0] dw_conv_mac_53;
assign dw_conv_mac_53 = 
	 15'sd 8856 * $signed(input_fmap_53[15:0]) +
	 16'sd 24242 * $signed(input_fmap_53[31:16]) +
	 16'sd 30840 * $signed(input_fmap_53[47:32]) +
	 16'sd 24196 * $signed(input_fmap_53[63:48]) +
	 16'sd 29473 * $signed(input_fmap_53[79:64]) +
	 14'sd 6514 * $signed(input_fmap_53[95:80]) +
	 13'sd 3506 * $signed(input_fmap_53[111:96]) +
	 16'sd 32456 * $signed(input_fmap_53[127:112]) +
	 16'sd 29248 * $signed(input_fmap_53[143:128]);

logic signed [31:0] dw_conv_mac_54;
assign dw_conv_mac_54 = 
	 15'sd 8241 * $signed(input_fmap_54[15:0]) +
	 12'sd 1769 * $signed(input_fmap_54[31:16]) +
	 16'sd 22611 * $signed(input_fmap_54[47:32]) +
	 16'sd 25371 * $signed(input_fmap_54[63:48]) +
	 16'sd 26260 * $signed(input_fmap_54[79:64]) +
	 16'sd 27030 * $signed(input_fmap_54[95:80]) +
	 16'sd 30167 * $signed(input_fmap_54[111:96]) +
	 16'sd 20133 * $signed(input_fmap_54[127:112]) +
	 16'sd 28583 * $signed(input_fmap_54[143:128]);

logic signed [31:0] dw_conv_mac_55;
assign dw_conv_mac_55 = 
	 16'sd 19333 * $signed(input_fmap_55[15:0]) +
	 16'sd 28514 * $signed(input_fmap_55[31:16]) +
	 16'sd 27765 * $signed(input_fmap_55[47:32]) +
	 16'sd 22496 * $signed(input_fmap_55[63:48]) +
	 16'sd 24400 * $signed(input_fmap_55[79:64]) +
	 14'sd 4205 * $signed(input_fmap_55[95:80]) +
	 16'sd 30119 * $signed(input_fmap_55[111:96]) +
	 16'sd 31920 * $signed(input_fmap_55[127:112]) +
	 15'sd 12940 * $signed(input_fmap_55[143:128]);

logic signed [31:0] dw_conv_mac_56;
assign dw_conv_mac_56 = 
	 15'sd 10044 * $signed(input_fmap_56[15:0]) +
	 15'sd 14685 * $signed(input_fmap_56[31:16]) +
	 13'sd 2946 * $signed(input_fmap_56[47:32]) +
	 16'sd 30742 * $signed(input_fmap_56[63:48]) +
	 13'sd 3394 * $signed(input_fmap_56[79:64]) +
	 15'sd 15271 * $signed(input_fmap_56[95:80]) +
	 14'sd 4125 * $signed(input_fmap_56[111:96]) +
	 16'sd 26700 * $signed(input_fmap_56[127:112]) +
	 16'sd 25841 * $signed(input_fmap_56[143:128]);

logic signed [31:0] dw_conv_mac_57;
assign dw_conv_mac_57 = 
	 16'sd 27915 * $signed(input_fmap_57[15:0]) +
	 16'sd 21498 * $signed(input_fmap_57[31:16]) +
	 16'sd 24601 * $signed(input_fmap_57[47:32]) +
	 15'sd 14446 * $signed(input_fmap_57[63:48]) +
	 16'sd 29034 * $signed(input_fmap_57[79:64]) +
	 16'sd 25623 * $signed(input_fmap_57[95:80]) +
	 15'sd 16334 * $signed(input_fmap_57[111:96]) +
	 12'sd 1397 * $signed(input_fmap_57[127:112]) +
	 13'sd 4050 * $signed(input_fmap_57[143:128]);

logic signed [31:0] dw_conv_mac_58;
assign dw_conv_mac_58 = 
	 16'sd 19726 * $signed(input_fmap_58[15:0]) +
	 15'sd 11078 * $signed(input_fmap_58[31:16]) +
	 16'sd 24968 * $signed(input_fmap_58[47:32]) +
	 16'sd 25644 * $signed(input_fmap_58[63:48]) +
	 16'sd 19765 * $signed(input_fmap_58[79:64]) +
	 16'sd 23509 * $signed(input_fmap_58[95:80]) +
	 16'sd 24751 * $signed(input_fmap_58[111:96]) +
	 14'sd 5159 * $signed(input_fmap_58[127:112]) +
	 16'sd 17926 * $signed(input_fmap_58[143:128]);

logic signed [31:0] dw_conv_mac_59;
assign dw_conv_mac_59 = 
	 12'sd 1686 * $signed(input_fmap_59[15:0]) +
	 15'sd 13280 * $signed(input_fmap_59[31:16]) +
	 15'sd 8585 * $signed(input_fmap_59[47:32]) +
	 16'sd 30785 * $signed(input_fmap_59[63:48]) +
	 16'sd 26716 * $signed(input_fmap_59[79:64]) +
	 15'sd 12977 * $signed(input_fmap_59[95:80]) +
	 15'sd 11094 * $signed(input_fmap_59[111:96]) +
	 15'sd 9343 * $signed(input_fmap_59[127:112]) +
	 15'sd 8865 * $signed(input_fmap_59[143:128]);

logic signed [31:0] dw_conv_mac_60;
assign dw_conv_mac_60 = 
	 16'sd 20832 * $signed(input_fmap_60[15:0]) +
	 15'sd 10821 * $signed(input_fmap_60[31:16]) +
	 15'sd 11923 * $signed(input_fmap_60[47:32]) +
	 16'sd 27332 * $signed(input_fmap_60[63:48]) +
	 16'sd 22325 * $signed(input_fmap_60[79:64]) +
	 15'sd 12085 * $signed(input_fmap_60[95:80]) +
	 16'sd 30814 * $signed(input_fmap_60[111:96]) +
	 16'sd 31423 * $signed(input_fmap_60[127:112]) +
	 16'sd 19079 * $signed(input_fmap_60[143:128]);

logic signed [31:0] dw_conv_mac_61;
assign dw_conv_mac_61 = 
	 16'sd 26548 * $signed(input_fmap_61[15:0]) +
	 16'sd 28222 * $signed(input_fmap_61[31:16]) +
	 15'sd 11132 * $signed(input_fmap_61[47:32]) +
	 16'sd 29678 * $signed(input_fmap_61[63:48]) +
	 14'sd 6018 * $signed(input_fmap_61[79:64]) +
	 14'sd 4602 * $signed(input_fmap_61[95:80]) +
	 16'sd 22852 * $signed(input_fmap_61[111:96]) +
	 16'sd 32027 * $signed(input_fmap_61[127:112]) +
	 14'sd 7784 * $signed(input_fmap_61[143:128]);

logic signed [31:0] dw_conv_mac_62;
assign dw_conv_mac_62 = 
	 16'sd 29929 * $signed(input_fmap_62[15:0]) +
	 15'sd 15943 * $signed(input_fmap_62[31:16]) +
	 14'sd 7782 * $signed(input_fmap_62[47:32]) +
	 15'sd 15797 * $signed(input_fmap_62[63:48]) +
	 16'sd 19187 * $signed(input_fmap_62[79:64]) +
	 15'sd 9362 * $signed(input_fmap_62[95:80]) +
	 13'sd 2416 * $signed(input_fmap_62[111:96]) +
	 16'sd 21305 * $signed(input_fmap_62[127:112]) +
	 16'sd 27813 * $signed(input_fmap_62[143:128]);

logic signed [31:0] dw_conv_mac_63;
assign dw_conv_mac_63 = 
	 16'sd 22148 * $signed(input_fmap_63[15:0]) +
	 13'sd 3872 * $signed(input_fmap_63[31:16]) +
	 15'sd 12037 * $signed(input_fmap_63[47:32]) +
	 14'sd 5216 * $signed(input_fmap_63[63:48]) +
	 13'sd 3609 * $signed(input_fmap_63[79:64]) +
	 14'sd 4759 * $signed(input_fmap_63[95:80]) +
	 16'sd 30011 * $signed(input_fmap_63[111:96]) +
	 16'sd 23762 * $signed(input_fmap_63[127:112]) +
	 16'sd 20243 * $signed(input_fmap_63[143:128]);

logic signed [31:0] dw_conv_mac_64;
assign dw_conv_mac_64 = 
	 15'sd 16373 * $signed(input_fmap_64[15:0]) +
	 15'sd 13678 * $signed(input_fmap_64[31:16]) +
	 16'sd 21618 * $signed(input_fmap_64[47:32]) +
	 15'sd 10291 * $signed(input_fmap_64[63:48]) +
	 14'sd 5294 * $signed(input_fmap_64[79:64]) +
	 16'sd 20082 * $signed(input_fmap_64[95:80]) +
	 15'sd 10134 * $signed(input_fmap_64[111:96]) +
	 16'sd 31772 * $signed(input_fmap_64[127:112]) +
	 14'sd 5679 * $signed(input_fmap_64[143:128]);

logic signed [31:0] dw_conv_mac_65;
assign dw_conv_mac_65 = 
	 15'sd 8960 * $signed(input_fmap_65[15:0]) +
	 16'sd 21987 * $signed(input_fmap_65[31:16]) +
	 14'sd 5798 * $signed(input_fmap_65[47:32]) +
	 15'sd 11164 * $signed(input_fmap_65[63:48]) +
	 15'sd 11198 * $signed(input_fmap_65[79:64]) +
	 14'sd 8022 * $signed(input_fmap_65[95:80]) +
	 16'sd 19234 * $signed(input_fmap_65[111:96]) +
	 16'sd 17289 * $signed(input_fmap_65[127:112]) +
	 16'sd 21706 * $signed(input_fmap_65[143:128]);

logic signed [31:0] dw_conv_mac_66;
assign dw_conv_mac_66 = 
	 15'sd 14678 * $signed(input_fmap_66[15:0]) +
	 14'sd 5386 * $signed(input_fmap_66[31:16]) +
	 16'sd 25767 * $signed(input_fmap_66[47:32]) +
	 13'sd 3171 * $signed(input_fmap_66[63:48]) +
	 15'sd 13347 * $signed(input_fmap_66[79:64]) +
	 16'sd 29168 * $signed(input_fmap_66[95:80]) +
	 15'sd 12831 * $signed(input_fmap_66[111:96]) +
	 16'sd 22620 * $signed(input_fmap_66[127:112]) +
	 16'sd 26228 * $signed(input_fmap_66[143:128]);

logic signed [31:0] dw_conv_mac_67;
assign dw_conv_mac_67 = 
	 14'sd 4326 * $signed(input_fmap_67[15:0]) +
	 16'sd 28375 * $signed(input_fmap_67[31:16]) +
	 11'sd 797 * $signed(input_fmap_67[47:32]) +
	 14'sd 5678 * $signed(input_fmap_67[63:48]) +
	 16'sd 29734 * $signed(input_fmap_67[79:64]) +
	 14'sd 8006 * $signed(input_fmap_67[95:80]) +
	 16'sd 20014 * $signed(input_fmap_67[111:96]) +
	 16'sd 17999 * $signed(input_fmap_67[127:112]) +
	 16'sd 16654 * $signed(input_fmap_67[143:128]);

logic signed [31:0] dw_conv_mac_68;
assign dw_conv_mac_68 = 
	 12'sd 1721 * $signed(input_fmap_68[15:0]) +
	 16'sd 18816 * $signed(input_fmap_68[31:16]) +
	 16'sd 21571 * $signed(input_fmap_68[47:32]) +
	 16'sd 30946 * $signed(input_fmap_68[63:48]) +
	 16'sd 22881 * $signed(input_fmap_68[79:64]) +
	 15'sd 13185 * $signed(input_fmap_68[95:80]) +
	 16'sd 20360 * $signed(input_fmap_68[111:96]) +
	 14'sd 4425 * $signed(input_fmap_68[127:112]) +
	 15'sd 16160 * $signed(input_fmap_68[143:128]);

logic signed [31:0] dw_conv_mac_69;
assign dw_conv_mac_69 = 
	 16'sd 28199 * $signed(input_fmap_69[15:0]) +
	 13'sd 3729 * $signed(input_fmap_69[31:16]) +
	 13'sd 2643 * $signed(input_fmap_69[47:32]) +
	 16'sd 31185 * $signed(input_fmap_69[63:48]) +
	 15'sd 14219 * $signed(input_fmap_69[79:64]) +
	 16'sd 22574 * $signed(input_fmap_69[95:80]) +
	 14'sd 4110 * $signed(input_fmap_69[111:96]) +
	 11'sd 717 * $signed(input_fmap_69[127:112]) +
	 16'sd 29399 * $signed(input_fmap_69[143:128]);

logic signed [31:0] dw_conv_mac_70;
assign dw_conv_mac_70 = 
	 13'sd 3664 * $signed(input_fmap_70[15:0]) +
	 16'sd 21415 * $signed(input_fmap_70[31:16]) +
	 16'sd 20707 * $signed(input_fmap_70[47:32]) +
	 15'sd 11729 * $signed(input_fmap_70[63:48]) +
	 15'sd 15032 * $signed(input_fmap_70[79:64]) +
	 15'sd 15596 * $signed(input_fmap_70[95:80]) +
	 14'sd 7895 * $signed(input_fmap_70[111:96]) +
	 16'sd 22429 * $signed(input_fmap_70[127:112]) +
	 16'sd 31662 * $signed(input_fmap_70[143:128]);

logic signed [31:0] dw_conv_mac_71;
assign dw_conv_mac_71 = 
	 16'sd 28030 * $signed(input_fmap_71[15:0]) +
	 15'sd 9433 * $signed(input_fmap_71[31:16]) +
	 15'sd 10347 * $signed(input_fmap_71[47:32]) +
	 16'sd 23856 * $signed(input_fmap_71[63:48]) +
	 16'sd 29603 * $signed(input_fmap_71[79:64]) +
	 16'sd 30379 * $signed(input_fmap_71[95:80]) +
	 16'sd 26749 * $signed(input_fmap_71[111:96]) +
	 16'sd 25326 * $signed(input_fmap_71[127:112]) +
	 15'sd 11409 * $signed(input_fmap_71[143:128]);

logic signed [31:0] dw_conv_mac_72;
assign dw_conv_mac_72 = 
	 16'sd 19942 * $signed(input_fmap_72[15:0]) +
	 16'sd 27719 * $signed(input_fmap_72[31:16]) +
	 15'sd 15374 * $signed(input_fmap_72[47:32]) +
	 16'sd 27679 * $signed(input_fmap_72[63:48]) +
	 13'sd 2551 * $signed(input_fmap_72[79:64]) +
	 16'sd 21984 * $signed(input_fmap_72[95:80]) +
	 14'sd 6839 * $signed(input_fmap_72[111:96]) +
	 13'sd 3077 * $signed(input_fmap_72[127:112]) +
	 16'sd 30450 * $signed(input_fmap_72[143:128]);

logic signed [31:0] dw_conv_mac_73;
assign dw_conv_mac_73 = 
	 14'sd 7086 * $signed(input_fmap_73[15:0]) +
	 12'sd 1728 * $signed(input_fmap_73[31:16]) +
	 16'sd 20122 * $signed(input_fmap_73[47:32]) +
	 15'sd 11243 * $signed(input_fmap_73[63:48]) +
	 16'sd 31578 * $signed(input_fmap_73[79:64]) +
	 16'sd 28468 * $signed(input_fmap_73[95:80]) +
	 16'sd 26712 * $signed(input_fmap_73[111:96]) +
	 16'sd 24269 * $signed(input_fmap_73[127:112]) +
	 16'sd 31121 * $signed(input_fmap_73[143:128]);

logic signed [31:0] dw_conv_mac_74;
assign dw_conv_mac_74 = 
	 16'sd 30909 * $signed(input_fmap_74[15:0]) +
	 15'sd 12585 * $signed(input_fmap_74[31:16]) +
	 16'sd 27508 * $signed(input_fmap_74[47:32]) +
	 15'sd 14587 * $signed(input_fmap_74[63:48]) +
	 12'sd 1312 * $signed(input_fmap_74[79:64]) +
	 16'sd 30942 * $signed(input_fmap_74[95:80]) +
	 14'sd 4512 * $signed(input_fmap_74[111:96]) +
	 15'sd 8323 * $signed(input_fmap_74[127:112]) +
	 16'sd 30180 * $signed(input_fmap_74[143:128]);

logic signed [31:0] dw_conv_mac_75;
assign dw_conv_mac_75 = 
	 16'sd 21769 * $signed(input_fmap_75[15:0]) +
	 14'sd 5847 * $signed(input_fmap_75[31:16]) +
	 16'sd 24065 * $signed(input_fmap_75[47:32]) +
	 15'sd 9585 * $signed(input_fmap_75[63:48]) +
	 15'sd 14489 * $signed(input_fmap_75[79:64]) +
	 14'sd 8176 * $signed(input_fmap_75[95:80]) +
	 15'sd 8862 * $signed(input_fmap_75[111:96]) +
	 13'sd 3636 * $signed(input_fmap_75[127:112]) +
	 15'sd 9935 * $signed(input_fmap_75[143:128]);

logic signed [31:0] dw_conv_mac_76;
assign dw_conv_mac_76 = 
	 14'sd 8126 * $signed(input_fmap_76[15:0]) +
	 16'sd 19007 * $signed(input_fmap_76[31:16]) +
	 13'sd 2325 * $signed(input_fmap_76[47:32]) +
	 16'sd 24236 * $signed(input_fmap_76[63:48]) +
	 13'sd 3751 * $signed(input_fmap_76[79:64]) +
	 16'sd 23756 * $signed(input_fmap_76[95:80]) +
	 16'sd 27988 * $signed(input_fmap_76[111:96]) +
	 15'sd 15251 * $signed(input_fmap_76[127:112]) +
	 12'sd 1922 * $signed(input_fmap_76[143:128]);

logic signed [31:0] dw_conv_mac_77;
assign dw_conv_mac_77 = 
	 15'sd 8409 * $signed(input_fmap_77[15:0]) +
	 16'sd 32504 * $signed(input_fmap_77[31:16]) +
	 16'sd 25314 * $signed(input_fmap_77[47:32]) +
	 12'sd 1584 * $signed(input_fmap_77[63:48]) +
	 14'sd 6908 * $signed(input_fmap_77[79:64]) +
	 16'sd 23154 * $signed(input_fmap_77[95:80]) +
	 13'sd 2103 * $signed(input_fmap_77[111:96]) +
	 16'sd 23174 * $signed(input_fmap_77[127:112]) +
	 16'sd 28430 * $signed(input_fmap_77[143:128]);

logic signed [31:0] dw_conv_mac_78;
assign dw_conv_mac_78 = 
	 16'sd 20424 * $signed(input_fmap_78[15:0]) +
	 13'sd 3487 * $signed(input_fmap_78[31:16]) +
	 15'sd 13041 * $signed(input_fmap_78[47:32]) +
	 16'sd 21103 * $signed(input_fmap_78[63:48]) +
	 15'sd 11420 * $signed(input_fmap_78[79:64]) +
	 16'sd 25004 * $signed(input_fmap_78[95:80]) +
	 16'sd 16955 * $signed(input_fmap_78[111:96]) +
	 15'sd 10283 * $signed(input_fmap_78[127:112]) +
	 15'sd 15328 * $signed(input_fmap_78[143:128]);

logic signed [31:0] dw_conv_mac_79;
assign dw_conv_mac_79 = 
	 15'sd 8662 * $signed(input_fmap_79[15:0]) +
	 13'sd 3915 * $signed(input_fmap_79[31:16]) +
	 12'sd 1697 * $signed(input_fmap_79[47:32]) +
	 16'sd 21007 * $signed(input_fmap_79[63:48]) +
	 15'sd 13806 * $signed(input_fmap_79[79:64]) +
	 15'sd 14863 * $signed(input_fmap_79[95:80]) +
	 16'sd 18213 * $signed(input_fmap_79[111:96]) +
	 14'sd 7861 * $signed(input_fmap_79[127:112]) +
	 12'sd 1500 * $signed(input_fmap_79[143:128]);

logic signed [31:0] dw_conv_mac_80;
assign dw_conv_mac_80 = 
	 14'sd 7660 * $signed(input_fmap_80[15:0]) +
	 16'sd 29479 * $signed(input_fmap_80[31:16]) +
	 16'sd 29918 * $signed(input_fmap_80[47:32]) +
	 13'sd 2421 * $signed(input_fmap_80[63:48]) +
	 14'sd 8097 * $signed(input_fmap_80[79:64]) +
	 15'sd 14732 * $signed(input_fmap_80[95:80]) +
	 16'sd 16554 * $signed(input_fmap_80[111:96]) +
	 15'sd 11879 * $signed(input_fmap_80[127:112]) +
	 15'sd 9378 * $signed(input_fmap_80[143:128]);

logic signed [31:0] dw_conv_mac_81;
assign dw_conv_mac_81 = 
	 16'sd 29497 * $signed(input_fmap_81[15:0]) +
	 16'sd 32557 * $signed(input_fmap_81[31:16]) +
	 16'sd 19218 * $signed(input_fmap_81[47:32]) +
	 16'sd 26363 * $signed(input_fmap_81[63:48]) +
	 13'sd 3854 * $signed(input_fmap_81[79:64]) +
	 15'sd 10560 * $signed(input_fmap_81[95:80]) +
	 15'sd 10208 * $signed(input_fmap_81[111:96]) +
	 16'sd 23471 * $signed(input_fmap_81[127:112]) +
	 15'sd 8199 * $signed(input_fmap_81[143:128]);

logic signed [31:0] dw_conv_mac_82;
assign dw_conv_mac_82 = 
	 14'sd 4421 * $signed(input_fmap_82[15:0]) +
	 16'sd 23159 * $signed(input_fmap_82[31:16]) +
	 15'sd 8292 * $signed(input_fmap_82[47:32]) +
	 12'sd 1804 * $signed(input_fmap_82[63:48]) +
	 15'sd 9592 * $signed(input_fmap_82[79:64]) +
	 13'sd 2461 * $signed(input_fmap_82[95:80]) +
	 16'sd 17589 * $signed(input_fmap_82[111:96]) +
	 15'sd 8758 * $signed(input_fmap_82[127:112]) +
	 16'sd 21576 * $signed(input_fmap_82[143:128]);

logic signed [31:0] dw_conv_mac_83;
assign dw_conv_mac_83 = 
	 16'sd 23335 * $signed(input_fmap_83[15:0]) +
	 13'sd 2388 * $signed(input_fmap_83[31:16]) +
	 16'sd 18274 * $signed(input_fmap_83[47:32]) +
	 15'sd 14387 * $signed(input_fmap_83[63:48]) +
	 11'sd 589 * $signed(input_fmap_83[79:64]) +
	 13'sd 3495 * $signed(input_fmap_83[95:80]) +
	 16'sd 28929 * $signed(input_fmap_83[111:96]) +
	 14'sd 6882 * $signed(input_fmap_83[127:112]) +
	 16'sd 19119 * $signed(input_fmap_83[143:128]);

logic signed [31:0] dw_conv_mac_84;
assign dw_conv_mac_84 = 
	 14'sd 4921 * $signed(input_fmap_84[15:0]) +
	 15'sd 16046 * $signed(input_fmap_84[31:16]) +
	 15'sd 12752 * $signed(input_fmap_84[47:32]) +
	 9'sd 139 * $signed(input_fmap_84[63:48]) +
	 16'sd 30022 * $signed(input_fmap_84[79:64]) +
	 14'sd 5217 * $signed(input_fmap_84[95:80]) +
	 16'sd 31112 * $signed(input_fmap_84[111:96]) +
	 15'sd 11552 * $signed(input_fmap_84[127:112]) +
	 16'sd 27381 * $signed(input_fmap_84[143:128]);

logic signed [31:0] dw_conv_mac_85;
assign dw_conv_mac_85 = 
	 13'sd 3301 * $signed(input_fmap_85[15:0]) +
	 16'sd 26096 * $signed(input_fmap_85[31:16]) +
	 12'sd 1573 * $signed(input_fmap_85[47:32]) +
	 16'sd 16573 * $signed(input_fmap_85[63:48]) +
	 15'sd 14509 * $signed(input_fmap_85[79:64]) +
	 16'sd 22810 * $signed(input_fmap_85[95:80]) +
	 13'sd 3254 * $signed(input_fmap_85[111:96]) +
	 12'sd 1078 * $signed(input_fmap_85[127:112]) +
	 16'sd 21591 * $signed(input_fmap_85[143:128]);

logic signed [31:0] dw_conv_mac_86;
assign dw_conv_mac_86 = 
	 16'sd 16713 * $signed(input_fmap_86[15:0]) +
	 16'sd 31432 * $signed(input_fmap_86[31:16]) +
	 16'sd 27632 * $signed(input_fmap_86[47:32]) +
	 14'sd 7340 * $signed(input_fmap_86[63:48]) +
	 14'sd 7379 * $signed(input_fmap_86[79:64]) +
	 16'sd 24208 * $signed(input_fmap_86[95:80]) +
	 16'sd 30869 * $signed(input_fmap_86[111:96]) +
	 13'sd 4094 * $signed(input_fmap_86[127:112]) +
	 15'sd 13503 * $signed(input_fmap_86[143:128]);

logic signed [31:0] dw_conv_mac_87;
assign dw_conv_mac_87 = 
	 15'sd 11562 * $signed(input_fmap_87[15:0]) +
	 16'sd 31064 * $signed(input_fmap_87[31:16]) +
	 16'sd 28858 * $signed(input_fmap_87[47:32]) +
	 15'sd 13101 * $signed(input_fmap_87[63:48]) +
	 16'sd 17454 * $signed(input_fmap_87[79:64]) +
	 15'sd 9774 * $signed(input_fmap_87[95:80]) +
	 16'sd 29927 * $signed(input_fmap_87[111:96]) +
	 15'sd 12937 * $signed(input_fmap_87[127:112]) +
	 16'sd 31777 * $signed(input_fmap_87[143:128]);

logic signed [31:0] dw_conv_mac_88;
assign dw_conv_mac_88 = 
	 16'sd 16715 * $signed(input_fmap_88[15:0]) +
	 13'sd 2187 * $signed(input_fmap_88[31:16]) +
	 15'sd 12216 * $signed(input_fmap_88[47:32]) +
	 14'sd 7169 * $signed(input_fmap_88[63:48]) +
	 12'sd 1771 * $signed(input_fmap_88[79:64]) +
	 15'sd 14898 * $signed(input_fmap_88[95:80]) +
	 15'sd 10942 * $signed(input_fmap_88[111:96]) +
	 12'sd 1079 * $signed(input_fmap_88[127:112]) +
	 14'sd 4719 * $signed(input_fmap_88[143:128]);

logic signed [31:0] dw_conv_mac_89;
assign dw_conv_mac_89 = 
	 16'sd 17988 * $signed(input_fmap_89[15:0]) +
	 15'sd 11755 * $signed(input_fmap_89[31:16]) +
	 16'sd 24700 * $signed(input_fmap_89[47:32]) +
	 16'sd 19832 * $signed(input_fmap_89[63:48]) +
	 16'sd 31302 * $signed(input_fmap_89[79:64]) +
	 15'sd 13893 * $signed(input_fmap_89[95:80]) +
	 16'sd 24285 * $signed(input_fmap_89[111:96]) +
	 16'sd 28512 * $signed(input_fmap_89[127:112]) +
	 16'sd 24002 * $signed(input_fmap_89[143:128]);

logic signed [31:0] dw_conv_mac_90;
assign dw_conv_mac_90 = 
	 16'sd 18993 * $signed(input_fmap_90[15:0]) +
	 15'sd 14662 * $signed(input_fmap_90[31:16]) +
	 15'sd 11324 * $signed(input_fmap_90[47:32]) +
	 14'sd 6762 * $signed(input_fmap_90[63:48]) +
	 14'sd 6599 * $signed(input_fmap_90[79:64]) +
	 16'sd 18781 * $signed(input_fmap_90[95:80]) +
	 16'sd 23353 * $signed(input_fmap_90[111:96]) +
	 15'sd 15304 * $signed(input_fmap_90[127:112]) +
	 15'sd 13539 * $signed(input_fmap_90[143:128]);

logic signed [31:0] dw_conv_mac_91;
assign dw_conv_mac_91 = 
	 16'sd 28076 * $signed(input_fmap_91[15:0]) +
	 15'sd 12674 * $signed(input_fmap_91[31:16]) +
	 16'sd 29705 * $signed(input_fmap_91[47:32]) +
	 15'sd 14475 * $signed(input_fmap_91[63:48]) +
	 15'sd 9897 * $signed(input_fmap_91[79:64]) +
	 11'sd 729 * $signed(input_fmap_91[95:80]) +
	 16'sd 30142 * $signed(input_fmap_91[111:96]) +
	 14'sd 5277 * $signed(input_fmap_91[127:112]) +
	 16'sd 18596 * $signed(input_fmap_91[143:128]);

logic signed [31:0] dw_conv_mac_92;
assign dw_conv_mac_92 = 
	 15'sd 12069 * $signed(input_fmap_92[15:0]) +
	 12'sd 1632 * $signed(input_fmap_92[31:16]) +
	 15'sd 10382 * $signed(input_fmap_92[47:32]) +
	 15'sd 11132 * $signed(input_fmap_92[63:48]) +
	 16'sd 21761 * $signed(input_fmap_92[79:64]) +
	 16'sd 30789 * $signed(input_fmap_92[95:80]) +
	 11'sd 520 * $signed(input_fmap_92[111:96]) +
	 16'sd 16701 * $signed(input_fmap_92[127:112]) +
	 16'sd 27654 * $signed(input_fmap_92[143:128]);

logic signed [31:0] dw_conv_mac_93;
assign dw_conv_mac_93 = 
	 14'sd 6866 * $signed(input_fmap_93[15:0]) +
	 16'sd 25241 * $signed(input_fmap_93[31:16]) +
	 16'sd 17355 * $signed(input_fmap_93[47:32]) +
	 16'sd 29994 * $signed(input_fmap_93[63:48]) +
	 16'sd 30723 * $signed(input_fmap_93[79:64]) +
	 16'sd 24584 * $signed(input_fmap_93[95:80]) +
	 16'sd 16800 * $signed(input_fmap_93[111:96]) +
	 14'sd 4608 * $signed(input_fmap_93[127:112]) +
	 16'sd 32397 * $signed(input_fmap_93[143:128]);

logic signed [31:0] dw_conv_mac_94;
assign dw_conv_mac_94 = 
	 12'sd 1414 * $signed(input_fmap_94[15:0]) +
	 16'sd 27434 * $signed(input_fmap_94[31:16]) +
	 16'sd 26987 * $signed(input_fmap_94[47:32]) +
	 13'sd 3098 * $signed(input_fmap_94[63:48]) +
	 15'sd 11617 * $signed(input_fmap_94[79:64]) +
	 14'sd 7751 * $signed(input_fmap_94[95:80]) +
	 16'sd 18695 * $signed(input_fmap_94[111:96]) +
	 15'sd 11900 * $signed(input_fmap_94[127:112]) +
	 14'sd 6914 * $signed(input_fmap_94[143:128]);

logic signed [31:0] dw_conv_mac_95;
assign dw_conv_mac_95 = 
	 16'sd 29133 * $signed(input_fmap_95[15:0]) +
	 16'sd 30934 * $signed(input_fmap_95[31:16]) +
	 16'sd 25225 * $signed(input_fmap_95[47:32]) +
	 16'sd 21758 * $signed(input_fmap_95[63:48]) +
	 16'sd 25376 * $signed(input_fmap_95[79:64]) +
	 16'sd 25908 * $signed(input_fmap_95[95:80]) +
	 16'sd 30713 * $signed(input_fmap_95[111:96]) +
	 16'sd 28743 * $signed(input_fmap_95[127:112]) +
	 16'sd 26082 * $signed(input_fmap_95[143:128]);

logic signed [31:0] dw_conv_mac_96;
assign dw_conv_mac_96 = 
	 16'sd 25974 * $signed(input_fmap_96[15:0]) +
	 16'sd 18734 * $signed(input_fmap_96[31:16]) +
	 12'sd 1600 * $signed(input_fmap_96[47:32]) +
	 13'sd 2258 * $signed(input_fmap_96[63:48]) +
	 16'sd 22938 * $signed(input_fmap_96[79:64]) +
	 15'sd 15248 * $signed(input_fmap_96[95:80]) +
	 13'sd 2972 * $signed(input_fmap_96[111:96]) +
	 15'sd 8392 * $signed(input_fmap_96[127:112]) +
	 13'sd 4026 * $signed(input_fmap_96[143:128]);

logic signed [31:0] dw_conv_mac_97;
assign dw_conv_mac_97 = 
	 16'sd 19730 * $signed(input_fmap_97[15:0]) +
	 16'sd 30118 * $signed(input_fmap_97[31:16]) +
	 13'sd 2836 * $signed(input_fmap_97[47:32]) +
	 16'sd 22061 * $signed(input_fmap_97[63:48]) +
	 16'sd 31015 * $signed(input_fmap_97[79:64]) +
	 14'sd 4207 * $signed(input_fmap_97[95:80]) +
	 16'sd 17236 * $signed(input_fmap_97[111:96]) +
	 14'sd 4919 * $signed(input_fmap_97[127:112]) +
	 16'sd 18311 * $signed(input_fmap_97[143:128]);

logic signed [31:0] dw_conv_mac_98;
assign dw_conv_mac_98 = 
	 16'sd 31904 * $signed(input_fmap_98[15:0]) +
	 16'sd 19325 * $signed(input_fmap_98[31:16]) +
	 14'sd 5408 * $signed(input_fmap_98[47:32]) +
	 15'sd 15101 * $signed(input_fmap_98[63:48]) +
	 14'sd 5111 * $signed(input_fmap_98[79:64]) +
	 13'sd 3719 * $signed(input_fmap_98[95:80]) +
	 16'sd 20874 * $signed(input_fmap_98[111:96]) +
	 16'sd 27360 * $signed(input_fmap_98[127:112]) +
	 16'sd 31680 * $signed(input_fmap_98[143:128]);

logic signed [31:0] dw_conv_mac_99;
assign dw_conv_mac_99 = 
	 12'sd 1309 * $signed(input_fmap_99[15:0]) +
	 16'sd 26064 * $signed(input_fmap_99[31:16]) +
	 16'sd 22372 * $signed(input_fmap_99[47:32]) +
	 16'sd 17221 * $signed(input_fmap_99[63:48]) +
	 15'sd 12997 * $signed(input_fmap_99[79:64]) +
	 16'sd 24651 * $signed(input_fmap_99[95:80]) +
	 16'sd 22445 * $signed(input_fmap_99[111:96]) +
	 16'sd 19106 * $signed(input_fmap_99[127:112]) +
	 16'sd 31483 * $signed(input_fmap_99[143:128]);

logic signed [31:0] dw_conv_mac_100;
assign dw_conv_mac_100 = 
	 14'sd 5921 * $signed(input_fmap_100[15:0]) +
	 16'sd 16678 * $signed(input_fmap_100[31:16]) +
	 12'sd 1063 * $signed(input_fmap_100[47:32]) +
	 16'sd 16453 * $signed(input_fmap_100[63:48]) +
	 16'sd 23099 * $signed(input_fmap_100[79:64]) +
	 16'sd 27719 * $signed(input_fmap_100[95:80]) +
	 14'sd 4550 * $signed(input_fmap_100[111:96]) +
	 16'sd 27568 * $signed(input_fmap_100[127:112]) +
	 16'sd 22437 * $signed(input_fmap_100[143:128]);

logic signed [31:0] dw_conv_mac_101;
assign dw_conv_mac_101 = 
	 16'sd 24676 * $signed(input_fmap_101[15:0]) +
	 16'sd 24880 * $signed(input_fmap_101[31:16]) +
	 16'sd 26979 * $signed(input_fmap_101[47:32]) +
	 15'sd 14649 * $signed(input_fmap_101[63:48]) +
	 10'sd 403 * $signed(input_fmap_101[79:64]) +
	 16'sd 23098 * $signed(input_fmap_101[95:80]) +
	 15'sd 10782 * $signed(input_fmap_101[111:96]) +
	 15'sd 14463 * $signed(input_fmap_101[127:112]) +
	 14'sd 4574 * $signed(input_fmap_101[143:128]);

logic signed [31:0] dw_conv_mac_102;
assign dw_conv_mac_102 = 
	 15'sd 13053 * $signed(input_fmap_102[15:0]) +
	 13'sd 2270 * $signed(input_fmap_102[31:16]) +
	 16'sd 29036 * $signed(input_fmap_102[47:32]) +
	 15'sd 15766 * $signed(input_fmap_102[63:48]) +
	 14'sd 4434 * $signed(input_fmap_102[79:64]) +
	 16'sd 32172 * $signed(input_fmap_102[95:80]) +
	 14'sd 5054 * $signed(input_fmap_102[111:96]) +
	 16'sd 20165 * $signed(input_fmap_102[127:112]) +
	 16'sd 29962 * $signed(input_fmap_102[143:128]);

logic signed [31:0] dw_conv_mac_103;
assign dw_conv_mac_103 = 
	 16'sd 23555 * $signed(input_fmap_103[15:0]) +
	 15'sd 12330 * $signed(input_fmap_103[31:16]) +
	 16'sd 30029 * $signed(input_fmap_103[47:32]) +
	 11'sd 733 * $signed(input_fmap_103[63:48]) +
	 16'sd 32345 * $signed(input_fmap_103[79:64]) +
	 16'sd 17442 * $signed(input_fmap_103[95:80]) +
	 14'sd 6451 * $signed(input_fmap_103[111:96]) +
	 13'sd 3635 * $signed(input_fmap_103[127:112]) +
	 16'sd 17810 * $signed(input_fmap_103[143:128]);

logic signed [31:0] dw_conv_mac_104;
assign dw_conv_mac_104 = 
	 15'sd 11592 * $signed(input_fmap_104[15:0]) +
	 16'sd 21253 * $signed(input_fmap_104[31:16]) +
	 16'sd 21276 * $signed(input_fmap_104[47:32]) +
	 14'sd 4838 * $signed(input_fmap_104[63:48]) +
	 11'sd 944 * $signed(input_fmap_104[79:64]) +
	 14'sd 4825 * $signed(input_fmap_104[95:80]) +
	 16'sd 26361 * $signed(input_fmap_104[111:96]) +
	 16'sd 28692 * $signed(input_fmap_104[127:112]) +
	 16'sd 25436 * $signed(input_fmap_104[143:128]);

logic signed [31:0] dw_conv_mac_105;
assign dw_conv_mac_105 = 
	 16'sd 23520 * $signed(input_fmap_105[15:0]) +
	 16'sd 17099 * $signed(input_fmap_105[31:16]) +
	 16'sd 29502 * $signed(input_fmap_105[47:32]) +
	 11'sd 601 * $signed(input_fmap_105[63:48]) +
	 11'sd 681 * $signed(input_fmap_105[79:64]) +
	 13'sd 2965 * $signed(input_fmap_105[95:80]) +
	 16'sd 27571 * $signed(input_fmap_105[111:96]) +
	 14'sd 6357 * $signed(input_fmap_105[127:112]) +
	 16'sd 17609 * $signed(input_fmap_105[143:128]);

logic signed [31:0] dw_conv_mac_106;
assign dw_conv_mac_106 = 
	 14'sd 6329 * $signed(input_fmap_106[15:0]) +
	 16'sd 28714 * $signed(input_fmap_106[31:16]) +
	 16'sd 19402 * $signed(input_fmap_106[47:32]) +
	 16'sd 18026 * $signed(input_fmap_106[63:48]) +
	 16'sd 31834 * $signed(input_fmap_106[79:64]) +
	 14'sd 4774 * $signed(input_fmap_106[95:80]) +
	 15'sd 8325 * $signed(input_fmap_106[111:96]) +
	 16'sd 28828 * $signed(input_fmap_106[127:112]) +
	 16'sd 19466 * $signed(input_fmap_106[143:128]);

logic signed [31:0] dw_conv_mac_107;
assign dw_conv_mac_107 = 
	 13'sd 2925 * $signed(input_fmap_107[15:0]) +
	 14'sd 6537 * $signed(input_fmap_107[31:16]) +
	 13'sd 3316 * $signed(input_fmap_107[47:32]) +
	 15'sd 11643 * $signed(input_fmap_107[63:48]) +
	 15'sd 12903 * $signed(input_fmap_107[79:64]) +
	 15'sd 12409 * $signed(input_fmap_107[95:80]) +
	 16'sd 20270 * $signed(input_fmap_107[111:96]) +
	 16'sd 29354 * $signed(input_fmap_107[127:112]) +
	 14'sd 5392 * $signed(input_fmap_107[143:128]);

logic signed [31:0] dw_conv_mac_108;
assign dw_conv_mac_108 = 
	 13'sd 4009 * $signed(input_fmap_108[15:0]) +
	 15'sd 15248 * $signed(input_fmap_108[31:16]) +
	 16'sd 22736 * $signed(input_fmap_108[47:32]) +
	 16'sd 26264 * $signed(input_fmap_108[63:48]) +
	 16'sd 28321 * $signed(input_fmap_108[79:64]) +
	 15'sd 14589 * $signed(input_fmap_108[95:80]) +
	 16'sd 23092 * $signed(input_fmap_108[111:96]) +
	 15'sd 16143 * $signed(input_fmap_108[127:112]) +
	 16'sd 30172 * $signed(input_fmap_108[143:128]);

logic signed [31:0] dw_conv_mac_109;
assign dw_conv_mac_109 = 
	 15'sd 14526 * $signed(input_fmap_109[15:0]) +
	 15'sd 16302 * $signed(input_fmap_109[31:16]) +
	 16'sd 17122 * $signed(input_fmap_109[47:32]) +
	 16'sd 24518 * $signed(input_fmap_109[63:48]) +
	 15'sd 11439 * $signed(input_fmap_109[79:64]) +
	 15'sd 13231 * $signed(input_fmap_109[95:80]) +
	 16'sd 27492 * $signed(input_fmap_109[111:96]) +
	 14'sd 5878 * $signed(input_fmap_109[127:112]) +
	 16'sd 32616 * $signed(input_fmap_109[143:128]);

logic signed [31:0] dw_conv_mac_110;
assign dw_conv_mac_110 = 
	 14'sd 7735 * $signed(input_fmap_110[15:0]) +
	 16'sd 21573 * $signed(input_fmap_110[31:16]) +
	 16'sd 26856 * $signed(input_fmap_110[47:32]) +
	 15'sd 10318 * $signed(input_fmap_110[63:48]) +
	 14'sd 7850 * $signed(input_fmap_110[79:64]) +
	 16'sd 21426 * $signed(input_fmap_110[95:80]) +
	 10'sd 456 * $signed(input_fmap_110[111:96]) +
	 15'sd 15190 * $signed(input_fmap_110[127:112]) +
	 16'sd 31498 * $signed(input_fmap_110[143:128]);

logic signed [31:0] dw_conv_mac_111;
assign dw_conv_mac_111 = 
	 16'sd 24461 * $signed(input_fmap_111[15:0]) +
	 16'sd 16797 * $signed(input_fmap_111[31:16]) +
	 15'sd 12341 * $signed(input_fmap_111[47:32]) +
	 16'sd 27830 * $signed(input_fmap_111[63:48]) +
	 13'sd 2378 * $signed(input_fmap_111[79:64]) +
	 16'sd 24407 * $signed(input_fmap_111[95:80]) +
	 13'sd 2170 * $signed(input_fmap_111[111:96]) +
	 16'sd 28081 * $signed(input_fmap_111[127:112]) +
	 16'sd 32067 * $signed(input_fmap_111[143:128]);

logic signed [31:0] dw_conv_mac_112;
assign dw_conv_mac_112 = 
	 14'sd 4720 * $signed(input_fmap_112[15:0]) +
	 16'sd 20382 * $signed(input_fmap_112[31:16]) +
	 12'sd 1969 * $signed(input_fmap_112[47:32]) +
	 16'sd 22647 * $signed(input_fmap_112[63:48]) +
	 16'sd 30719 * $signed(input_fmap_112[79:64]) +
	 10'sd 262 * $signed(input_fmap_112[95:80]) +
	 16'sd 28374 * $signed(input_fmap_112[111:96]) +
	 16'sd 30276 * $signed(input_fmap_112[127:112]) +
	 15'sd 13529 * $signed(input_fmap_112[143:128]);

logic signed [31:0] dw_conv_mac_113;
assign dw_conv_mac_113 = 
	 16'sd 29197 * $signed(input_fmap_113[15:0]) +
	 16'sd 23887 * $signed(input_fmap_113[31:16]) +
	 16'sd 32592 * $signed(input_fmap_113[47:32]) +
	 15'sd 9236 * $signed(input_fmap_113[63:48]) +
	 16'sd 25403 * $signed(input_fmap_113[79:64]) +
	 16'sd 30822 * $signed(input_fmap_113[95:80]) +
	 16'sd 17055 * $signed(input_fmap_113[111:96]) +
	 16'sd 20839 * $signed(input_fmap_113[127:112]) +
	 15'sd 16230 * $signed(input_fmap_113[143:128]);

logic signed [31:0] dw_conv_mac_114;
assign dw_conv_mac_114 = 
	 14'sd 6769 * $signed(input_fmap_114[15:0]) +
	 14'sd 7226 * $signed(input_fmap_114[31:16]) +
	 15'sd 11878 * $signed(input_fmap_114[47:32]) +
	 13'sd 2195 * $signed(input_fmap_114[63:48]) +
	 16'sd 25097 * $signed(input_fmap_114[79:64]) +
	 16'sd 18565 * $signed(input_fmap_114[95:80]) +
	 15'sd 9993 * $signed(input_fmap_114[111:96]) +
	 16'sd 30419 * $signed(input_fmap_114[127:112]) +
	 14'sd 5889 * $signed(input_fmap_114[143:128]);

logic signed [31:0] dw_conv_mac_115;
assign dw_conv_mac_115 = 
	 15'sd 13146 * $signed(input_fmap_115[15:0]) +
	 14'sd 6720 * $signed(input_fmap_115[31:16]) +
	 14'sd 7942 * $signed(input_fmap_115[47:32]) +
	 14'sd 8061 * $signed(input_fmap_115[63:48]) +
	 15'sd 12506 * $signed(input_fmap_115[79:64]) +
	 16'sd 23305 * $signed(input_fmap_115[95:80]) +
	 15'sd 11896 * $signed(input_fmap_115[111:96]) +
	 16'sd 24420 * $signed(input_fmap_115[127:112]) +
	 16'sd 25227 * $signed(input_fmap_115[143:128]);

logic signed [31:0] dw_conv_mac_116;
assign dw_conv_mac_116 = 
	 16'sd 28418 * $signed(input_fmap_116[15:0]) +
	 16'sd 24564 * $signed(input_fmap_116[31:16]) +
	 15'sd 11793 * $signed(input_fmap_116[47:32]) +
	 15'sd 15528 * $signed(input_fmap_116[63:48]) +
	 16'sd 24250 * $signed(input_fmap_116[79:64]) +
	 16'sd 30852 * $signed(input_fmap_116[95:80]) +
	 16'sd 17530 * $signed(input_fmap_116[111:96]) +
	 16'sd 20743 * $signed(input_fmap_116[127:112]) +
	 15'sd 10119 * $signed(input_fmap_116[143:128]);

logic signed [31:0] dw_conv_mac_117;
assign dw_conv_mac_117 = 
	 16'sd 22101 * $signed(input_fmap_117[15:0]) +
	 13'sd 3538 * $signed(input_fmap_117[31:16]) +
	 16'sd 23226 * $signed(input_fmap_117[47:32]) +
	 15'sd 14814 * $signed(input_fmap_117[63:48]) +
	 16'sd 19337 * $signed(input_fmap_117[79:64]) +
	 16'sd 22062 * $signed(input_fmap_117[95:80]) +
	 16'sd 19056 * $signed(input_fmap_117[111:96]) +
	 16'sd 31896 * $signed(input_fmap_117[127:112]) +
	 14'sd 6955 * $signed(input_fmap_117[143:128]);

logic signed [31:0] dw_conv_mac_118;
assign dw_conv_mac_118 = 
	 16'sd 20670 * $signed(input_fmap_118[15:0]) +
	 16'sd 28551 * $signed(input_fmap_118[31:16]) +
	 15'sd 15976 * $signed(input_fmap_118[47:32]) +
	 15'sd 13321 * $signed(input_fmap_118[63:48]) +
	 14'sd 5381 * $signed(input_fmap_118[79:64]) +
	 16'sd 30831 * $signed(input_fmap_118[95:80]) +
	 16'sd 17780 * $signed(input_fmap_118[111:96]) +
	 14'sd 5667 * $signed(input_fmap_118[127:112]) +
	 13'sd 3158 * $signed(input_fmap_118[143:128]);

logic signed [31:0] dw_conv_mac_119;
assign dw_conv_mac_119 = 
	 16'sd 23883 * $signed(input_fmap_119[15:0]) +
	 16'sd 30914 * $signed(input_fmap_119[31:16]) +
	 16'sd 30563 * $signed(input_fmap_119[47:32]) +
	 15'sd 12022 * $signed(input_fmap_119[63:48]) +
	 15'sd 13497 * $signed(input_fmap_119[79:64]) +
	 16'sd 20107 * $signed(input_fmap_119[95:80]) +
	 16'sd 27911 * $signed(input_fmap_119[111:96]) +
	 15'sd 13149 * $signed(input_fmap_119[127:112]) +
	 16'sd 30154 * $signed(input_fmap_119[143:128]);

logic signed [31:0] dw_conv_mac_120;
assign dw_conv_mac_120 = 
	 16'sd 27256 * $signed(input_fmap_120[15:0]) +
	 16'sd 16818 * $signed(input_fmap_120[31:16]) +
	 16'sd 17157 * $signed(input_fmap_120[47:32]) +
	 16'sd 28640 * $signed(input_fmap_120[63:48]) +
	 14'sd 4364 * $signed(input_fmap_120[79:64]) +
	 16'sd 32257 * $signed(input_fmap_120[95:80]) +
	 15'sd 14417 * $signed(input_fmap_120[111:96]) +
	 16'sd 22416 * $signed(input_fmap_120[127:112]) +
	 15'sd 12158 * $signed(input_fmap_120[143:128]);

logic signed [31:0] dw_conv_mac_121;
assign dw_conv_mac_121 = 
	 15'sd 11050 * $signed(input_fmap_121[15:0]) +
	 16'sd 27810 * $signed(input_fmap_121[31:16]) +
	 16'sd 19892 * $signed(input_fmap_121[47:32]) +
	 16'sd 24667 * $signed(input_fmap_121[63:48]) +
	 15'sd 11627 * $signed(input_fmap_121[79:64]) +
	 13'sd 2892 * $signed(input_fmap_121[95:80]) +
	 15'sd 11026 * $signed(input_fmap_121[111:96]) +
	 13'sd 3866 * $signed(input_fmap_121[127:112]) +
	 16'sd 19612 * $signed(input_fmap_121[143:128]);

logic signed [31:0] dw_conv_mac_122;
assign dw_conv_mac_122 = 
	 16'sd 29316 * $signed(input_fmap_122[15:0]) +
	 16'sd 27369 * $signed(input_fmap_122[31:16]) +
	 16'sd 18835 * $signed(input_fmap_122[47:32]) +
	 14'sd 5973 * $signed(input_fmap_122[63:48]) +
	 15'sd 12083 * $signed(input_fmap_122[79:64]) +
	 14'sd 4584 * $signed(input_fmap_122[95:80]) +
	 16'sd 26367 * $signed(input_fmap_122[111:96]) +
	 14'sd 6480 * $signed(input_fmap_122[127:112]) +
	 15'sd 13634 * $signed(input_fmap_122[143:128]);

logic signed [31:0] dw_conv_mac_123;
assign dw_conv_mac_123 = 
	 16'sd 19335 * $signed(input_fmap_123[15:0]) +
	 16'sd 28450 * $signed(input_fmap_123[31:16]) +
	 16'sd 21481 * $signed(input_fmap_123[47:32]) +
	 16'sd 27678 * $signed(input_fmap_123[63:48]) +
	 16'sd 18187 * $signed(input_fmap_123[79:64]) +
	 16'sd 32722 * $signed(input_fmap_123[95:80]) +
	 15'sd 9153 * $signed(input_fmap_123[111:96]) +
	 13'sd 3425 * $signed(input_fmap_123[127:112]) +
	 14'sd 4223 * $signed(input_fmap_123[143:128]);

logic signed [31:0] dw_conv_mac_124;
assign dw_conv_mac_124 = 
	 15'sd 8319 * $signed(input_fmap_124[15:0]) +
	 14'sd 7755 * $signed(input_fmap_124[31:16]) +
	 11'sd 1002 * $signed(input_fmap_124[47:32]) +
	 16'sd 24823 * $signed(input_fmap_124[63:48]) +
	 14'sd 6853 * $signed(input_fmap_124[79:64]) +
	 16'sd 18080 * $signed(input_fmap_124[95:80]) +
	 16'sd 27124 * $signed(input_fmap_124[111:96]) +
	 16'sd 18256 * $signed(input_fmap_124[127:112]) +
	 16'sd 27876 * $signed(input_fmap_124[143:128]);

logic signed [31:0] dw_conv_mac_125;
assign dw_conv_mac_125 = 
	 16'sd 31767 * $signed(input_fmap_125[15:0]) +
	 16'sd 31784 * $signed(input_fmap_125[31:16]) +
	 15'sd 10325 * $signed(input_fmap_125[47:32]) +
	 16'sd 25304 * $signed(input_fmap_125[63:48]) +
	 16'sd 24581 * $signed(input_fmap_125[79:64]) +
	 15'sd 15236 * $signed(input_fmap_125[95:80]) +
	 16'sd 26605 * $signed(input_fmap_125[111:96]) +
	 14'sd 5412 * $signed(input_fmap_125[127:112]) +
	 13'sd 2875 * $signed(input_fmap_125[143:128]);

logic signed [31:0] dw_conv_mac_126;
assign dw_conv_mac_126 = 
	 16'sd 29299 * $signed(input_fmap_126[15:0]) +
	 16'sd 19151 * $signed(input_fmap_126[31:16]) +
	 16'sd 26949 * $signed(input_fmap_126[47:32]) +
	 14'sd 6108 * $signed(input_fmap_126[63:48]) +
	 15'sd 8794 * $signed(input_fmap_126[79:64]) +
	 15'sd 12041 * $signed(input_fmap_126[95:80]) +
	 15'sd 10920 * $signed(input_fmap_126[111:96]) +
	 15'sd 12135 * $signed(input_fmap_126[127:112]) +
	 15'sd 11384 * $signed(input_fmap_126[143:128]);

logic signed [31:0] dw_conv_mac_127;
assign dw_conv_mac_127 = 
	 15'sd 11538 * $signed(input_fmap_127[15:0]) +
	 16'sd 26770 * $signed(input_fmap_127[31:16]) +
	 13'sd 2692 * $signed(input_fmap_127[47:32]) +
	 16'sd 25271 * $signed(input_fmap_127[63:48]) +
	 16'sd 23802 * $signed(input_fmap_127[79:64]) +
	 15'sd 16159 * $signed(input_fmap_127[95:80]) +
	 16'sd 17371 * $signed(input_fmap_127[111:96]) +
	 16'sd 21991 * $signed(input_fmap_127[127:112]) +
	 14'sd 7272 * $signed(input_fmap_127[143:128]);

logic [31:0] bias_add_0;
assign bias_add_0 = dw_conv_mac_0 + 14'd4915;
logic [31:0] bias_add_1;
assign bias_add_1 = dw_conv_mac_1 + 16'd22577;
logic [31:0] bias_add_2;
assign bias_add_2 = dw_conv_mac_2 + 16'd26933;
logic [31:0] bias_add_3;
assign bias_add_3 = dw_conv_mac_3 + 16'd26490;
logic [31:0] bias_add_4;
assign bias_add_4 = dw_conv_mac_4 + 16'd19138;
logic [31:0] bias_add_5;
assign bias_add_5 = dw_conv_mac_5 + 16'd27085;
logic [31:0] bias_add_6;
assign bias_add_6 = dw_conv_mac_6 + 15'd15864;
logic [31:0] bias_add_7;
assign bias_add_7 = dw_conv_mac_7 + 12'd1922;
logic [31:0] bias_add_8;
assign bias_add_8 = dw_conv_mac_8 + 16'd18709;
logic [31:0] bias_add_9;
assign bias_add_9 = dw_conv_mac_9 + 13'd3600;
logic [31:0] bias_add_10;
assign bias_add_10 = dw_conv_mac_10 + 15'd10593;
logic [31:0] bias_add_11;
assign bias_add_11 = dw_conv_mac_11 + 16'd29704;
logic [31:0] bias_add_12;
assign bias_add_12 = dw_conv_mac_12 + 14'd5183;
logic [31:0] bias_add_13;
assign bias_add_13 = dw_conv_mac_13 + 16'd20290;
logic [31:0] bias_add_14;
assign bias_add_14 = dw_conv_mac_14 + 16'd32563;
logic [31:0] bias_add_15;
assign bias_add_15 = dw_conv_mac_15 + 15'd9612;
logic [31:0] bias_add_16;
assign bias_add_16 = dw_conv_mac_16 + 12'd1058;
logic [31:0] bias_add_17;
assign bias_add_17 = dw_conv_mac_17 + 16'd22032;
logic [31:0] bias_add_18;
assign bias_add_18 = dw_conv_mac_18 + 15'd14138;
logic [31:0] bias_add_19;
assign bias_add_19 = dw_conv_mac_19 + 16'd22323;
logic [31:0] bias_add_20;
assign bias_add_20 = dw_conv_mac_20 + 16'd31949;
logic [31:0] bias_add_21;
assign bias_add_21 = dw_conv_mac_21 + 15'd15612;
logic [31:0] bias_add_22;
assign bias_add_22 = dw_conv_mac_22 + 15'd9864;
logic [31:0] bias_add_23;
assign bias_add_23 = dw_conv_mac_23 + 16'd16844;
logic [31:0] bias_add_24;
assign bias_add_24 = dw_conv_mac_24 + 16'd26454;
logic [31:0] bias_add_25;
assign bias_add_25 = dw_conv_mac_25 + 13'd3370;
logic [31:0] bias_add_26;
assign bias_add_26 = dw_conv_mac_26 + 14'd6756;
logic [31:0] bias_add_27;
assign bias_add_27 = dw_conv_mac_27 + 16'd30841;
logic [31:0] bias_add_28;
assign bias_add_28 = dw_conv_mac_28 + 16'd21413;
logic [31:0] bias_add_29;
assign bias_add_29 = dw_conv_mac_29 + 15'd11049;
logic [31:0] bias_add_30;
assign bias_add_30 = dw_conv_mac_30 + 16'd19884;
logic [31:0] bias_add_31;
assign bias_add_31 = dw_conv_mac_31 + 16'd20768;
logic [31:0] bias_add_32;
assign bias_add_32 = dw_conv_mac_32 + 16'd27062;
logic [31:0] bias_add_33;
assign bias_add_33 = dw_conv_mac_33 + 13'd2360;
logic [31:0] bias_add_34;
assign bias_add_34 = dw_conv_mac_34 + 16'd19081;
logic [31:0] bias_add_35;
assign bias_add_35 = dw_conv_mac_35 + 15'd14395;
logic [31:0] bias_add_36;
assign bias_add_36 = dw_conv_mac_36 + 16'd16947;
logic [31:0] bias_add_37;
assign bias_add_37 = dw_conv_mac_37 + 13'd2813;
logic [31:0] bias_add_38;
assign bias_add_38 = dw_conv_mac_38 + 16'd31469;
logic [31:0] bias_add_39;
assign bias_add_39 = dw_conv_mac_39 + 16'd32307;
logic [31:0] bias_add_40;
assign bias_add_40 = dw_conv_mac_40 + 16'd24869;
logic [31:0] bias_add_41;
assign bias_add_41 = dw_conv_mac_41 + 15'd13405;
logic [31:0] bias_add_42;
assign bias_add_42 = dw_conv_mac_42 + 15'd12490;
logic [31:0] bias_add_43;
assign bias_add_43 = dw_conv_mac_43 + 16'd30606;
logic [31:0] bias_add_44;
assign bias_add_44 = dw_conv_mac_44 + 15'd14763;
logic [31:0] bias_add_45;
assign bias_add_45 = dw_conv_mac_45 + 15'd13627;
logic [31:0] bias_add_46;
assign bias_add_46 = dw_conv_mac_46 + 16'd30895;
logic [31:0] bias_add_47;
assign bias_add_47 = dw_conv_mac_47 + 16'd26131;
logic [31:0] bias_add_48;
assign bias_add_48 = dw_conv_mac_48 + 14'd4264;
logic [31:0] bias_add_49;
assign bias_add_49 = dw_conv_mac_49 + 14'd7821;
logic [31:0] bias_add_50;
assign bias_add_50 = dw_conv_mac_50 + 13'd2145;
logic [31:0] bias_add_51;
assign bias_add_51 = dw_conv_mac_51 + 15'd15776;
logic [31:0] bias_add_52;
assign bias_add_52 = dw_conv_mac_52 + 15'd12531;
logic [31:0] bias_add_53;
assign bias_add_53 = dw_conv_mac_53 + 16'd28262;
logic [31:0] bias_add_54;
assign bias_add_54 = dw_conv_mac_54 + 16'd26369;
logic [31:0] bias_add_55;
assign bias_add_55 = dw_conv_mac_55 + 16'd25691;
logic [31:0] bias_add_56;
assign bias_add_56 = dw_conv_mac_56 + 11'd856;
logic [31:0] bias_add_57;
assign bias_add_57 = dw_conv_mac_57 + 16'd26823;
logic [31:0] bias_add_58;
assign bias_add_58 = dw_conv_mac_58 + 16'd22480;
logic [31:0] bias_add_59;
assign bias_add_59 = dw_conv_mac_59 + 14'd6049;
logic [31:0] bias_add_60;
assign bias_add_60 = dw_conv_mac_60 + 16'd32110;
logic [31:0] bias_add_61;
assign bias_add_61 = dw_conv_mac_61 + 14'd4292;
logic [31:0] bias_add_62;
assign bias_add_62 = dw_conv_mac_62 + 15'd13697;
logic [31:0] bias_add_63;
assign bias_add_63 = dw_conv_mac_63 + 15'd8785;
logic [31:0] bias_add_64;
assign bias_add_64 = dw_conv_mac_64 + 15'd11987;
logic [31:0] bias_add_65;
assign bias_add_65 = dw_conv_mac_65 + 16'd18093;
logic [31:0] bias_add_66;
assign bias_add_66 = dw_conv_mac_66 + 15'd12073;
logic [31:0] bias_add_67;
assign bias_add_67 = dw_conv_mac_67 + 16'd20016;
logic [31:0] bias_add_68;
assign bias_add_68 = dw_conv_mac_68 + 14'd5767;
logic [31:0] bias_add_69;
assign bias_add_69 = dw_conv_mac_69 + 14'd6061;
logic [31:0] bias_add_70;
assign bias_add_70 = dw_conv_mac_70 + 15'd13898;
logic [31:0] bias_add_71;
assign bias_add_71 = dw_conv_mac_71 + 15'd8550;
logic [31:0] bias_add_72;
assign bias_add_72 = dw_conv_mac_72 + 14'd4371;
logic [31:0] bias_add_73;
assign bias_add_73 = dw_conv_mac_73 + 12'd1487;
logic [31:0] bias_add_74;
assign bias_add_74 = dw_conv_mac_74 + 14'd4475;
logic [31:0] bias_add_75;
assign bias_add_75 = dw_conv_mac_75 + 16'd20559;
logic [31:0] bias_add_76;
assign bias_add_76 = dw_conv_mac_76 + 13'd2297;
logic [31:0] bias_add_77;
assign bias_add_77 = dw_conv_mac_77 + 16'd30294;
logic [31:0] bias_add_78;
assign bias_add_78 = dw_conv_mac_78 + 15'd13332;
logic [31:0] bias_add_79;
assign bias_add_79 = dw_conv_mac_79 + 16'd19132;
logic [31:0] bias_add_80;
assign bias_add_80 = dw_conv_mac_80 + 16'd18348;
logic [31:0] bias_add_81;
assign bias_add_81 = dw_conv_mac_81 + 15'd13214;
logic [31:0] bias_add_82;
assign bias_add_82 = dw_conv_mac_82 + 14'd4133;
logic [31:0] bias_add_83;
assign bias_add_83 = dw_conv_mac_83 + 16'd18721;
logic [31:0] bias_add_84;
assign bias_add_84 = dw_conv_mac_84 + 14'd4917;
logic [31:0] bias_add_85;
assign bias_add_85 = dw_conv_mac_85 + 16'd24504;
logic [31:0] bias_add_86;
assign bias_add_86 = dw_conv_mac_86 + 16'd23457;
logic [31:0] bias_add_87;
assign bias_add_87 = dw_conv_mac_87 + 15'd14171;
logic [31:0] bias_add_88;
assign bias_add_88 = dw_conv_mac_88 + 16'd31794;
logic [31:0] bias_add_89;
assign bias_add_89 = dw_conv_mac_89 + 13'd2823;
logic [31:0] bias_add_90;
assign bias_add_90 = dw_conv_mac_90 + 15'd10694;
logic [31:0] bias_add_91;
assign bias_add_91 = dw_conv_mac_91 + 16'd20540;
logic [31:0] bias_add_92;
assign bias_add_92 = dw_conv_mac_92 + 16'd19190;
logic [31:0] bias_add_93;
assign bias_add_93 = dw_conv_mac_93 + 16'd18895;
logic [31:0] bias_add_94;
assign bias_add_94 = dw_conv_mac_94 + 16'd19683;
logic [31:0] bias_add_95;
assign bias_add_95 = dw_conv_mac_95 + 16'd24804;
logic [31:0] bias_add_96;
assign bias_add_96 = dw_conv_mac_96 + 15'd14104;
logic [31:0] bias_add_97;
assign bias_add_97 = dw_conv_mac_97 + 16'd25730;
logic [31:0] bias_add_98;
assign bias_add_98 = dw_conv_mac_98 + 13'd2294;
logic [31:0] bias_add_99;
assign bias_add_99 = dw_conv_mac_99 + 16'd18184;
logic [31:0] bias_add_100;
assign bias_add_100 = dw_conv_mac_100 + 16'd24963;
logic [31:0] bias_add_101;
assign bias_add_101 = dw_conv_mac_101 + 14'd6875;
logic [31:0] bias_add_102;
assign bias_add_102 = dw_conv_mac_102 + 16'd26935;
logic [31:0] bias_add_103;
assign bias_add_103 = dw_conv_mac_103 + 12'd1447;
logic [31:0] bias_add_104;
assign bias_add_104 = dw_conv_mac_104 + 16'd30623;
logic [31:0] bias_add_105;
assign bias_add_105 = dw_conv_mac_105 + 13'd3817;
logic [31:0] bias_add_106;
assign bias_add_106 = dw_conv_mac_106 + 16'd23130;
logic [31:0] bias_add_107;
assign bias_add_107 = dw_conv_mac_107 + 16'd29276;
logic [31:0] bias_add_108;
assign bias_add_108 = dw_conv_mac_108 + 16'd22750;
logic [31:0] bias_add_109;
assign bias_add_109 = dw_conv_mac_109 + 14'd7717;
logic [31:0] bias_add_110;
assign bias_add_110 = dw_conv_mac_110 + 16'd32698;
logic [31:0] bias_add_111;
assign bias_add_111 = dw_conv_mac_111 + 14'd6047;
logic [31:0] bias_add_112;
assign bias_add_112 = dw_conv_mac_112 + 16'd18326;
logic [31:0] bias_add_113;
assign bias_add_113 = dw_conv_mac_113 + 16'd25387;
logic [31:0] bias_add_114;
assign bias_add_114 = dw_conv_mac_114 + 15'd8368;
logic [31:0] bias_add_115;
assign bias_add_115 = dw_conv_mac_115 + 16'd30525;
logic [31:0] bias_add_116;
assign bias_add_116 = dw_conv_mac_116 + 13'd3751;
logic [31:0] bias_add_117;
assign bias_add_117 = dw_conv_mac_117 + 16'd29295;
logic [31:0] bias_add_118;
assign bias_add_118 = dw_conv_mac_118 + 16'd31618;
logic [31:0] bias_add_119;
assign bias_add_119 = dw_conv_mac_119 + 16'd26427;
logic [31:0] bias_add_120;
assign bias_add_120 = dw_conv_mac_120 + 16'd31316;
logic [31:0] bias_add_121;
assign bias_add_121 = dw_conv_mac_121 + 16'd17366;
logic [31:0] bias_add_122;
assign bias_add_122 = dw_conv_mac_122 + 15'd14297;
logic [31:0] bias_add_123;
assign bias_add_123 = dw_conv_mac_123 + 14'd6309;
logic [31:0] bias_add_124;
assign bias_add_124 = dw_conv_mac_124 + 15'd12649;
logic [31:0] bias_add_125;
assign bias_add_125 = dw_conv_mac_125 + 16'd22170;
logic [31:0] bias_add_126;
assign bias_add_126 = dw_conv_mac_126 + 16'd22554;
logic [31:0] bias_add_127;
assign bias_add_127 = dw_conv_mac_127 + 15'd10382;

logic [15:0] relu_0;
assign relu_0[15:0] = (bias_add_0[31]==0) ? ((bias_add_0<3'd6) ? {{bias_add_0[31],bias_add_0[29:15]}} :'d6) : '0;
logic [15:0] relu_1;
assign relu_1[15:0] = (bias_add_1[31]==0) ? ((bias_add_1<3'd6) ? {{bias_add_1[31],bias_add_1[29:15]}} :'d6) : '0;
logic [15:0] relu_2;
assign relu_2[15:0] = (bias_add_2[31]==0) ? ((bias_add_2<3'd6) ? {{bias_add_2[31],bias_add_2[29:15]}} :'d6) : '0;
logic [15:0] relu_3;
assign relu_3[15:0] = (bias_add_3[31]==0) ? ((bias_add_3<3'd6) ? {{bias_add_3[31],bias_add_3[29:15]}} :'d6) : '0;
logic [15:0] relu_4;
assign relu_4[15:0] = (bias_add_4[31]==0) ? ((bias_add_4<3'd6) ? {{bias_add_4[31],bias_add_4[29:15]}} :'d6) : '0;
logic [15:0] relu_5;
assign relu_5[15:0] = (bias_add_5[31]==0) ? ((bias_add_5<3'd6) ? {{bias_add_5[31],bias_add_5[29:15]}} :'d6) : '0;
logic [15:0] relu_6;
assign relu_6[15:0] = (bias_add_6[31]==0) ? ((bias_add_6<3'd6) ? {{bias_add_6[31],bias_add_6[29:15]}} :'d6) : '0;
logic [15:0] relu_7;
assign relu_7[15:0] = (bias_add_7[31]==0) ? ((bias_add_7<3'd6) ? {{bias_add_7[31],bias_add_7[29:15]}} :'d6) : '0;
logic [15:0] relu_8;
assign relu_8[15:0] = (bias_add_8[31]==0) ? ((bias_add_8<3'd6) ? {{bias_add_8[31],bias_add_8[29:15]}} :'d6) : '0;
logic [15:0] relu_9;
assign relu_9[15:0] = (bias_add_9[31]==0) ? ((bias_add_9<3'd6) ? {{bias_add_9[31],bias_add_9[29:15]}} :'d6) : '0;
logic [15:0] relu_10;
assign relu_10[15:0] = (bias_add_10[31]==0) ? ((bias_add_10<3'd6) ? {{bias_add_10[31],bias_add_10[29:15]}} :'d6) : '0;
logic [15:0] relu_11;
assign relu_11[15:0] = (bias_add_11[31]==0) ? ((bias_add_11<3'd6) ? {{bias_add_11[31],bias_add_11[29:15]}} :'d6) : '0;
logic [15:0] relu_12;
assign relu_12[15:0] = (bias_add_12[31]==0) ? ((bias_add_12<3'd6) ? {{bias_add_12[31],bias_add_12[29:15]}} :'d6) : '0;
logic [15:0] relu_13;
assign relu_13[15:0] = (bias_add_13[31]==0) ? ((bias_add_13<3'd6) ? {{bias_add_13[31],bias_add_13[29:15]}} :'d6) : '0;
logic [15:0] relu_14;
assign relu_14[15:0] = (bias_add_14[31]==0) ? ((bias_add_14<3'd6) ? {{bias_add_14[31],bias_add_14[29:15]}} :'d6) : '0;
logic [15:0] relu_15;
assign relu_15[15:0] = (bias_add_15[31]==0) ? ((bias_add_15<3'd6) ? {{bias_add_15[31],bias_add_15[29:15]}} :'d6) : '0;
logic [15:0] relu_16;
assign relu_16[15:0] = (bias_add_16[31]==0) ? ((bias_add_16<3'd6) ? {{bias_add_16[31],bias_add_16[29:15]}} :'d6) : '0;
logic [15:0] relu_17;
assign relu_17[15:0] = (bias_add_17[31]==0) ? ((bias_add_17<3'd6) ? {{bias_add_17[31],bias_add_17[29:15]}} :'d6) : '0;
logic [15:0] relu_18;
assign relu_18[15:0] = (bias_add_18[31]==0) ? ((bias_add_18<3'd6) ? {{bias_add_18[31],bias_add_18[29:15]}} :'d6) : '0;
logic [15:0] relu_19;
assign relu_19[15:0] = (bias_add_19[31]==0) ? ((bias_add_19<3'd6) ? {{bias_add_19[31],bias_add_19[29:15]}} :'d6) : '0;
logic [15:0] relu_20;
assign relu_20[15:0] = (bias_add_20[31]==0) ? ((bias_add_20<3'd6) ? {{bias_add_20[31],bias_add_20[29:15]}} :'d6) : '0;
logic [15:0] relu_21;
assign relu_21[15:0] = (bias_add_21[31]==0) ? ((bias_add_21<3'd6) ? {{bias_add_21[31],bias_add_21[29:15]}} :'d6) : '0;
logic [15:0] relu_22;
assign relu_22[15:0] = (bias_add_22[31]==0) ? ((bias_add_22<3'd6) ? {{bias_add_22[31],bias_add_22[29:15]}} :'d6) : '0;
logic [15:0] relu_23;
assign relu_23[15:0] = (bias_add_23[31]==0) ? ((bias_add_23<3'd6) ? {{bias_add_23[31],bias_add_23[29:15]}} :'d6) : '0;
logic [15:0] relu_24;
assign relu_24[15:0] = (bias_add_24[31]==0) ? ((bias_add_24<3'd6) ? {{bias_add_24[31],bias_add_24[29:15]}} :'d6) : '0;
logic [15:0] relu_25;
assign relu_25[15:0] = (bias_add_25[31]==0) ? ((bias_add_25<3'd6) ? {{bias_add_25[31],bias_add_25[29:15]}} :'d6) : '0;
logic [15:0] relu_26;
assign relu_26[15:0] = (bias_add_26[31]==0) ? ((bias_add_26<3'd6) ? {{bias_add_26[31],bias_add_26[29:15]}} :'d6) : '0;
logic [15:0] relu_27;
assign relu_27[15:0] = (bias_add_27[31]==0) ? ((bias_add_27<3'd6) ? {{bias_add_27[31],bias_add_27[29:15]}} :'d6) : '0;
logic [15:0] relu_28;
assign relu_28[15:0] = (bias_add_28[31]==0) ? ((bias_add_28<3'd6) ? {{bias_add_28[31],bias_add_28[29:15]}} :'d6) : '0;
logic [15:0] relu_29;
assign relu_29[15:0] = (bias_add_29[31]==0) ? ((bias_add_29<3'd6) ? {{bias_add_29[31],bias_add_29[29:15]}} :'d6) : '0;
logic [15:0] relu_30;
assign relu_30[15:0] = (bias_add_30[31]==0) ? ((bias_add_30<3'd6) ? {{bias_add_30[31],bias_add_30[29:15]}} :'d6) : '0;
logic [15:0] relu_31;
assign relu_31[15:0] = (bias_add_31[31]==0) ? ((bias_add_31<3'd6) ? {{bias_add_31[31],bias_add_31[29:15]}} :'d6) : '0;
logic [15:0] relu_32;
assign relu_32[15:0] = (bias_add_32[31]==0) ? ((bias_add_32<3'd6) ? {{bias_add_32[31],bias_add_32[29:15]}} :'d6) : '0;
logic [15:0] relu_33;
assign relu_33[15:0] = (bias_add_33[31]==0) ? ((bias_add_33<3'd6) ? {{bias_add_33[31],bias_add_33[29:15]}} :'d6) : '0;
logic [15:0] relu_34;
assign relu_34[15:0] = (bias_add_34[31]==0) ? ((bias_add_34<3'd6) ? {{bias_add_34[31],bias_add_34[29:15]}} :'d6) : '0;
logic [15:0] relu_35;
assign relu_35[15:0] = (bias_add_35[31]==0) ? ((bias_add_35<3'd6) ? {{bias_add_35[31],bias_add_35[29:15]}} :'d6) : '0;
logic [15:0] relu_36;
assign relu_36[15:0] = (bias_add_36[31]==0) ? ((bias_add_36<3'd6) ? {{bias_add_36[31],bias_add_36[29:15]}} :'d6) : '0;
logic [15:0] relu_37;
assign relu_37[15:0] = (bias_add_37[31]==0) ? ((bias_add_37<3'd6) ? {{bias_add_37[31],bias_add_37[29:15]}} :'d6) : '0;
logic [15:0] relu_38;
assign relu_38[15:0] = (bias_add_38[31]==0) ? ((bias_add_38<3'd6) ? {{bias_add_38[31],bias_add_38[29:15]}} :'d6) : '0;
logic [15:0] relu_39;
assign relu_39[15:0] = (bias_add_39[31]==0) ? ((bias_add_39<3'd6) ? {{bias_add_39[31],bias_add_39[29:15]}} :'d6) : '0;
logic [15:0] relu_40;
assign relu_40[15:0] = (bias_add_40[31]==0) ? ((bias_add_40<3'd6) ? {{bias_add_40[31],bias_add_40[29:15]}} :'d6) : '0;
logic [15:0] relu_41;
assign relu_41[15:0] = (bias_add_41[31]==0) ? ((bias_add_41<3'd6) ? {{bias_add_41[31],bias_add_41[29:15]}} :'d6) : '0;
logic [15:0] relu_42;
assign relu_42[15:0] = (bias_add_42[31]==0) ? ((bias_add_42<3'd6) ? {{bias_add_42[31],bias_add_42[29:15]}} :'d6) : '0;
logic [15:0] relu_43;
assign relu_43[15:0] = (bias_add_43[31]==0) ? ((bias_add_43<3'd6) ? {{bias_add_43[31],bias_add_43[29:15]}} :'d6) : '0;
logic [15:0] relu_44;
assign relu_44[15:0] = (bias_add_44[31]==0) ? ((bias_add_44<3'd6) ? {{bias_add_44[31],bias_add_44[29:15]}} :'d6) : '0;
logic [15:0] relu_45;
assign relu_45[15:0] = (bias_add_45[31]==0) ? ((bias_add_45<3'd6) ? {{bias_add_45[31],bias_add_45[29:15]}} :'d6) : '0;
logic [15:0] relu_46;
assign relu_46[15:0] = (bias_add_46[31]==0) ? ((bias_add_46<3'd6) ? {{bias_add_46[31],bias_add_46[29:15]}} :'d6) : '0;
logic [15:0] relu_47;
assign relu_47[15:0] = (bias_add_47[31]==0) ? ((bias_add_47<3'd6) ? {{bias_add_47[31],bias_add_47[29:15]}} :'d6) : '0;
logic [15:0] relu_48;
assign relu_48[15:0] = (bias_add_48[31]==0) ? ((bias_add_48<3'd6) ? {{bias_add_48[31],bias_add_48[29:15]}} :'d6) : '0;
logic [15:0] relu_49;
assign relu_49[15:0] = (bias_add_49[31]==0) ? ((bias_add_49<3'd6) ? {{bias_add_49[31],bias_add_49[29:15]}} :'d6) : '0;
logic [15:0] relu_50;
assign relu_50[15:0] = (bias_add_50[31]==0) ? ((bias_add_50<3'd6) ? {{bias_add_50[31],bias_add_50[29:15]}} :'d6) : '0;
logic [15:0] relu_51;
assign relu_51[15:0] = (bias_add_51[31]==0) ? ((bias_add_51<3'd6) ? {{bias_add_51[31],bias_add_51[29:15]}} :'d6) : '0;
logic [15:0] relu_52;
assign relu_52[15:0] = (bias_add_52[31]==0) ? ((bias_add_52<3'd6) ? {{bias_add_52[31],bias_add_52[29:15]}} :'d6) : '0;
logic [15:0] relu_53;
assign relu_53[15:0] = (bias_add_53[31]==0) ? ((bias_add_53<3'd6) ? {{bias_add_53[31],bias_add_53[29:15]}} :'d6) : '0;
logic [15:0] relu_54;
assign relu_54[15:0] = (bias_add_54[31]==0) ? ((bias_add_54<3'd6) ? {{bias_add_54[31],bias_add_54[29:15]}} :'d6) : '0;
logic [15:0] relu_55;
assign relu_55[15:0] = (bias_add_55[31]==0) ? ((bias_add_55<3'd6) ? {{bias_add_55[31],bias_add_55[29:15]}} :'d6) : '0;
logic [15:0] relu_56;
assign relu_56[15:0] = (bias_add_56[31]==0) ? ((bias_add_56<3'd6) ? {{bias_add_56[31],bias_add_56[29:15]}} :'d6) : '0;
logic [15:0] relu_57;
assign relu_57[15:0] = (bias_add_57[31]==0) ? ((bias_add_57<3'd6) ? {{bias_add_57[31],bias_add_57[29:15]}} :'d6) : '0;
logic [15:0] relu_58;
assign relu_58[15:0] = (bias_add_58[31]==0) ? ((bias_add_58<3'd6) ? {{bias_add_58[31],bias_add_58[29:15]}} :'d6) : '0;
logic [15:0] relu_59;
assign relu_59[15:0] = (bias_add_59[31]==0) ? ((bias_add_59<3'd6) ? {{bias_add_59[31],bias_add_59[29:15]}} :'d6) : '0;
logic [15:0] relu_60;
assign relu_60[15:0] = (bias_add_60[31]==0) ? ((bias_add_60<3'd6) ? {{bias_add_60[31],bias_add_60[29:15]}} :'d6) : '0;
logic [15:0] relu_61;
assign relu_61[15:0] = (bias_add_61[31]==0) ? ((bias_add_61<3'd6) ? {{bias_add_61[31],bias_add_61[29:15]}} :'d6) : '0;
logic [15:0] relu_62;
assign relu_62[15:0] = (bias_add_62[31]==0) ? ((bias_add_62<3'd6) ? {{bias_add_62[31],bias_add_62[29:15]}} :'d6) : '0;
logic [15:0] relu_63;
assign relu_63[15:0] = (bias_add_63[31]==0) ? ((bias_add_63<3'd6) ? {{bias_add_63[31],bias_add_63[29:15]}} :'d6) : '0;
logic [15:0] relu_64;
assign relu_64[15:0] = (bias_add_64[31]==0) ? ((bias_add_64<3'd6) ? {{bias_add_64[31],bias_add_64[29:15]}} :'d6) : '0;
logic [15:0] relu_65;
assign relu_65[15:0] = (bias_add_65[31]==0) ? ((bias_add_65<3'd6) ? {{bias_add_65[31],bias_add_65[29:15]}} :'d6) : '0;
logic [15:0] relu_66;
assign relu_66[15:0] = (bias_add_66[31]==0) ? ((bias_add_66<3'd6) ? {{bias_add_66[31],bias_add_66[29:15]}} :'d6) : '0;
logic [15:0] relu_67;
assign relu_67[15:0] = (bias_add_67[31]==0) ? ((bias_add_67<3'd6) ? {{bias_add_67[31],bias_add_67[29:15]}} :'d6) : '0;
logic [15:0] relu_68;
assign relu_68[15:0] = (bias_add_68[31]==0) ? ((bias_add_68<3'd6) ? {{bias_add_68[31],bias_add_68[29:15]}} :'d6) : '0;
logic [15:0] relu_69;
assign relu_69[15:0] = (bias_add_69[31]==0) ? ((bias_add_69<3'd6) ? {{bias_add_69[31],bias_add_69[29:15]}} :'d6) : '0;
logic [15:0] relu_70;
assign relu_70[15:0] = (bias_add_70[31]==0) ? ((bias_add_70<3'd6) ? {{bias_add_70[31],bias_add_70[29:15]}} :'d6) : '0;
logic [15:0] relu_71;
assign relu_71[15:0] = (bias_add_71[31]==0) ? ((bias_add_71<3'd6) ? {{bias_add_71[31],bias_add_71[29:15]}} :'d6) : '0;
logic [15:0] relu_72;
assign relu_72[15:0] = (bias_add_72[31]==0) ? ((bias_add_72<3'd6) ? {{bias_add_72[31],bias_add_72[29:15]}} :'d6) : '0;
logic [15:0] relu_73;
assign relu_73[15:0] = (bias_add_73[31]==0) ? ((bias_add_73<3'd6) ? {{bias_add_73[31],bias_add_73[29:15]}} :'d6) : '0;
logic [15:0] relu_74;
assign relu_74[15:0] = (bias_add_74[31]==0) ? ((bias_add_74<3'd6) ? {{bias_add_74[31],bias_add_74[29:15]}} :'d6) : '0;
logic [15:0] relu_75;
assign relu_75[15:0] = (bias_add_75[31]==0) ? ((bias_add_75<3'd6) ? {{bias_add_75[31],bias_add_75[29:15]}} :'d6) : '0;
logic [15:0] relu_76;
assign relu_76[15:0] = (bias_add_76[31]==0) ? ((bias_add_76<3'd6) ? {{bias_add_76[31],bias_add_76[29:15]}} :'d6) : '0;
logic [15:0] relu_77;
assign relu_77[15:0] = (bias_add_77[31]==0) ? ((bias_add_77<3'd6) ? {{bias_add_77[31],bias_add_77[29:15]}} :'d6) : '0;
logic [15:0] relu_78;
assign relu_78[15:0] = (bias_add_78[31]==0) ? ((bias_add_78<3'd6) ? {{bias_add_78[31],bias_add_78[29:15]}} :'d6) : '0;
logic [15:0] relu_79;
assign relu_79[15:0] = (bias_add_79[31]==0) ? ((bias_add_79<3'd6) ? {{bias_add_79[31],bias_add_79[29:15]}} :'d6) : '0;
logic [15:0] relu_80;
assign relu_80[15:0] = (bias_add_80[31]==0) ? ((bias_add_80<3'd6) ? {{bias_add_80[31],bias_add_80[29:15]}} :'d6) : '0;
logic [15:0] relu_81;
assign relu_81[15:0] = (bias_add_81[31]==0) ? ((bias_add_81<3'd6) ? {{bias_add_81[31],bias_add_81[29:15]}} :'d6) : '0;
logic [15:0] relu_82;
assign relu_82[15:0] = (bias_add_82[31]==0) ? ((bias_add_82<3'd6) ? {{bias_add_82[31],bias_add_82[29:15]}} :'d6) : '0;
logic [15:0] relu_83;
assign relu_83[15:0] = (bias_add_83[31]==0) ? ((bias_add_83<3'd6) ? {{bias_add_83[31],bias_add_83[29:15]}} :'d6) : '0;
logic [15:0] relu_84;
assign relu_84[15:0] = (bias_add_84[31]==0) ? ((bias_add_84<3'd6) ? {{bias_add_84[31],bias_add_84[29:15]}} :'d6) : '0;
logic [15:0] relu_85;
assign relu_85[15:0] = (bias_add_85[31]==0) ? ((bias_add_85<3'd6) ? {{bias_add_85[31],bias_add_85[29:15]}} :'d6) : '0;
logic [15:0] relu_86;
assign relu_86[15:0] = (bias_add_86[31]==0) ? ((bias_add_86<3'd6) ? {{bias_add_86[31],bias_add_86[29:15]}} :'d6) : '0;
logic [15:0] relu_87;
assign relu_87[15:0] = (bias_add_87[31]==0) ? ((bias_add_87<3'd6) ? {{bias_add_87[31],bias_add_87[29:15]}} :'d6) : '0;
logic [15:0] relu_88;
assign relu_88[15:0] = (bias_add_88[31]==0) ? ((bias_add_88<3'd6) ? {{bias_add_88[31],bias_add_88[29:15]}} :'d6) : '0;
logic [15:0] relu_89;
assign relu_89[15:0] = (bias_add_89[31]==0) ? ((bias_add_89<3'd6) ? {{bias_add_89[31],bias_add_89[29:15]}} :'d6) : '0;
logic [15:0] relu_90;
assign relu_90[15:0] = (bias_add_90[31]==0) ? ((bias_add_90<3'd6) ? {{bias_add_90[31],bias_add_90[29:15]}} :'d6) : '0;
logic [15:0] relu_91;
assign relu_91[15:0] = (bias_add_91[31]==0) ? ((bias_add_91<3'd6) ? {{bias_add_91[31],bias_add_91[29:15]}} :'d6) : '0;
logic [15:0] relu_92;
assign relu_92[15:0] = (bias_add_92[31]==0) ? ((bias_add_92<3'd6) ? {{bias_add_92[31],bias_add_92[29:15]}} :'d6) : '0;
logic [15:0] relu_93;
assign relu_93[15:0] = (bias_add_93[31]==0) ? ((bias_add_93<3'd6) ? {{bias_add_93[31],bias_add_93[29:15]}} :'d6) : '0;
logic [15:0] relu_94;
assign relu_94[15:0] = (bias_add_94[31]==0) ? ((bias_add_94<3'd6) ? {{bias_add_94[31],bias_add_94[29:15]}} :'d6) : '0;
logic [15:0] relu_95;
assign relu_95[15:0] = (bias_add_95[31]==0) ? ((bias_add_95<3'd6) ? {{bias_add_95[31],bias_add_95[29:15]}} :'d6) : '0;
logic [15:0] relu_96;
assign relu_96[15:0] = (bias_add_96[31]==0) ? ((bias_add_96<3'd6) ? {{bias_add_96[31],bias_add_96[29:15]}} :'d6) : '0;
logic [15:0] relu_97;
assign relu_97[15:0] = (bias_add_97[31]==0) ? ((bias_add_97<3'd6) ? {{bias_add_97[31],bias_add_97[29:15]}} :'d6) : '0;
logic [15:0] relu_98;
assign relu_98[15:0] = (bias_add_98[31]==0) ? ((bias_add_98<3'd6) ? {{bias_add_98[31],bias_add_98[29:15]}} :'d6) : '0;
logic [15:0] relu_99;
assign relu_99[15:0] = (bias_add_99[31]==0) ? ((bias_add_99<3'd6) ? {{bias_add_99[31],bias_add_99[29:15]}} :'d6) : '0;
logic [15:0] relu_100;
assign relu_100[15:0] = (bias_add_100[31]==0) ? ((bias_add_100<3'd6) ? {{bias_add_100[31],bias_add_100[29:15]}} :'d6) : '0;
logic [15:0] relu_101;
assign relu_101[15:0] = (bias_add_101[31]==0) ? ((bias_add_101<3'd6) ? {{bias_add_101[31],bias_add_101[29:15]}} :'d6) : '0;
logic [15:0] relu_102;
assign relu_102[15:0] = (bias_add_102[31]==0) ? ((bias_add_102<3'd6) ? {{bias_add_102[31],bias_add_102[29:15]}} :'d6) : '0;
logic [15:0] relu_103;
assign relu_103[15:0] = (bias_add_103[31]==0) ? ((bias_add_103<3'd6) ? {{bias_add_103[31],bias_add_103[29:15]}} :'d6) : '0;
logic [15:0] relu_104;
assign relu_104[15:0] = (bias_add_104[31]==0) ? ((bias_add_104<3'd6) ? {{bias_add_104[31],bias_add_104[29:15]}} :'d6) : '0;
logic [15:0] relu_105;
assign relu_105[15:0] = (bias_add_105[31]==0) ? ((bias_add_105<3'd6) ? {{bias_add_105[31],bias_add_105[29:15]}} :'d6) : '0;
logic [15:0] relu_106;
assign relu_106[15:0] = (bias_add_106[31]==0) ? ((bias_add_106<3'd6) ? {{bias_add_106[31],bias_add_106[29:15]}} :'d6) : '0;
logic [15:0] relu_107;
assign relu_107[15:0] = (bias_add_107[31]==0) ? ((bias_add_107<3'd6) ? {{bias_add_107[31],bias_add_107[29:15]}} :'d6) : '0;
logic [15:0] relu_108;
assign relu_108[15:0] = (bias_add_108[31]==0) ? ((bias_add_108<3'd6) ? {{bias_add_108[31],bias_add_108[29:15]}} :'d6) : '0;
logic [15:0] relu_109;
assign relu_109[15:0] = (bias_add_109[31]==0) ? ((bias_add_109<3'd6) ? {{bias_add_109[31],bias_add_109[29:15]}} :'d6) : '0;
logic [15:0] relu_110;
assign relu_110[15:0] = (bias_add_110[31]==0) ? ((bias_add_110<3'd6) ? {{bias_add_110[31],bias_add_110[29:15]}} :'d6) : '0;
logic [15:0] relu_111;
assign relu_111[15:0] = (bias_add_111[31]==0) ? ((bias_add_111<3'd6) ? {{bias_add_111[31],bias_add_111[29:15]}} :'d6) : '0;
logic [15:0] relu_112;
assign relu_112[15:0] = (bias_add_112[31]==0) ? ((bias_add_112<3'd6) ? {{bias_add_112[31],bias_add_112[29:15]}} :'d6) : '0;
logic [15:0] relu_113;
assign relu_113[15:0] = (bias_add_113[31]==0) ? ((bias_add_113<3'd6) ? {{bias_add_113[31],bias_add_113[29:15]}} :'d6) : '0;
logic [15:0] relu_114;
assign relu_114[15:0] = (bias_add_114[31]==0) ? ((bias_add_114<3'd6) ? {{bias_add_114[31],bias_add_114[29:15]}} :'d6) : '0;
logic [15:0] relu_115;
assign relu_115[15:0] = (bias_add_115[31]==0) ? ((bias_add_115<3'd6) ? {{bias_add_115[31],bias_add_115[29:15]}} :'d6) : '0;
logic [15:0] relu_116;
assign relu_116[15:0] = (bias_add_116[31]==0) ? ((bias_add_116<3'd6) ? {{bias_add_116[31],bias_add_116[29:15]}} :'d6) : '0;
logic [15:0] relu_117;
assign relu_117[15:0] = (bias_add_117[31]==0) ? ((bias_add_117<3'd6) ? {{bias_add_117[31],bias_add_117[29:15]}} :'d6) : '0;
logic [15:0] relu_118;
assign relu_118[15:0] = (bias_add_118[31]==0) ? ((bias_add_118<3'd6) ? {{bias_add_118[31],bias_add_118[29:15]}} :'d6) : '0;
logic [15:0] relu_119;
assign relu_119[15:0] = (bias_add_119[31]==0) ? ((bias_add_119<3'd6) ? {{bias_add_119[31],bias_add_119[29:15]}} :'d6) : '0;
logic [15:0] relu_120;
assign relu_120[15:0] = (bias_add_120[31]==0) ? ((bias_add_120<3'd6) ? {{bias_add_120[31],bias_add_120[29:15]}} :'d6) : '0;
logic [15:0] relu_121;
assign relu_121[15:0] = (bias_add_121[31]==0) ? ((bias_add_121<3'd6) ? {{bias_add_121[31],bias_add_121[29:15]}} :'d6) : '0;
logic [15:0] relu_122;
assign relu_122[15:0] = (bias_add_122[31]==0) ? ((bias_add_122<3'd6) ? {{bias_add_122[31],bias_add_122[29:15]}} :'d6) : '0;
logic [15:0] relu_123;
assign relu_123[15:0] = (bias_add_123[31]==0) ? ((bias_add_123<3'd6) ? {{bias_add_123[31],bias_add_123[29:15]}} :'d6) : '0;
logic [15:0] relu_124;
assign relu_124[15:0] = (bias_add_124[31]==0) ? ((bias_add_124<3'd6) ? {{bias_add_124[31],bias_add_124[29:15]}} :'d6) : '0;
logic [15:0] relu_125;
assign relu_125[15:0] = (bias_add_125[31]==0) ? ((bias_add_125<3'd6) ? {{bias_add_125[31],bias_add_125[29:15]}} :'d6) : '0;
logic [15:0] relu_126;
assign relu_126[15:0] = (bias_add_126[31]==0) ? ((bias_add_126<3'd6) ? {{bias_add_126[31],bias_add_126[29:15]}} :'d6) : '0;
logic [15:0] relu_127;
assign relu_127[15:0] = (bias_add_127[31]==0) ? ((bias_add_127<3'd6) ? {{bias_add_127[31],bias_add_127[29:15]}} :'d6) : '0;

assign output_act = {
	relu_127,
	relu_126,
	relu_125,
	relu_124,
	relu_123,
	relu_122,
	relu_121,
	relu_120,
	relu_119,
	relu_118,
	relu_117,
	relu_116,
	relu_115,
	relu_114,
	relu_113,
	relu_112,
	relu_111,
	relu_110,
	relu_109,
	relu_108,
	relu_107,
	relu_106,
	relu_105,
	relu_104,
	relu_103,
	relu_102,
	relu_101,
	relu_100,
	relu_99,
	relu_98,
	relu_97,
	relu_96,
	relu_95,
	relu_94,
	relu_93,
	relu_92,
	relu_91,
	relu_90,
	relu_89,
	relu_88,
	relu_87,
	relu_86,
	relu_85,
	relu_84,
	relu_83,
	relu_82,
	relu_81,
	relu_80,
	relu_79,
	relu_78,
	relu_77,
	relu_76,
	relu_75,
	relu_74,
	relu_73,
	relu_72,
	relu_71,
	relu_70,
	relu_69,
	relu_68,
	relu_67,
	relu_66,
	relu_65,
	relu_64,
	relu_63,
	relu_62,
	relu_61,
	relu_60,
	relu_59,
	relu_58,
	relu_57,
	relu_56,
	relu_55,
	relu_54,
	relu_53,
	relu_52,
	relu_51,
	relu_50,
	relu_49,
	relu_48,
	relu_47,
	relu_46,
	relu_45,
	relu_44,
	relu_43,
	relu_42,
	relu_41,
	relu_40,
	relu_39,
	relu_38,
	relu_37,
	relu_36,
	relu_35,
	relu_34,
	relu_33,
	relu_32,
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

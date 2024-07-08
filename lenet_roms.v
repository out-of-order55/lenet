
`include "global.v"


module bias_conv1_rom(
	input							clk,
	input							rst_n,
	input	[6:0]					aa,
	input							cena,
	output reg	[`WD_BIAS*4 -1:0]	qa
	);
	
  wire [4*`WD_BIAS-1:0] weight	 = {	
-12'd199,  12'd715,  -12'd124,  -12'd198
	};

	always @(posedge clk or negedge rst_n)
		if (!rst_n)			qa <= 0;
		else if (!cena)		qa <= weight;	
endmodule

module wieght_conv1_rom(
	input						clk,
	input						rst_n,
	input	[9:0]				aa,
	input						cena,
	output reg	[`WD*4 -1:0]	qa
	);
	

	wire [4*`WD-1:0] weight[0:24]; 
assign weight[0 ]={-8'd48,  -8'd83,   8'd43,  8'd75}; 
assign weight[1 ]={-8'd56,  -8'd72,   8'd16,  8'd69};  
assign weight[2 ]={ 8'd35,  -8'd104, -8'd5,   8'd22};  
assign weight[3 ]={ 8'd86,  -8'd85,  -8'd5,  -8'd41};  
assign weight[4 ]={ 8'd70,  -8'd71,  -8'd35, -8'd80};  

assign weight[5 ]={-8'd117, -8'd117,  8'd51,  8'd56};
assign weight[6 ]={-8'd8,   -8'd85,   8'd7,   8'd91};  
assign weight[7 ]={ 8'd62,  -8'd60,  -8'd4,   8'd90};  
assign weight[8 ]={ 8'd74,  -8'd53,  -8'd19,  8'd20};  
assign weight[9 ]={ 8'd17,  -8'd90,   8'd21, -8'd54};  

assign weight[10]={-8'd96,  -8'd81,   8'd68, -8'd45};  
assign weight[11]={ 8'd63,  -8'd45,   8'd32,  8'd47};  
assign weight[12]={ 8'd85,  -8'd27,   8'd48,  8'd106};  
assign weight[13]={ 8'd94,   8'd20,   8'd38,  8'd76}; 
assign weight[14]={-8'd67,  -8'd6,    8'd71, -8'd13};  

assign weight[15]={-8'd13,  8'd57,  8'd79,  -8'd126};  
assign weight[16]={ 8'd60,  8'd90,  8'd47,  -8'd26 };  
assign weight[17]={ 8'd85,  8'd101, 8'd42,   8'd59 };  
assign weight[18]={ 8'd17,  8'd73,  8'd63,   8'd83 };  
assign weight[19]={-8'd65,  8'd49,  8'd71,   8'd44 };  

assign weight[20]={ 8'd61,  8'd109, 8'd32,  -8'd85 };  
assign weight[21]={ 8'd63,  8'd63,  8'd39,  -8'd69 };  
assign weight[22]={ 8'd30,  8'd50,  8'd31,  -8'd57 };  
assign weight[23]={ 8'd5,   8'd23,  8'd6,    8'd48 };  
assign weight[24]={-8'd34,  8'd61,  8'd26,   8'd59 };


//5*5*4*8

	always @(posedge clk or negedge rst_n)
		if (!rst_n)			qa <= 0;
		else if (!cena)		qa <= weight[aa];
	


endmodule	



module bias_fc1_rom(
	input							clk,
	input							rst_n,
	input	[6:0]					aa,
	input							cena,
	output reg	[`WD_BIAS*1 -1:0]	qa
	);
	
//logic [0:9][0:0][`WD_BIAS-1:0] weight	 = {
//12'd167,  12'd485,  -12'd61,  -12'd432,  12'd111,  12'd219,  -12'd68,  12'd412,  -12'd518,  -12'd253	
	//};
		wire [`WD_BIAS-1:0] weight [0:9];
		
assign weight[0]  = 12'd167;
assign weight[1]  = 12'd485;  
assign weight[2]  = -12'd61;  
assign weight[3]  = -12'd432;  
assign weight[4]  = 12'd111; 
assign weight[5]  = 12'd219;  
assign weight[6]  = -12'd68; 
assign weight[7]  =  12'd412;  
assign weight[8]  =  -12'd518;  
assign weight[9]  =  -12'd253;
	
//120*1*24

	always @(posedge clk or negedge rst_n)
		if (!rst_n)			
		   qa <= 0;
		else if (!cena)		
		   qa <= weight[aa];	
endmodule

module wieght_fc1_rom(
	input							clk,
	input							rst_n,
	input	[11:0]					aa,
	input							cena,
	output reg	[`WD*4*1 -1:0]	qa
	);
	


	wire [4*`WD-1:0] weight [0:10*7*7-1];
assign weight[0 ]={ 8'd8   ,-8'd8  ,-8'd18  ,-8'd26  }; 
assign weight[1 ]={ 8'd3   ,8'd5  ,-8'd3  ,-8'd1  }; 
assign weight[2 ]={ 8'd0   ,8'd12  ,8'd6  ,-8'd11  }; 
assign weight[3 ]={ 8'd20  ,-8'd17  ,-8'd15  ,-8'd4  }; 
assign weight[4 ]={-8'd14  ,8'd9  ,-8'd26  ,8'd4  }; 
assign weight[5 ]={-8'd10  ,-8'd8  ,-8'd5  ,-8'd4  }; 
assign weight[6 ]={-8'd25  ,8'd14  ,8'd0  ,-8'd28  }; 
assign weight[7 ]={-8'd11  ,8'd11  ,-8'd2  ,-8'd13  }; 
assign weight[8 ]={ 8'd7   ,-8'd3  ,8'd3  ,-8'd20  }; 
assign weight[9 ]={-8'd13  ,-8'd27  ,-8'd27  ,-8'd18  }; 
assign weight[10]={-8'd1  ,8'd8  ,8'd9  ,8'd16  }; 
assign weight[11]={-8'd8  ,8'd6  ,-8'd4  ,8'd10  }; 
assign weight[12]={ 8'd1  ,-8'd7  ,8'd6  ,-8'd7  }; 
assign weight[13]={-8'd27  ,-8'd4  ,8'd28  ,-8'd21  }; 
assign weight[14]={-8'd11  ,8'd1  ,-8'd24  ,-8'd18  }; 
assign weight[15]={ 8'd12  ,8'd1  ,8'd9  ,-8'd20  }; 
assign weight[16]={ 8'd16  ,-8'd1  ,8'd6  ,8'd22  }; 
assign weight[17]={ 8'd18  ,-8'd26  ,-8'd19  ,8'd1  }; 
assign weight[18]={-8'd29  ,-8'd53  ,-8'd6  ,8'd59  }; 
assign weight[19]={ 8'd4  ,-8'd54  ,8'd27  ,8'd22  }; 
assign weight[20]={ 8'd15  ,-8'd4  ,8'd9  ,-8'd30  }; 
assign weight[21]={-8'd32  ,-8'd8  ,-8'd7  ,8'd4  }; 
assign weight[22]={ 8'd25  ,-8'd3  ,8'd25  ,-8'd14  }; 
assign weight[23]={ 8'd47  ,-8'd33  ,-8'd19  ,-8'd10  }; 
assign weight[24]={-8'd15  ,-8'd56  ,-8'd54  ,-8'd45  }; 
assign weight[25]={ 8'd13  ,-8'd31  ,-8'd31  ,-8'd5  }; 
assign weight[26]={ 8'd32  ,-8'd41  ,8'd15  ,-8'd5  }; 
assign weight[27]={ 8'd22  ,-8'd59  ,8'd39  ,8'd35  }; 
assign weight[28]={-8'd14  ,8'd14  ,8'd19  ,-8'd8  }; 
assign weight[29]={ 8'd28  ,-8'd81  ,-8'd6  ,-8'd3  }; 
assign weight[30]={ 8'd43  ,-8'd59  ,8'd21  ,-8'd3  }; 
assign weight[31]={-8'd21  ,8'd27  ,8'd8  ,-8'd15  }; 
assign weight[32]={ 8'd15  ,8'd4  ,8'd17  ,-8'd38  }; 
assign weight[33]={ 8'd11  ,-8'd35  ,8'd25  ,8'd3  }; 
assign weight[34]={ 8'd0  ,-8'd41  ,8'd34  ,8'd18  }; 
assign weight[35]={ 8'd3  ,-8'd25  ,8'd19  ,8'd7  }; 
assign weight[36]={ 8'd2  ,-8'd37  ,8'd3  ,-8'd14  }; 
assign weight[37]={ 8'd7  ,-8'd15  ,8'd18  ,8'd50  }; 
assign weight[38]={-8'd18  ,8'd18  ,8'd18  ,8'd24  }; 
assign weight[39]={-8'd4  ,8'd31  ,-8'd3  ,8'd3  }; 
assign weight[40]={ 8'd9  ,-8'd1  ,-8'd25  ,-8'd34  }; 
assign weight[41]={-8'd28  ,8'd18  ,-8'd2  ,8'd0  }; 
assign weight[42]={-8'd7  ,8'd3  ,-8'd39  ,-8'd17  }; 
assign weight[43]={ 8'd15  ,8'd10  ,-8'd74  ,8'd7  }; 
assign weight[44]={-8'd18  ,-8'd6  ,-8'd46  ,8'd0  }; 
assign weight[45]={-8'd48  ,-8'd4  ,-8'd53  ,8'd22  }; 
assign weight[46]={-8'd38  ,8'd25  ,-8'd66  ,-8'd17  }; 
assign weight[47]={-8'd36  ,-8'd6  ,-8'd41  ,-8'd17  }; 
assign weight[48]={-8'd45  ,8'd9  ,-8'd21  ,8'd3  }; 
assign weight[49]={ 8'd27  ,8'd51  ,8'd52  ,8'd27  }; 
assign weight[50]={-8'd8  ,8'd22  ,-8'd21  ,-8'd12  }; 
assign weight[51]={-8'd6  ,-8'd8  ,-8'd20  ,8'd35  }; 
assign weight[52]={ 8'd44  ,8'd10  ,-8'd10  ,8'd20  }; 
assign weight[53]={ 8'd15  ,8'd12  ,-8'd15  ,8'd34  }; 
assign weight[54]={ 8'd7  ,8'd11  ,-8'd22  ,8'd41  }; 
assign weight[55]={-8'd1  ,8'd25  ,-8'd7  ,-8'd22  }; 
assign weight[56]={ 8'd24  ,8'd51  ,8'd4  ,8'd5  }; 
assign weight[57]={-8'd27  ,8'd10  ,-8'd17  ,8'd7  }; 
assign weight[58]={-8'd21  ,-8'd20  ,-8'd24  ,-8'd6  }; 
assign weight[59]={-8'd14  ,-8'd21  ,-8'd18  ,8'd9  }; 
assign weight[60]={ 8'd44  ,-8'd33  ,8'd0  ,-8'd58  }; 
assign weight[61]={ 8'd31  ,-8'd5  ,-8'd19  ,-8'd58  }; 
assign weight[62]={-8'd5  ,8'd17  ,-8'd17  ,-8'd30  }; 
assign weight[63]={-8'd5  ,8'd45  ,8'd0  ,-8'd4  }; 
assign weight[64]={-8'd27  ,8'd13  ,8'd7  ,8'd0  }; 
assign weight[65]={-8'd24  ,-8'd22  ,-8'd26  ,-8'd1  }; 
assign weight[66]={ 8'd31  ,8'd0  ,8'd34  ,8'd16  }; 
assign weight[67]={-8'd2  ,-8'd15  ,8'd40  ,-8'd73  }; 
assign weight[68]={ 8'd9  ,-8'd39  ,-8'd10  ,-8'd37  }; 
assign weight[69]={-8'd58  ,8'd32  ,-8'd7  ,-8'd17  }; 
assign weight[70]={ 8'd1  ,8'd12  ,-8'd10  ,-8'd13  }; 
assign weight[71]={ 8'd4  ,8'd11  ,-8'd11  ,-8'd40  }; 
assign weight[72]={-8'd20  ,-8'd2  ,8'd7  ,-8'd31  }; 
assign weight[73]={ 8'd15  ,-8'd39  ,-8'd30  ,-8'd5  }; 
assign weight[74]={ 8'd12  ,-8'd101  ,8'd59  ,-8'd55  }; 
assign weight[75]={-8'd22  ,8'd1  ,-8'd17  ,-8'd25  }; 
assign weight[76]={ 8'd4  ,8'd56  ,8'd4  ,-8'd6  }; 
assign weight[77]={-8'd15  ,8'd34  ,-8'd50  ,-8'd37  }; 
assign weight[78]={-8'd13  ,8'd12  ,-8'd19  ,-8'd6  }; 
assign weight[79]={-8'd1  ,8'd38  ,-8'd9  ,-8'd37  }; 
assign weight[80]={ 8'd30  ,-8'd71  ,8'd24  ,-8'd17  }; 
assign weight[81]={-8'd37  ,8'd5  ,8'd30  ,-8'd6  }; 
assign weight[82]={ 8'd19  ,8'd48  ,-8'd10  ,-8'd31  }; 
assign weight[83]={ 8'd5  ,8'd31  ,-8'd10  ,8'd4  }; 
assign weight[84]={ 8'd0  ,8'd62  ,8'd16  ,8'd32  }; 
assign weight[85]={ 8'd13  ,8'd40  ,8'd3  ,-8'd16  }; 
assign weight[86]={ 8'd13  ,8'd25  ,-8'd4  ,-8'd43  }; 
assign weight[87]={-8'd29  ,-8'd23  ,-8'd5  ,8'd19  }; 
assign weight[88]={-8'd21  ,-8'd18  ,8'd31  ,8'd2  }; 
assign weight[89]={ 8'd3  ,8'd41  ,8'd11  ,8'd50  }; 
assign weight[90]={-8'd16  ,8'd40  ,-8'd7  ,-8'd17  }; 
assign weight[91]={ 8'd24  ,8'd49  ,-8'd56  ,-8'd25  }; 
assign weight[92]={ 8'd23  ,8'd24  ,-8'd56  ,8'd14  }; 
assign weight[93]={ 8'd27  ,8'd37  ,-8'd13  ,8'd14  }; 
assign weight[94]={ 8'd5  ,8'd18  ,-8'd54  ,8'd9  }; 
assign weight[95]={ 8'd26  ,8'd33  ,-8'd31  ,8'd42  }; 
assign weight[96]={-8'd26  ,8'd55  ,8'd8  ,8'd8  }; 
assign weight[97]={ 8'd5  ,8'd61  ,-8'd33  ,-8'd59  }; 
assign weight[98]={-8'd9  ,8'd4  ,-8'd25  ,-8'd35  }; 
assign weight[99]={-8'd6  ,-8'd12  ,8'd7  ,-8'd20  }; 
assign weight[100]={ 8'd7  ,8'd19  ,-8'd6  ,-8'd10  }; 
assign weight[101]={-8'd31  ,-8'd2  ,8'd10  ,8'd4  }; 
assign weight[102]={-8'd2  ,-8'd3  ,8'd5  ,-8'd18  }; 
assign weight[103]={-8'd18  ,8'd11  ,-8'd3  ,-8'd50  }; 
assign weight[104]={ 8'd0  ,-8'd13  ,8'd5  ,8'd2  }; 
assign weight[105]={ 8'd12  ,8'd13  ,-8'd12  ,8'd11  }; 
assign weight[106]={-8'd11  ,8'd19  ,8'd6  ,-8'd7  }; 
assign weight[107]={ 8'd0  ,8'd12  ,8'd30  ,8'd16  }; 
assign weight[108]={-8'd6  ,-8'd5  ,8'd0  ,8'd10  }; 
assign weight[109]={-8'd42  ,-8'd31  ,8'd12  ,8'd17  }; 
assign weight[110]={-8'd25  ,-8'd29  ,-8'd14  ,8'd13  }; 
assign weight[111]={-8'd15  ,-8'd13  ,-8'd21  ,-8'd46  }; 
assign weight[112]={ 8'd24  ,-8'd5  ,8'd14  ,-8'd20  }; 
assign weight[113]={-8'd17  ,8'd33  ,8'd18  ,-8'd14  }; 
assign weight[114]={-8'd36  ,8'd52  ,-8'd25  ,-8'd10  }; 
assign weight[115]={-8'd32  ,8'd0  ,-8'd26  ,-8'd3  }; 
assign weight[116]={-8'd13  ,-8'd20  ,-8'd17  ,8'd31  }; 
assign weight[117]={ 8'd12  ,-8'd47  ,8'd0  ,-8'd17  }; 
assign weight[118]={-8'd2  ,-8'd11  ,-8'd19  ,-8'd44  }; 
assign weight[119]={-8'd6  ,8'd15  ,-8'd21  ,-8'd14  }; 
assign weight[120]={-8'd1  ,8'd68  ,-8'd13  ,-8'd79  }; 
assign weight[121]={-8'd18  ,8'd52  ,-8'd21  ,-8'd64  }; 
assign weight[122]={-8'd16  ,8'd37  ,-8'd5  ,-8'd20  }; 
assign weight[123]={ 8'd24  ,8'd1  ,-8'd6  ,-8'd48  }; 
assign weight[124]={ 8'd16  ,-8'd19  ,8'd0  ,-8'd27  }; 
assign weight[125]={ 8'd38  ,8'd41  ,8'd3  ,8'd14  }; 
assign weight[126]={ 8'd13  ,8'd15  ,8'd0  ,8'd6  }; 
assign weight[127]={ 8'd15  ,-8'd9  ,8'd12  ,-8'd10  }; 
assign weight[128]={ 8'd55  ,-8'd12  ,8'd10  ,-8'd32  }; 
assign weight[129]={ 8'd33  ,-8'd19  ,8'd28  ,-8'd6  }; 
assign weight[130]={ 8'd8  ,8'd19  ,8'd4  ,-8'd4  }; 
assign weight[131]={ 8'd1  ,8'd30  ,8'd30  ,-8'd13  }; 
assign weight[132]={-8'd9  ,8'd62  ,-8'd10  ,8'd32  }; 
assign weight[133]={ 8'd6  ,-8'd6  ,8'd7  ,8'd16  }; 
assign weight[134]={ 8'd8  ,8'd0  ,8'd6  ,-8'd1  }; 
assign weight[135]={ 8'd31  ,-8'd20  ,8'd22  ,8'd0  }; 
assign weight[136]={-8'd21  ,8'd16  ,-8'd3  ,8'd17  }; 
assign weight[137]={-8'd29  ,8'd33  ,8'd10  ,8'd56  }; 
assign weight[138]={-8'd36  ,8'd78  ,8'd2  ,8'd59  }; 
assign weight[139]={ 8'd7  ,8'd37  ,-8'd39  ,8'd5  }; 
assign weight[140]={ 8'd8  ,-8'd3  ,-8'd57  ,-8'd45  }; 
assign weight[141]={ 8'd15  ,-8'd9  ,-8'd78  ,8'd4  }; 
assign weight[142]={-8'd18  ,-8'd8  ,-8'd24  ,8'd0  }; 
assign weight[143]={-8'd41  ,-8'd19  ,-8'd17  ,-8'd11  }; 
assign weight[144]={-8'd41  ,-8'd15  ,8'd21  ,8'd3  }; 
assign weight[145]={-8'd45  ,-8'd16  ,-8'd33  ,8'd1  }; 
assign weight[146]={ 8'd4  ,8'd2  ,-8'd8  ,-8'd15  }; 
assign weight[147]={-8'd1  ,-8'd19  ,-8'd3  ,8'd9  }; 
assign weight[148]={ 8'd24  ,-8'd16  ,8'd15  ,-8'd12  }; 
assign weight[149]={-8'd3  ,-8'd19  ,-8'd13  ,-8'd11  }; 
assign weight[150]={-8'd6  ,-8'd14  ,8'd18  ,-8'd6  }; 
assign weight[151]={-8'd19  ,-8'd2  ,8'd12  ,-8'd46  }; 
assign weight[152]={-8'd6  ,-8'd27  ,8'd23  ,-8'd93  }; 
assign weight[153]={ 8'd5  ,-8'd30  ,-8'd17  ,-8'd25  }; 
assign weight[154]={-8'd25  ,8'd0  ,8'd22  ,8'd0  }; 
assign weight[155]={-8'd13  ,8'd31  ,8'd47  ,-8'd4  }; 
assign weight[156]={-8'd22  ,8'd27  ,8'd40  ,8'd32  }; 
assign weight[157]={-8'd28  ,8'd2  ,8'd28  ,8'd23  }; 
assign weight[158]={-8'd31  ,-8'd28  ,8'd16  ,8'd8  }; 
assign weight[159]={-8'd4  ,-8'd37  ,8'd9  ,-8'd8  }; 
assign weight[160]={-8'd27  ,-8'd39  ,-8'd6  ,-8'd46  }; 
assign weight[161]={ 8'd20  ,-8'd31  ,-8'd8  ,8'd3  }; 
assign weight[162]={ 8'd8  ,8'd37  ,8'd7  ,-8'd31  }; 
assign weight[163]={-8'd37  ,8'd55  ,-8'd18  ,-8'd51  }; 
assign weight[164]={ 8'd10  ,8'd50  ,8'd5  ,-8'd18  }; 
assign weight[165]={ 8'd40  ,-8'd1  ,8'd15  ,-8'd15  }; 
assign weight[166]={ 8'd19  ,-8'd30  ,-8'd11  ,-8'd24  }; 
assign weight[167]={-8'd23  ,-8'd38  ,-8'd18  ,-8'd14  }; 
assign weight[168]={ 8'd3  ,8'd1  ,-8'd22  ,8'd12  }; 
assign weight[169]={-8'd32  ,8'd24  ,-8'd46  ,-8'd56  }; 
assign weight[170]={-8'd14  ,8'd34  ,-8'd16  ,-8'd24  }; 
assign weight[171]={ 8'd13  ,8'd11  ,8'd9  ,8'd5  }; 
assign weight[172]={-8'd8  ,8'd18  ,-8'd4  ,8'd14  }; 
assign weight[173]={-8'd23  ,8'd8  ,8'd1  ,8'd10  }; 
assign weight[174]={-8'd17  ,-8'd31  ,-8'd16  ,-8'd3  }; 
assign weight[175]={ 8'd3  ,8'd14  ,8'd13  ,8'd30  }; 
assign weight[176]={-8'd25  ,8'd38  ,8'd1  ,8'd20  }; 
assign weight[177]={-8'd58  ,8'd21  ,8'd1  ,-8'd5  }; 
assign weight[178]={-8'd50  ,8'd30  ,-8'd2  ,8'd38  }; 
assign weight[179]={-8'd7  ,8'd28  ,-8'd6  ,8'd26  }; 
assign weight[180]={-8'd6  ,-8'd52  ,8'd4  ,-8'd1  }; 
assign weight[181]={ 8'd12  ,-8'd47  ,8'd8  ,-8'd9  }; 
assign weight[182]={-8'd10  ,-8'd15  ,-8'd9  ,8'd0  }; 
assign weight[183]={-8'd22  ,8'd50  ,8'd31  ,8'd1  }; 
assign weight[184]={-8'd38  ,8'd28  ,8'd29  ,-8'd9  }; 
assign weight[185]={-8'd18  ,8'd19  ,8'd19  ,-8'd14  }; 
assign weight[186]={ 8'd24  ,-8'd10  ,8'd9  ,-8'd5  }; 
assign weight[187]={ 8'd33  ,-8'd49  ,8'd7  ,-8'd11  }; 
assign weight[188]={-8'd27  ,-8'd66  ,8'd0  ,-8'd14  }; 
assign weight[189]={-8'd21  ,-8'd48  ,8'd54  ,8'd71  }; 
assign weight[190]={-8'd13  ,8'd2  ,8'd56  ,-8'd5  }; 
assign weight[191]={ 8'd15  ,8'd57  ,8'd46  ,-8'd4  }; 
assign weight[192]={ 8'd0  ,8'd52  ,8'd27  ,-8'd28  }; 
assign weight[193]={ 8'd15  ,-8'd29  ,-8'd24  ,-8'd8  }; 
assign weight[194]={ 8'd15  ,-8'd29  ,8'd19  ,-8'd16  }; 
assign weight[195]={-8'd20  ,-8'd37  ,-8'd25  ,-8'd14  }; 
assign weight[196]={ 8'd14  ,8'd23  ,8'd3  ,8'd9  }; 
assign weight[197]={-8'd6  ,8'd11  ,-8'd29  ,8'd0  }; 
assign weight[198]={-8'd37  ,-8'd17  ,-8'd25  ,-8'd10  }; 
assign weight[199]={ 8'd4  ,8'd0  ,-8'd29  ,8'd6  }; 
assign weight[200]={ 8'd8  ,-8'd8  ,-8'd32  ,8'd0  }; 
assign weight[201]={-8'd27  ,8'd2  ,-8'd21  ,8'd11  }; 
assign weight[202]={ 8'd2  ,8'd16  ,-8'd31  ,-8'd45  }; 
assign weight[203]={-8'd26  ,8'd0  ,8'd17  ,8'd21  }; 
assign weight[204]={ 8'd20  ,-8'd5  ,-8'd12  ,8'd22  }; 
assign weight[205]={ 8'd14  ,-8'd27  ,-8'd36  ,8'd43  }; 
assign weight[206]={ 8'd30  ,-8'd79  ,-8'd49  ,-8'd4  }; 
assign weight[207]={ 8'd53  ,-8'd52  ,-8'd30  ,-8'd15  }; 
assign weight[208]={ 8'd50  ,-8'd4  ,-8'd2  ,-8'd36  }; 
assign weight[209]={ 8'd42  ,8'd6  ,8'd25  ,8'd7  }; 
assign weight[210]={-8'd13  ,-8'd4  ,8'd3  ,-8'd28  }; 
assign weight[211]={-8'd10  ,-8'd6  ,-8'd8  ,8'd13  }; 
assign weight[212]={ 8'd40  ,-8'd33  ,8'd8  ,8'd26  }; 
assign weight[213]={ 8'd25  ,-8'd49  ,-8'd25  ,-8'd52  }; 
assign weight[214]={ 8'd57  ,-8'd44  ,8'd15  ,-8'd38  }; 
assign weight[215]={ 8'd30  ,-8'd17  ,-8'd16  ,-8'd72  }; 
assign weight[216]={-8'd15  ,-8'd8  ,-8'd33  ,-8'd27  }; 
assign weight[217]={-8'd19  ,8'd3  ,8'd29  ,-8'd9  }; 
assign weight[218]={ 8'd26  ,8'd9  ,8'd24  ,8'd20  }; 
assign weight[219]={ 8'd50  ,-8'd37  ,8'd34  ,8'd22  }; 
assign weight[220]={-8'd12  ,8'd17  ,8'd21  ,8'd18  }; 
assign weight[221]={ 8'd44  ,-8'd19  ,8'd29  ,8'd0  }; 
assign weight[222]={ 8'd24  ,8'd20  ,8'd14  ,-8'd7  }; 
assign weight[223]={-8'd28  ,8'd2  ,8'd8  ,-8'd4  }; 
assign weight[224]={ 8'd32  ,-8'd13  ,8'd0  ,-8'd24  }; 
assign weight[225]={ 8'd22  ,-8'd9  ,-8'd7  ,8'd3  }; 
assign weight[226]={ 8'd7  ,8'd19  ,-8'd7  ,-8'd15  }; 
assign weight[227]={ 8'd1  ,8'd10  ,-8'd15  ,8'd29  }; 
assign weight[228]={ 8'd1  ,-8'd19  ,8'd5  ,8'd8  }; 
assign weight[229]={-8'd8  ,-8'd15  ,8'd0  ,8'd22  }; 
assign weight[230]={-8'd36  ,8'd28  ,-8'd26  ,8'd2  }; 
assign weight[231]={-8'd49  ,8'd0  ,-8'd22  ,-8'd22  }; 
assign weight[232]={ 8'd4  ,8'd26  ,-8'd11  ,-8'd40  }; 
assign weight[233]={-8'd9  ,8'd12  ,-8'd18  ,-8'd59  }; 
assign weight[234]={ 8'd0  ,-8'd93  ,-8'd43  ,-8'd17  }; 
assign weight[235]={-8'd14  ,-8'd85  ,8'd6  ,8'd3  }; 
assign weight[236]={-8'd7  ,8'd2  ,8'd15  ,-8'd3  }; 
assign weight[237]={-8'd19  ,8'd29  ,8'd5  ,-8'd2  }; 
assign weight[238]={-8'd46  ,8'd17  ,-8'd2  ,-8'd25  }; 
assign weight[239]={-8'd4  ,-8'd7  ,8'd18  ,-8'd22  }; 
assign weight[240]={ 8'd24  ,-8'd75  ,8'd13  ,8'd11  }; 
assign weight[241]={ 8'd3  ,-8'd55  ,8'd3  ,8'd13  }; 
assign weight[242]={ 8'd15  ,8'd15  ,-8'd8  ,8'd30  }; 
assign weight[243]={ 8'd20  ,-8'd1  ,-8'd29  ,8'd26  }; 
assign weight[244]={-8'd9  ,8'd30  ,8'd13  ,-8'd8  }; 
assign weight[245]={ 8'd19  ,8'd20  ,-8'd15  ,-8'd18  }; 
assign weight[246]={-8'd41  ,8'd9  ,-8'd33  ,-8'd12  }; 
assign weight[247]={-8'd6  ,8'd1  ,8'd0  ,-8'd25  }; 
assign weight[248]={-8'd18  ,-8'd3  ,8'd3  ,-8'd21  }; 
assign weight[249]={ 8'd8  ,8'd11  ,8'd13  ,8'd23  }; 
assign weight[250]={ 8'd2  ,-8'd12  ,8'd10  ,8'd24  }; 
assign weight[251]={ 8'd6  ,8'd9  ,-8'd10  ,8'd25  }; 
assign weight[252]={-8'd18  ,-8'd10  ,-8'd34  ,-8'd21  }; 
assign weight[253]={-8'd13  ,-8'd2  ,-8'd19  ,-8'd15  }; 
assign weight[254]={ 8'd0  ,-8'd7  ,-8'd11  ,8'd1  }; 
assign weight[255]={-8'd11  ,-8'd1  ,8'd7  ,-8'd36  }; 
assign weight[256]={-8'd8  ,8'd35  ,8'd8  ,-8'd2  }; 
assign weight[257]={ 8'd5  ,8'd46  ,8'd41  ,-8'd2  }; 
assign weight[258]={ 8'd18  ,8'd24  ,8'd15  ,-8'd6  }; 
assign weight[259]={-8'd61  ,8'd4  ,8'd7  ,-8'd42  }; 
assign weight[260]={-8'd2  ,-8'd62  ,-8'd35  ,8'd15  }; 
assign weight[261]={ 8'd3  ,-8'd42  ,8'd23  ,8'd17  }; 
assign weight[262]={-8'd10  ,8'd26  ,8'd10  ,-8'd32  }; 
assign weight[263]={-8'd101  ,8'd42  ,-8'd14  ,8'd2  }; 
assign weight[264]={-8'd93  ,8'd81  ,-8'd6  ,8'd15  }; 
assign weight[265]={ 8'd14  ,8'd52  ,-8'd20  ,8'd57  }; 
assign weight[266]={-8'd2  ,-8'd6  ,-8'd15  ,-8'd6  }; 
assign weight[267]={ 8'd1  ,-8'd39  ,8'd19  ,8'd11  }; 
assign weight[268]={-8'd13  ,8'd0  ,8'd15  ,8'd31  }; 
assign weight[269]={-8'd36  ,8'd13  ,8'd3  ,8'd5  }; 
assign weight[270]={-8'd76  ,8'd2  ,-8'd17  ,8'd25  }; 
assign weight[271]={-8'd72  ,8'd33  ,-8'd35  ,8'd0  }; 
assign weight[272]={-8'd26  ,8'd59  ,-8'd58  ,-8'd15  }; 
assign weight[273]={-8'd3  ,8'd33  ,-8'd1  ,8'd3  }; 
assign weight[274]={-8'd50  ,8'd57  ,-8'd14  ,8'd21  }; 
assign weight[275]={-8'd56  ,8'd43  ,-8'd10  ,8'd17  }; 
assign weight[276]={-8'd20  ,8'd10  ,8'd4  ,8'd10  }; 
assign weight[277]={-8'd1  ,8'd9  ,8'd8  ,8'd11  }; 
assign weight[278]={ 8'd1  ,-8'd59  ,8'd3  ,8'd8  }; 
assign weight[279]={ 8'd13  ,-8'd11  ,8'd18  ,-8'd22  }; 
assign weight[280]={-8'd14  ,-8'd3  ,-8'd9  ,-8'd20  }; 
assign weight[281]={-8'd22  ,8'd50  ,8'd4  ,8'd9  }; 
assign weight[282]={-8'd31  ,8'd29  ,8'd19  ,8'd11  }; 
assign weight[283]={ 8'd10  ,8'd20  ,8'd16  ,-8'd24  }; 
assign weight[284]={ 8'd24  ,8'd14  ,8'd9  ,-8'd7  }; 
assign weight[285]={ 8'd36  ,-8'd32  ,8'd17  ,8'd0  }; 
assign weight[286]={ 8'd35  ,-8'd19  ,8'd26  ,8'd9  }; 
assign weight[287]={-8'd16  ,-8'd2  ,8'd2  ,-8'd39  }; 
assign weight[288]={-8'd30  ,-8'd3  ,8'd15  ,-8'd31  }; 
assign weight[289]={-8'd2  ,8'd23  ,8'd33  ,-8'd22  }; 
assign weight[290]={-8'd8  ,8'd59  ,8'd27  ,-8'd13  }; 
assign weight[291]={ 8'd16  ,8'd22  ,8'd3  ,-8'd5  }; 
assign weight[292]={ 8'd35  ,8'd29  ,-8'd16  ,-8'd27  }; 
assign weight[293]={ 8'd27  ,8'd27  ,8'd33  ,8'd34  }; 
assign weight[294]={-8'd22  ,8'd1  ,8'd30  ,8'd37  }; 
assign weight[295]={ 8'd13  ,-8'd6  ,8'd31  ,8'd38  }; 
assign weight[296]={ 8'd52  ,-8'd10  ,8'd25  ,8'd26  }; 
assign weight[297]={ 8'd17  ,8'd0  ,-8'd19  ,8'd22  }; 
assign weight[298]={ 8'd29  ,8'd8  ,8'd20  ,8'd5  }; 
assign weight[299]={ 8'd7  ,8'd24  ,8'd37  ,8'd34  }; 
assign weight[300]={ 8'd10  ,-8'd1  ,8'd33  ,8'd14  }; 
assign weight[301]={ 8'd1  ,-8'd2  ,-8'd9  ,-8'd31  }; 
assign weight[302]={ 8'd8  ,-8'd14  ,8'd10  ,8'd8  }; 
assign weight[303]={-8'd5  ,-8'd41  ,-8'd34  ,-8'd38  }; 
assign weight[304]={ 8'd45  ,-8'd6  ,-8'd32  ,-8'd57  }; 
assign weight[305]={ 8'd0  ,8'd2  ,-8'd24  ,-8'd34  }; 
assign weight[306]={-8'd14  ,8'd22  ,-8'd6  ,8'd22  }; 
assign weight[307]={ 8'd6  ,-8'd22  ,-8'd1  ,8'd43  }; 
assign weight[308]={-8'd18  ,-8'd21  ,-8'd8  ,-8'd24  }; 
assign weight[309]={ 8'd21  ,-8'd31  ,-8'd16  ,-8'd15  }; 
assign weight[310]={ 8'd33  ,-8'd18  ,8'd6  ,-8'd13  }; 
assign weight[311]={ 8'd19  ,-8'd17  ,-8'd18  ,-8'd78  }; 
assign weight[312]={-8'd21  ,8'd48  ,-8'd35  ,-8'd40  }; 
assign weight[313]={-8'd43  ,8'd51  ,-8'd29  ,8'd30  }; 
assign weight[314]={-8'd30  ,-8'd5  ,-8'd4  ,-8'd19  }; 
assign weight[315]={-8'd76  ,-8'd33  ,8'd3  ,8'd2  }; 
assign weight[316]={ 8'd18  ,-8'd44  ,-8'd6  ,8'd1  }; 
assign weight[317]={ 8'd38  ,-8'd63  ,-8'd14  ,-8'd36  }; 
assign weight[318]={ 8'd13  ,8'd12  ,8'd18  ,-8'd38  }; 
assign weight[319]={-8'd32  ,8'd44  ,8'd7  ,8'd4  }; 
assign weight[320]={-8'd11  ,8'd5  ,8'd0  ,8'd19  }; 
assign weight[321]={ 8'd30  ,-8'd53  ,8'd18  ,8'd24  }; 
assign weight[322]={-8'd21  ,-8'd31  ,-8'd26  ,-8'd38  }; 
assign weight[323]={-8'd9  ,-8'd90  ,-8'd6  ,8'd26  }; 
assign weight[324]={ 8'd18  ,-8'd55  ,8'd13  ,8'd45  }; 
assign weight[325]={ 8'd4  ,-8'd13  ,8'd30  ,8'd16  }; 
assign weight[326]={ 8'd3  ,-8'd5  ,8'd9  ,8'd21  }; 
assign weight[327]={ 8'd24  ,-8'd20  ,8'd24  ,-8'd4  }; 
assign weight[328]={ 8'd16  ,-8'd26  ,8'd28  ,8'd2  }; 
assign weight[329]={-8'd46  ,-8'd16  ,-8'd38  ,-8'd33  }; 
assign weight[330]={ 8'd11  ,-8'd60  ,-8'd13  ,8'd20  }; 
assign weight[331]={-8'd21  ,-8'd35  ,8'd22  ,8'd37  }; 
assign weight[332]={-8'd24  ,8'd11  ,8'd32  ,8'd47  }; 
assign weight[333]={ 8'd1  ,8'd8  ,8'd18  ,8'd20  }; 
assign weight[334]={-8'd1  ,8'd0  ,-8'd20  ,8'd9  }; 
assign weight[335]={ 8'd27  ,-8'd2  ,-8'd16  ,-8'd7  }; 
assign weight[336]={-8'd67  ,-8'd9  ,-8'd9  ,-8'd27  }; 
assign weight[337]={-8'd40  ,-8'd3  ,-8'd25  ,-8'd70  }; 
assign weight[338]={-8'd5  ,-8'd1  ,-8'd54  ,-8'd31  }; 
assign weight[339]={-8'd46  ,8'd5  ,-8'd48  ,-8'd33  }; 
assign weight[340]={-8'd44  ,-8'd9  ,-8'd31  ,-8'd25  }; 
assign weight[341]={-8'd48  ,-8'd9  ,-8'd4  ,-8'd1  }; 
assign weight[342]={-8'd45  ,-8'd4  ,-8'd47  ,-8'd23  }; 
assign weight[343]={-8'd14  ,8'd24  ,-8'd11  ,-8'd15  }; 
assign weight[344]={ 8'd12  ,8'd35  ,8'd24  ,8'd32  }; 
assign weight[345]={-8'd28  ,8'd7  ,-8'd25  ,8'd6  }; 
assign weight[346]={-8'd11  ,8'd17  ,-8'd17  ,-8'd35  }; 
assign weight[347]={-8'd12  ,8'd1  ,-8'd11  ,-8'd72  }; 
assign weight[348]={-8'd30  ,-8'd4  ,-8'd59  ,-8'd39  }; 
assign weight[349]={-8'd66  ,8'd18  ,-8'd47  ,-8'd4  }; 
assign weight[350]={ 8'd50  ,8'd9  ,8'd5  ,-8'd19  }; 
assign weight[351]={ 8'd12  ,8'd17  ,8'd3  ,8'd19  }; 
assign weight[352]={ 8'd0  ,8'd42  ,8'd23  ,8'd36  }; 
assign weight[353]={-8'd35  ,-8'd2  ,8'd4  ,8'd8  }; 
assign weight[354]={ 8'd6  ,8'd20  ,-8'd10  ,-8'd11  }; 
assign weight[355]={ 8'd16  ,8'd2  ,-8'd11  ,-8'd29  }; 
assign weight[356]={-8'd4  ,-8'd2  ,-8'd17  ,-8'd58  }; 
assign weight[357]={ 8'd6  ,8'd25  ,8'd8  ,8'd24  }; 
assign weight[358]={-8'd17  ,8'd32  ,8'd41  ,8'd28  }; 
assign weight[359]={-8'd24  ,8'd9  ,8'd31  ,8'd10  }; 
assign weight[360]={-8'd14  ,8'd24  ,8'd8  ,8'd31  }; 
assign weight[361]={ 8'd29  ,8'd0  ,8'd37  ,8'd42  }; 
assign weight[362]={ 8'd21  ,-8'd14  ,8'd13  ,-8'd32  }; 
assign weight[363]={-8'd22  ,-8'd13  ,8'd13  ,-8'd46  }; 
assign weight[364]={ 8'd15  ,8'd19  ,8'd16  ,8'd14  }; 
assign weight[365]={-8'd1  ,8'd27  ,8'd20  ,-8'd24  }; 
assign weight[366]={ 8'd27  ,8'd9  ,-8'd48  ,-8'd73  }; 
assign weight[367]={ 8'd3  ,-8'd4  ,-8'd61  ,-8'd51  }; 
assign weight[368]={ 8'd12  ,-8'd17  ,-8'd1  ,-8'd26  }; 
assign weight[369]={ 8'd23  ,8'd54  ,8'd3  ,-8'd2  }; 
assign weight[370]={-8'd11  ,8'd6  ,-8'd22  ,-8'd48  }; 
assign weight[371]={-8'd25  ,8'd17  ,-8'd26  ,-8'd22  }; 
assign weight[372]={ 8'd14  ,8'd3  ,-8'd24  ,-8'd33  }; 
assign weight[373]={-8'd8  ,-8'd4  ,-8'd1  ,-8'd15  }; 
assign weight[374]={ 8'd15  ,-8'd9  ,-8'd36  ,-8'd38  }; 
assign weight[375]={ 8'd12  ,-8'd16  ,8'd25  ,-8'd15  }; 
assign weight[376]={-8'd10  ,-8'd4  ,8'd5  ,8'd39  }; 
assign weight[377]={-8'd59  ,8'd19  ,-8'd32  ,-8'd20  }; 
assign weight[378]={ 8'd6  ,8'd36  ,-8'd12  ,-8'd12  }; 
assign weight[379]={ 8'd11  ,8'd6  ,8'd4  ,-8'd43  }; 
assign weight[380]={ 8'd16  ,-8'd21  ,-8'd38  ,-8'd54  }; 
assign weight[381]={ 8'd10  ,-8'd83  ,-8'd31  ,-8'd9  }; 
assign weight[382]={-8'd20  ,-8'd62  ,-8'd19  ,-8'd31  }; 
assign weight[383]={-8'd37  ,-8'd33  ,-8'd26  ,-8'd31  }; 
assign weight[384]={-8'd60  ,8'd4  ,-8'd82  ,-8'd52  }; 
assign weight[385]={ 8'd24  ,8'd33  ,8'd42  ,8'd3  }; 
assign weight[386]={ 8'd46  ,-8'd3  ,8'd20  ,8'd22  }; 
assign weight[387]={ 8'd16  ,8'd6  ,8'd19  ,8'd35  }; 
assign weight[388]={ 8'd17  ,8'd7  ,8'd15  ,8'd24  }; 
assign weight[389]={ 8'd32  ,-8'd10  ,8'd38  ,8'd4  }; 
assign weight[390]={-8'd23  ,8'd38  ,8'd15  ,-8'd7  }; 
assign weight[391]={-8'd4  ,8'd13  ,-8'd19  ,-8'd41  }; 
assign weight[392]={-8'd40  ,-8'd50  ,-8'd63  ,-8'd37  }; 
assign weight[393]={-8'd4  ,-8'd20  ,8'd10  ,8'd0  }; 
assign weight[394]={ 8'd8  ,8'd29  ,-8'd11  ,-8'd17  }; 
assign weight[395]={-8'd9  ,8'd0  ,-8'd6  ,8'd2  }; 
assign weight[396]={ 8'd19  ,8'd10  ,8'd0  ,8'd13  }; 
assign weight[397]={-8'd9  ,-8'd8  ,-8'd3  ,-8'd20  }; 
assign weight[398]={ 8'd4  ,-8'd26  ,8'd14  ,8'd18  }; 
assign weight[399]={-8'd26  ,-8'd31  ,-8'd22  ,-8'd3  }; 
assign weight[400]={ 8'd3  ,-8'd21  ,-8'd18  ,-8'd6  }; 
assign weight[401]={ 8'd0  ,8'd3  ,-8'd8  ,-8'd14  }; 
assign weight[402]={ 8'd21  ,8'd23  ,-8'd7  ,-8'd13  }; 
assign weight[403]={-8'd10  ,8'd3  ,-8'd20  ,8'd40  }; 
assign weight[404]={-8'd12  ,8'd16  ,-8'd4  ,8'd19  }; 
assign weight[405]={-8'd15  ,-8'd8  ,8'd7  ,8'd37  }; 
assign weight[406]={-8'd8  ,-8'd28  ,-8'd2  ,8'd34  }; 
assign weight[407]={ 8'd13  ,-8'd9  ,8'd2  ,8'd31  }; 
assign weight[408]={-8'd14  ,-8'd10  ,-8'd16  ,8'd53  }; 
assign weight[409]={-8'd29  ,-8'd2  ,-8'd10  ,8'd33  }; 
assign weight[410]={ 8'd3  ,-8'd3  ,8'd0  ,-8'd3  }; 
assign weight[411]={ 8'd30  ,8'd7  ,8'd11  ,8'd13  }; 
assign weight[412]={ 8'd36  ,-8'd20  ,8'd10  ,-8'd18  }; 
assign weight[413]={-8'd14  ,-8'd50  ,-8'd5  ,8'd0  }; 
assign weight[414]={ 8'd5  ,-8'd28  ,8'd10  ,8'd6  }; 
assign weight[415]={-8'd20  ,-8'd15  ,-8'd20  ,8'd48  }; 
assign weight[416]={ 8'd21  ,-8'd16  ,8'd23  ,8'd42  }; 
assign weight[417]={ 8'd5  ,8'd6  ,8'd0  ,-8'd22  }; 
assign weight[418]={-8'd9  ,8'd26  ,-8'd26  ,8'd27  }; 
assign weight[419]={ 8'd1  ,-8'd58  ,-8'd14  ,8'd45  }; 
assign weight[420]={-8'd41  ,-8'd36  ,-8'd3  ,-8'd5  }; 
assign weight[421]={ 8'd10  ,8'd3  ,8'd8  ,-8'd30  }; 
assign weight[422]={ 8'd51  ,-8'd16  ,-8'd16  ,-8'd18  }; 
assign weight[423]={-8'd13  ,-8'd27  ,-8'd18  ,8'd26  }; 
assign weight[424]={-8'd32  ,8'd14  ,-8'd46  ,8'd25  }; 
assign weight[425]={-8'd26  ,-8'd9  ,-8'd12  ,8'd20  }; 
assign weight[426]={ 8'd9  ,-8'd42  ,-8'd12  ,-8'd17  }; 
assign weight[427]={-8'd15  ,-8'd33  ,8'd2  ,-8'd21  }; 
assign weight[428]={ 8'd25  ,-8'd51  ,-8'd4  ,8'd2  }; 
assign weight[429]={-8'd7  ,-8'd35  ,8'd15  ,8'd11  }; 
assign weight[430]={-8'd5  ,-8'd3  ,8'd28  ,8'd12  }; 
assign weight[431]={ 8'd19  ,8'd19  ,8'd8  ,8'd4  }; 
assign weight[432]={ 8'd27  ,-8'd38  ,8'd2  ,-8'd8  }; 
assign weight[433]={-8'd21  ,-8'd46  ,8'd25  ,8'd15  }; 
assign weight[434]={ 8'd6  ,-8'd68  ,-8'd67  ,-8'd83  }; 
assign weight[435]={ 8'd5  ,-8'd63  ,-8'd34  ,8'd3  }; 
assign weight[436]={-8'd25  ,-8'd86  ,-8'd7  ,8'd9  }; 
assign weight[437]={-8'd3  ,-8'd50  ,8'd4  ,8'd2  }; 
assign weight[438]={-8'd19  ,-8'd49  ,-8'd20  ,-8'd5  }; 
assign weight[439]={ 8'd18  ,-8'd56  ,-8'd34  ,-8'd2  }; 
assign weight[440]={-8'd42  ,-8'd31  ,-8'd12  ,8'd0  }; 
assign weight[441]={-8'd14  ,-8'd30  ,-8'd28  ,-8'd34  }; 
assign weight[442]={-8'd53  ,-8'd25  ,8'd1  ,-8'd28  }; 
assign weight[443]={-8'd13  ,8'd7  ,8'd18  ,-8'd18  }; 
assign weight[444]={ 8'd4  ,-8'd2  ,-8'd1  ,-8'd74  }; 
assign weight[445]={-8'd22  ,-8'd30  ,-8'd7  ,-8'd42  }; 
assign weight[446]={ 8'd4  ,-8'd19  ,8'd1  ,-8'd93  }; 
assign weight[447]={-8'd36  ,-8'd52  ,-8'd57  ,-8'd6  }; 
assign weight[448]={-8'd74  ,-8'd41  ,-8'd20  ,-8'd25  }; 
assign weight[449]={ 8'd6  ,8'd0  ,-8'd1  ,-8'd48  }; 
assign weight[450]={-8'd15  ,8'd27  ,-8'd6  ,-8'd65  }; 
assign weight[451]={ 8'd1  ,8'd60  ,8'd26  ,8'd12  }; 
assign weight[452]={-8'd28  ,8'd18  ,8'd26  ,8'd7  }; 
assign weight[453]={-8'd46  ,-8'd8  ,-8'd5  ,8'd21  }; 
assign weight[454]={-8'd52  ,-8'd25  ,-8'd20  ,-8'd47  }; 
assign weight[455]={-8'd13  ,8'd0  ,-8'd3  ,8'd2  }; 
assign weight[456]={ 8'd7  ,-8'd5  ,-8'd4  ,8'd2  }; 
assign weight[457]={ 8'd48  ,8'd0  ,-8'd34  ,-8'd2  }; 
assign weight[458]={ 8'd1  ,8'd5  ,-8'd16  ,8'd4  }; 
assign weight[459]={ 8'd4  ,8'd29  ,-8'd4  ,8'd14  }; 
assign weight[460]={-8'd6  ,-8'd22  ,-8'd6  ,8'd11  }; 
assign weight[461]={-8'd30  ,-8'd37  ,-8'd1  ,-8'd26  }; 
assign weight[462]={ 8'd8  ,-8'd50  ,-8'd6  ,8'd31  }; 
assign weight[463]={ 8'd6  ,-8'd54  ,8'd0  ,8'd27  }; 
assign weight[464]={-8'd14  ,-8'd26  ,8'd36  ,8'd43  }; 
assign weight[465]={ 8'd7  ,8'd29  ,8'd50  ,8'd11  }; 
assign weight[466]={ 8'd16  ,-8'd18  ,8'd15  ,8'd18  }; 
assign weight[467]={ 8'd16  ,-8'd73  ,8'd20  ,-8'd11  }; 
assign weight[468]={-8'd39  ,-8'd61  ,8'd11  ,-8'd26  }; 
assign weight[469]={ 8'd9  ,-8'd54  ,-8'd10  ,8'd2  }; 
assign weight[470]={-8'd9  ,-8'd44  ,8'd10  ,8'd34  }; 
assign weight[471]={-8'd55  ,8'd42  ,8'd13  ,8'd32  }; 
assign weight[472]={-8'd13  ,8'd33  ,-8'd54  ,-8'd12  }; 
assign weight[473]={ 8'd9  ,-8'd36  ,-8'd30  ,-8'd18  }; 
assign weight[474]={ 8'd1  ,-8'd102  ,-8'd12  ,-8'd31  }; 
assign weight[475]={-8'd45  ,-8'd24  ,8'd2  ,-8'd31  }; 
assign weight[476]={-8'd18  ,-8'd43  ,8'd1  ,-8'd7  }; 
assign weight[477]={ 8'd7  ,8'd16  ,8'd3  ,-8'd19  }; 
assign weight[478]={-8'd12  ,8'd32  ,-8'd41  ,-8'd28  }; 
assign weight[479]={ 8'd6  ,-8'd1  ,-8'd54  ,-8'd31  }; 
assign weight[480]={-8'd10  ,-8'd24  ,-8'd2  ,-8'd17  }; 
assign weight[481]={ 8'd17  ,-8'd21  ,-8'd5  ,-8'd3  }; 
assign weight[482]={ 8'd18  ,8'd13  ,8'd15  ,-8'd8  }; 
assign weight[483]={-8'd3  ,8'd7  ,8'd38  ,8'd27  }; 
assign weight[484]={ 8'd28  ,8'd16  ,8'd4  ,-8'd14  }; 
assign weight[485]={ 8'd31  ,8'd19  ,8'd1  ,-8'd10  }; 
assign weight[486]={ 8'd6  ,-8'd44  ,8'd16  ,-8'd2  }; 
assign weight[487]={ 8'd6  ,-8'd40  ,8'd16  ,8'd26  }; 
assign weight[488]={ 8'd38  ,-8'd22  ,8'd13  ,8'd7  }; 
assign weight[489]={-8'd15  ,-8'd17  ,8'd3  ,8'd10  };
	always @(posedge clk or negedge rst_n)
	        if (!rst_n)			qa <= 0;
	        else if (!cena)		qa <= weight[aa];
endmodule     
              
              
              
              
              
              

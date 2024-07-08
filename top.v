`include "global.v"

module top(
    input clk,
    input rst_n,
    input start,
	output ready,
    output [3:0]num
);
	wire go;
	wire [3:0] digit;

	wire [9:0] aa_image;
	wire [`WD-1:0] image_input;
	
  reg start_r;
	assign num = digit;
  assign go = start && !start_r;
  
	always@(posedge clk)
		if(!rst_n)
			start_r <= 'b0;
		else  
			start_r <= start;


	data_rom data_rom_u(
		.clk			 (clk),
		.rst_n		(rst_n),
		.aa				(aa_image),
		.cena			(cena_image),
		.qa				(image_input)
		);
		
	lenet lenet_u(
		.clk				      (clk),
		.rst_n				    (rst_n),
		.go					    (go),				
		.cena_image			(cena_image),
		.aa_image			  (aa_image),
		.conv1_image		(image_input),
		.digit				    (digit),		
		.ready				    (ready)
		);

endmodule
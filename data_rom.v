`include "global.v"

module data_rom(
	input					                clk,
	input					                rst_n,
	input	[9:0]			            aa,
	input					                cena,
	output       [`WD-1:0]	qa
	);
  /*
	//32*32*8
    rom_32x32_8 rom(
        // A is write port
        .clka(clk),
        .ena(!cena),
        // .web(1'b0),
        .addra(aa),
        // .dinb(8'd0),
        .douta(qa) 
    );
    */
blk_mem_gen_0 data_rom (
  .clka(clk),    // input wire clka
  .ena(!cena),      // input wire ena
  .addra(aa),  // input wire [9 : 0] addra
  .douta(qa)  // output wire [7 : 0] douta
);
  // reg [`WD-1:0] mem [0:1023];
  // initial
  // $readmemh("input_pic",mem);

  //  always @ (posedge clk)
  //  if(!cena)
  //      qa=mem[aa];

endmodule

`include "global.v"
module tb;
  
  reg clk;
  reg rst_n;
  reg start;
  
  initial
  begin
    clk=1'b0;
    rst_n=1'b0;
    start=1'b0;
    # 100 rst_n=1'b1;
    # 100 start=1'b1;
  end
  
  always #10 clk=!clk;
  

wire [3:0] num;
top i_top(
     .clk(clk)
    ,.rst_n(rst_n)
    ,.start(start)
    ,.num(num)
);

endmodule
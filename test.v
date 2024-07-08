module test(
    clk         ,
    rst_n       ,
    key_start   ,
    uart_txd

);
    
    input   clk;
    input   rst_n;
    input   key_start;
    output  uart_txd;

parameter  CLK_FREQ = 50000000;         
parameter  UART_BPS = 115200;           

reg             uart_send_en;
reg             start;
reg[7:0]        uart_send_data;

wire[3:0]       num;
wire            ready;
wire            uart_tx_busy;

always @(posedge clk) begin
    if(!rst_n)begin
        uart_send_en   <=1'b0;
        uart_send_data <= 'b0;
    end
    else if(ready)begin
        uart_send_en   <= 1'b1;
        uart_send_data <= {4'b0,num};
    end
end
always @(posedge clk) begin
    if(!rst_n)begin
        start <= 1'b0;
    end
    else if(!key_start)begin
        start <= 1'b1;
    end
end
uart_send #(                          
    .CLK_FREQ       (CLK_FREQ),         
    .UART_BPS       (UART_BPS))         
u_uart_send(                 
    .sys_clk        (clk),
    .sys_rst_n      (rst_n),
    .uart_en        (uart_send_en),
    .uart_din       (uart_send_data),
    .uart_tx_busy   (uart_tx_busy),
    .uart_txd       (uart_txd)
    );

top i_top(
     .clk(clk)
    ,.rst_n(rst_n)
    ,.start(start)
    ,.ready(ready)
    ,.num(num)
);
endmodule
`timescale 1ns/10ps // time / precision
module tb; // Testbench
parameter BITLENGTH = 16,
          BITLEN = BITLENGTH - 1 ;
reg clk;
reg rst;
reg signed [BITLEN:0] x0; 
reg signed [BITLEN:0] y0; 
reg signed [BITLEN:0] z0;
wire [BITLEN:0] x;
wire [BITLEN:0] y;
wire [BITLEN:0] z;
// instantiate the DUT
Lorenz lorenz(clk,rst,x0,y0,z0,x,y,z);

initial begin
    clk <= 1'b0;
    x0 <= 16'b0000000000000010;
    y0 <= 16'b0000000000000011;
    z0 <= 16'b1000000000000011;
    forever begin
        #1ns;
        clk <= ~clk;
    end
end
initial begin
    rst = 1'b1;
    #10ns;
    rst <= 1'b0;
end
endmodule
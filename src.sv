`timescale 1ns/10ps
module Lorenz (clk,rst,x0,y0,z0,x,y,z);
    parameter BITLENGTH = 16,
          BITLEN = BITLENGTH - 1;
    input bit clk;
    input bit rst;
    input signed [BITLEN:0] x0;
    input signed [BITLEN:0] y0;
    input signed [BITLEN:0] z0;
    output reg [BITLEN:0] x;
    output reg [BITLEN:0] y;
    output reg [BITLEN:0] z;
reg [BITLEN:0] tmpx;
reg [BITLEN:0] tmpy;
reg [BITLEN:0] tmpz;
always @(posedge clk) begin
    if(rst) begin
        x <= x0;
        y <= y0;
        z <= z0;
    end
    else begin
        /*  This is will most assuredly not 
            meet timing constraint. Hence to 
            go beyond 'implementation' in the
            design flow, pipeline the Lorenz
            system.
        */
        x <= 10 * (tmpy - tmpx);
        y <= tmpx * (28 - tmpz) - tmpy;
        z <= tmpx * tmpy - tmpz * (8 / 3);
    end
    tmpx <= x;
    tmpy <= y;
    tmpz <= z;
end
endmodule
`timescale 1ns/1ns

module HiLo( HiOut, LoOut, MultuAns, clk, reset );
    // port
    input clk;
    input reset;
    input [63:0] MultuAns;
    output [31:0] HiOut;
    output [31:0] LoOut;

    // full 64bits temp product
    reg [63:0] HiLo;

    // deal with temp product
    always @( posedge clk or reset ) begin
        if ( reset ) begin
            HiLo = 64'b0 ;
        end
        else begin
            HiLo = MultuAns;
        end
    end

    // split to 32bits hi and lo
    assign HiOut = HiLo[63:32];
    assign LoOut = HiLo[31:0];
endmodule
`timescale 1ns/1ns

module alu_1bit(A, B, C, Less ,Signal, Sum, Cout);

//   Signal ( 6-bits)?
//   AND  : 36  100100
//   OR   : 37  100101
//   ADD  : 32  100000 
//   SUB  : 34  100010
//   SLT  : 42  101010

parameter AND = 3'b000;
parameter OR  = 3'b001;
parameter ADD = 3'b010;
parameter SUB = 3'b110;
parameter SLT = 3'b111;

input A, B, C, Less;
input [2:0] Signal;
output Cout;
output Sum;


wire binvert;
assign binvert = Signal[2];
wire S_AND;
wire S_OR;
wire S_FA, C_FA;
wire B_FA;
and and1(S_AND, A, B);
or or1(S_OR, A, B);

xor xor1(B_FA, B, binvert);
full_adder fa( .Sum(S_FA), .Cout(C_FA), .A(A), .B(B_FA), .Cin(C));

assign Cout = !Signal[1] ? 1'b0: C_FA;
assign Sum = (Signal == 3'b111) ? Less : (Signal==3'b001) ? S_OR : Signal[1] ? S_FA : S_AND;
endmodule
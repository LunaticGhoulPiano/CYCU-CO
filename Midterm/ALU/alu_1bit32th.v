`timescale 1ns/1ns

// for ALU 32bit(MSB), to deal with set
module alu_1bit32th( Sum, Cout, A, B, Cin, Less, Set, Signal );
    // opcode/control signal
    parameter AND = 6'b100100; // 36
    parameter OR  = 6'b100101; // 37
    parameter ADD = 6'b100000; // 32
    parameter SUB = 6'b100010; // 34
    parameter SLT = 6'b101010; // 42

    // port
    input A, B, Cin, Less;
    input [5:0] Signal;
    output Cout;
    output Sum;
    output Set;

    // carry
    wire binvert;
    assign binvert = Signal[1];
    wire S_AND, S_OR, S_FA, C_FA, B_FA;

    // instantantiate
    and and1( S_AND, A, B );
    or or1( S_OR, A, B );
    xor xor1( B_FA, B, binvert );
    full_adder fa( .Sum(S_FA), .Cout(C_FA), .A(A), .B(B_FA), .Cin(Cin) );

    assign Cout = (Signal[2]) ? 1'b0 : // AND, OR
                  C_FA; // ADD, SUB, SLT

    assign Sum = (Signal[3]) ? Less : // SLT
                 (Signal[2]) ? (Signal[0] ? S_OR : S_AND) : // OR, AND
                 S_FA; // ADD, SUB

    // set: MSB only
    assign Set = S_FA;
endmodule
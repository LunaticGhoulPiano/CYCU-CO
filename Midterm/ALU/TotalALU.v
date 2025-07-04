`timescale 1ns/1ns

module TotalALU( Output, dataA, dataB, Signal, clk, reset );
    // port
    input reset ;
    input clk ;
    input [31:0] dataA ;
    input [31:0] dataB ;
    input [5:0] Signal ;
    output [31:0] Output ;

    // carry
    wire [5:0]  SignaltoALU, SignaltoSHT, SignaltoMULTU, SignaltoMUX;
    wire [31:0] ALUOut, HiOut, LoOut, ShifterOut, dataOut;
    wire [63:0] MultuAns ;

    // opcode/control signal
    parameter AND = 6'b100100; // 36
    parameter OR  = 6'b100101; // 37
    parameter ADD = 6'b100000; // 32
    parameter SUB = 6'b100010; // 34
    parameter SLT = 6'b101010; // 42
    parameter SRL = 6'b000010; // 02
    parameter MULTU = 6'b011001; // 25
    parameter MFHI = 6'b010000; // 16
    parameter MFLO = 6'b010010; // 18
    
    // instantantiate
    ALUControl ALUControl( .SignaltoALU(SignaltoALU), .SignaltoSHT(SignaltoSHT), .SignaltoMULTU(SignaltoMULTU), .SignaltoMUX(SignaltoMUX), .Signal(Signal), .clk(clk) );
    ALU ALU( .dataOut(ALUOut), .dataA(dataA), .dataB(dataB), .Signal(SignaltoALU), .reset(reset) );
    Multiplier Multiplier( .dataOut(MultuAns), .dataA(dataA), .dataB(dataB), .Signal(SignaltoMULTU), .clk(clk), .reset(reset) );
    HiLo HiLo( .HiOut(HiOut), .LoOut(LoOut), .MultuAns(MultuAns), .clk(clk), .reset(reset) );
    Shifter Shifter( .dataOut(ShifterOut), .dataA(dataA), .shamt(dataB), .Signal(SignaltoSHT), .reset(reset) );
    MUX MUX( .dataOut(dataOut), .ALUOut(ALUOut), .HiOut(HiOut), .LoOut(LoOut), .Shifter(ShifterOut), .Signal(SignaltoMUX) );

    // result
    assign Output = dataOut ;
endmodule
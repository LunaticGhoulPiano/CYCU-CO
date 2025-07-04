`timescale 1ns/1ns

module ALUControl( SignaltoALU, SignaltoSHT, SignaltoMULTU, SignaltoMUX, Signal, clk );
    // port
    input clk;
    input [5:0] Signal;
    output [5:0] SignaltoALU;
    output [5:0] SignaltoSHT;
    output [5:0] SignaltoMULTU;
    output [5:0] SignaltoMUX;

    reg [5:0] temp;
    reg [6:0] counter;

    // opcode/control signal
    parameter AND = 6'b100100; // 36
    parameter OR  = 6'b100101; // 37
    parameter ADD = 6'b100000; // 32
    parameter SUB = 6'b100010; // 34
    parameter SLT = 6'b101010; // 42
    parameter SRL = 6'b000010; // 02
    parameter MULTU = 6'b011001; // 25
    
    // multiplier counter initialize
    always @( Signal ) begin
      if ( Signal == MULTU ) begin
        counter = 0 ;
      end
    end

    // deal with
    always @( posedge clk ) begin
      temp = Signal ;
      // multiplier
      if ( Signal == MULTU ) begin
        counter = counter + 1 ;
        if ( counter == 33 ) begin // counter = 0 ~ 32 => Multiplication, counter = 33 = > HiLo
          temp = 6'b111111 ; // to skip "Signal == MULTU" judgement
          counter = 0 ;
        end
      end
    end

    // result assign
    assign SignaltoALU = temp ;
    assign SignaltoSHT = temp ;
    assign SignaltoMULTU = temp ;
    assign SignaltoMUX = temp ;
endmodule
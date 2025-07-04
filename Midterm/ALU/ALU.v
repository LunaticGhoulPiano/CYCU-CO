`timescale 1ns/1ns

module ALU( dataOut, dataA, dataB, Signal, reset );
    // port
    input reset ;
    input [31:0] dataA ;
    input [31:0] dataB ;
    input [5:0] Signal ;
    output [31:0] dataOut ;

    // carry
    wire [31:0] carryOut;
    wire [31:0] temp ;
    wire set;

    // opcode/control signal
    parameter AND = 6'b100100; // 36
    parameter OR  = 6'b100101; // 37
    parameter ADD = 6'b100000; // 32
    parameter SUB = 6'b100010; // 34
    parameter SLT = 6'b101010; // 42

    // instantantiate
    alu_1bit alu1( .Sum(temp[0]), .Cout(carryOut[0]), .A(dataA[0]), .B(dataB[0]), .Cin(Signal[1]), .Less(set), .Signal(Signal) );
    alu_1bit alu2( .Sum(temp[1]), .Cout(carryOut[1]), .A(dataA[1]), .B(dataB[1]), .Cin(carryOut[0]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu3( .Sum(temp[2]), .Cout(carryOut[2]), .A(dataA[2]), .B(dataB[2]), .Cin(carryOut[1]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu4( .Sum(temp[3]), .Cout(carryOut[3]), .A(dataA[3]), .B(dataB[3]), .Cin(carryOut[2]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu5( .Sum(temp[4]), .Cout(carryOut[4]), .A(dataA[4]), .B(dataB[4]), .Cin(carryOut[3]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu6( .Sum(temp[5]), .Cout(carryOut[5]), .A(dataA[5]), .B(dataB[5]), .Cin(carryOut[4]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu7( .Sum(temp[6]), .Cout(carryOut[6]), .A(dataA[6]), .B(dataB[6]), .Cin(carryOut[5]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu8( .Sum(temp[7]), .Cout(carryOut[7]), .A(dataA[7]), .B(dataB[7]), .Cin(carryOut[6]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu9( .Sum(temp[8]), .Cout(carryOut[8]), .A(dataA[8]), .B(dataB[8]), .Cin(carryOut[7]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu10( .Sum(temp[9]), .Cout(carryOut[9]), .A(dataA[9]), .B(dataB[9]), .Cin(carryOut[8]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu11( .Sum(temp[10]), .Cout(carryOut[10]), .A(dataA[10]), .B(dataB[10]), .Cin(carryOut[9]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu12( .Sum(temp[11]), .Cout(carryOut[11]), .A(dataA[11]), .B(dataB[11]), .Cin(carryOut[10]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu13( .Sum(temp[12]), .Cout(carryOut[12]), .A(dataA[12]), .B(dataB[12]), .Cin(carryOut[11]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu14( .Sum(temp[13]), .Cout(carryOut[13]), .A(dataA[13]), .B(dataB[13]), .Cin(carryOut[12]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu15( .Sum(temp[14]), .Cout(carryOut[14]), .A(dataA[14]), .B(dataB[14]), .Cin(carryOut[13]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu16( .Sum(temp[15]), .Cout(carryOut[15]), .A(dataA[15]), .B(dataB[15]), .Cin(carryOut[14]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu17( .Sum(temp[16]), .Cout(carryOut[16]), .A(dataA[16]), .B(dataB[16]), .Cin(carryOut[15]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu18( .Sum(temp[17]), .Cout(carryOut[17]), .A(dataA[17]), .B(dataB[17]), .Cin(carryOut[16]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu19( .Sum(temp[18]), .Cout(carryOut[18]), .A(dataA[18]), .B(dataB[18]), .Cin(carryOut[17]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu20( .Sum(temp[19]), .Cout(carryOut[19]), .A(dataA[19]), .B(dataB[19]), .Cin(carryOut[18]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu21( .Sum(temp[20]), .Cout(carryOut[20]), .A(dataA[20]), .B(dataB[20]), .Cin(carryOut[19]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu22( .Sum(temp[21]), .Cout(carryOut[21]), .A(dataA[21]), .B(dataB[21]), .Cin(carryOut[20]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu23( .Sum(temp[22]), .Cout(carryOut[22]), .A(dataA[22]), .B(dataB[22]), .Cin(carryOut[21]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu24( .Sum(temp[23]), .Cout(carryOut[23]), .A(dataA[23]), .B(dataB[23]), .Cin(carryOut[22]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu25( .Sum(temp[24]), .Cout(carryOut[24]), .A(dataA[24]), .B(dataB[24]), .Cin(carryOut[23]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu26( .Sum(temp[25]), .Cout(carryOut[25]), .A(dataA[25]), .B(dataB[25]), .Cin(carryOut[24]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu27( .Sum(temp[26]), .Cout(carryOut[26]), .A(dataA[26]), .B(dataB[26]), .Cin(carryOut[25]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu28( .Sum(temp[27]), .Cout(carryOut[27]), .A(dataA[27]), .B(dataB[27]), .Cin(carryOut[26]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu29( .Sum(temp[28]), .Cout(carryOut[28]), .A(dataA[28]), .B(dataB[28]), .Cin(carryOut[27]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu30( .Sum(temp[29]), .Cout(carryOut[29]), .A(dataA[29]), .B(dataB[29]), .Cin(carryOut[28]), .Less(1'b0), .Signal(Signal) );
    alu_1bit alu31( .Sum(temp[30]), .Cout(carryOut[30]), .A(dataA[30]), .B(dataB[30]), .Cin(carryOut[29]), .Less(1'b0), .Signal(Signal) );
    alu_1bit32th alu32( .Sum(temp[31]), .Cout(carryOut[31]), .A(dataA[31]), .B(dataB[31]), .Cin(carryOut[30]), .Less(1'b0), .Set(set), .Signal(Signal) );

    // result
    assign dataOut = temp;
endmodule
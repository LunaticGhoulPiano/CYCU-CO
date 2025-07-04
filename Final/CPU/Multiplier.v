`timescale 1ns/1ns
module Multiplier( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset ;
input [31:0] dataA ; // Multiplicant
input [31:0] dataB ; // Multiplier
input [5:0] Signal ;
output [63:0] dataOut ;

//   Signal ( 6-bits )
//   MULT  : 25

reg [63:0] temp ;
reg [63:0] reg_dataA;
reg [31:0] reg_dataB;
reg [5:0] counter;
parameter MULT = 6'b011001;


always@(reset) begin
	if ( reset ) begin
		reg_dataA = 0;
		reg_dataB = 0;
		temp = 0;
		counter = 0;
	end
end

always@(Signal) begin
	if ( Signal == MULT ) begin
		reg_dataA = {32'b0,dataA};
		reg_dataB = dataB;
		counter = 0;
		temp = 0;
	end
end
always@( posedge clk ) begin

			if ( reg_dataB[0] ) temp = temp + reg_dataA;
			reg_dataA = reg_dataA << 1;
			reg_dataB = reg_dataB >> 1;
			counter = counter + 1;

			if ( counter == 33 ) begin
				temp = 0;
				counter = 0;
			end

end

assign dataOut = temp ;


endmodule
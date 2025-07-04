`timescale 1ns/1ns

module Multiplier( dataOut, dataA, dataB, Signal, clk, reset );
	// port
	input clk ;
	input reset ;
	input [31:0] dataA ; // Multiplicand
	input [31:0] dataB ; // Multiplier
	input [5:0] Signal ;
	output [63:0] dataOut ;

	// temp
	reg [63:0] temp ;
	reg [63:0] reg_dataA;
	reg [31:0] reg_dataB;
	reg [5:0] counter;

	parameter MULTU = 6'b011001;

	// reset
	always @( reset ) begin
		if ( reset ) begin
			reg_dataA = 0;
			reg_dataB = 0;
			temp = 0;
			counter = 0;
		end
	end

	// initialize
	always @( Signal ) begin
		if ( Signal == MULTU ) begin
			reg_dataA <= { 32'b0, dataA };
			reg_dataB <= dataB;
			counter <= 0;
			temp = 0;
		end
	end

	// procedure
	always @( posedge clk ) begin
		if ( counter < 33 ) begin
			if ( reg_dataB[0] ) begin // 1. test MPY[0]
				temp = temp + reg_dataA;
			end

			reg_dataA = reg_dataA << 1; // 2. Shift Multiplicand left 1 bit
			reg_dataB = reg_dataB >> 1; // 3. Shift Multiplier right 1 bit
			counter = counter + 1;
		end
	end

	assign dataOut = temp ;
endmodule
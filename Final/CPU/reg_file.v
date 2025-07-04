module reg_file( clk, RegWrite, RN1, RN2, WN, WD, RD1, RD2 );
	input clk;
	input RegWrite;
	input[4:0] RN1, RN2, WN;
	input[31:0] WD;
	output[31:0] RD1, RD2;

	reg[31:0] RD1, RD2;
	reg[31:0] file_array[31:1];
	reg[31:0] hilo[1:0] ;
	
	always @( RN1 or file_array[RN1] ) begin   

		if ( RN1 == 0 )
			RD1 = 32'd0;
		else
			RD1 = file_array[RN1];
	end

	always @( RN2 or file_array[RN2] ) begin
		if ( RN2 == 0 )
			RD2 = 32'd0;
		else
			RD2 = file_array[RN2];
	end

	always @( posedge clk ) begin
		if ( RegWrite && (WN != 0) ) begin
			file_array[WN] <= WD;
		end
	end
endmodule

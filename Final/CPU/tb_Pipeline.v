`timescale 1ns/1ns
module tb_Pipeline();
	reg clk, rst;
	mips_pipeline CPU( clk, rst );
	initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end

	initial begin
		rst = 1'b1;
		$readmemh("instr_mem.txt", CPU.InstrMem.mem_array );
		$readmemh("data_mem.txt", CPU.DataMem.mem_array );
		$readmemh("reg.txt", CPU.Reg_File.file_array );
		// $readmemh("hilo.txt", CPU.Reg_File.hilo );
		#10;
		rst = 1'b0;
	end
	
	always @( posedge clk ) begin
		$display( "%d, PC:", $time/10-1, CPU.pc );
		$display( "%d, wd: %d", $time/10-1, CPU.rfile_wd );
		if ( CPU.opcode == 6'd0 ) begin
			$display( "%d, rs, rt: %d", $time/10-1, CPU.Reg_File.RD1, CPU.Reg_File.RD2 );
			if ( CPU.funct == 6'd32 ) $display( "%d, ADD\n", $time/10-1 );
			else if ( CPU.funct == 6'd34 ) $display( "%d, SUB\n", $time/10-1 );
			else if ( CPU.funct == 6'd36 ) $display( "%d, AND\n", $time/10-1 );
			else if ( CPU.funct == 6'd37 ) $display( "%d, OR\n", $time/10-1 );
			else if ( CPU.funct == 6'd25 ) $display( "%d, MULTU\n", $time/10-1 ) ;
			else if ( CPU.funct == 6'd2 ) $display( "%d, SHIFTER\n", $time/10-1 ) ;
			else if ( CPU.funct == 6'd42 ) $display( "%d, SLT\n", $time/10-1 ) ;
			else if ( CPU.funct == 6'd16 ) $display( "%d, MFHI\n", $time/10-1 );
			else if ( CPU.funct == 6'd18 ) $display( "%d, MFLO\n", $time/10-1 );
			else if ( CPU.funct == 6'd0 ) begin
				if ( CPU.rs == 5'd0 && CPU.rt == 5'd0 && CPU.rd == 5'd0 && CPU.shamt == 5'd0 )
					$display( "%d, NOP\n", $time/10-1 );
			end
			$display( "%d, aluout: %d", $time/10-1, CPU.alu_out);
		end
		else if ( CPU.opcode == 6'd9 ) $display( "%d, ADDIU\n", $time/10-1 );
		else if ( CPU.opcode == 6'd35 ) $display( "%d, LW\n", $time/10-1 );
		else if ( CPU.opcode == 6'd43 ) $display( "%d, SW\n", $time/10-1 );
		else if ( CPU.opcode == 6'd4 ) $display( "%d, BEQ\n", $time/10-1 );
		else if ( CPU.opcode == 6'd2 ) $display( "%d, J\n", $time/10-1 );
	end
	
endmodule

module mips_pipeline( clk, rst );
	input clk, rst;
	
	wire[31:0] instr, temp_instr;
	
	wire [5:0] 	opcode, funct;
    wire [4:0] 	rs, rt, rd, shamt;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [27:0] jumpoffset;
	

	wire [4:0] 	rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_out, b_tgt, pc_next,
                pc, pc_incr, dmem_rdata, jump_addr, branch_addr, shift_out,
				cal_out;

	wire [31:0] ID_pc_incr;

	wire [31:0] EX_pc_incr, EX_rd1, EX_rd2, EX_ext, EX_jump_addr, EX_b_tgt;
	wire [4:0] EX_rt, EX_rd, EX_shamt;
	wire [5:0] EX_funct, EX_opcode;
	wire EX_RegDst, EX_ALUSrc, EX_MemRead, EX_MemWrite, EX_Branch, EX_RegWrite, EX_MemtoReg, EX_Jump;
	wire [1:0] EX_ALUOp;


	wire [31:0] MEM_pc_incr, MEM_b_tgt, MEM_cal, MEM_rd2, MEM_jump_addr;
	wire [4:0] MEM_wn;
	wire [5:0] MEM_opcode;
	wire MEM_zero, MEM_MemRead, MEM_MemWrite, MEM_Branch, MEM_RegWrite, MEM_MemtoReg, MEM_Jump;

	wire [31:0] WB_cal, WB_rd;
	wire [4:0]  WB_wn;
	wire WB_RegWrite, WB_MemtoReg;
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump;
    wire [1:0] ALUOp;
    wire [2:0] Operation;
	
    assign opcode = instr[31:26];
    assign rs = instr[25:21];
    assign rt = instr[20:16];
    assign rd = instr[15:11];
    assign shamt = instr[10:6];
    assign funct = instr[5:0];
    assign immed = instr[15:0];
    assign jumpoffset = instr[25:0];
    assign b_offset = EX_ext << 2;
	

	assign jump_addr = { ID_pc_incr[31:28], jumpoffset <<2 };


	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) );
	mux2 PCMUX( .sel(PCSrc), .a(pc_incr), .b(MEM_b_tgt), .y(branch_addr) );
	mux2 JMUX( .sel(MEM_Jump), .a(branch_addr), .b(MEM_jump_addr), .y(pc_next) );
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) );
	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'b0), .addr(pc), .rd(temp_instr) );
	IF_ID IF_ID( .clk(clk), .pc_incr(pc_incr), .rd(temp_instr), .pc_next(ID_pc_incr), .instr(instr) );

	
	control_pipeline CTL(.opcode(opcode), .funct(funct), .RegDst(RegDst), .ALUSrc(ALUSrc),
	 .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite),
	  .Branch(Branch), .Jump(Jump), .ALUOp(ALUOp));
	reg_file Reg_File( .clk(clk), .RegWrite(WB_RegWrite), .RN1(rs), .RN2(rt), .WN(WB_wn), .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed) );
	
	ID_EX  ID_EX (.clk(clk), .pc_incr(ID_pc_incr), .rd1(rfile_rd1), .rd2(rfile_rd2), .ext_in(extend_immed), .Jump_Dst_in(jump_addr), .shamt_in(shamt),
				  .rt(rt), .rd(rd), .ALUOp_in(ALUOp), .RegDst_in(RegDst), .ALUSrc_in(ALUSrc), .MemRead_in(MemRead), .MemWrite_in(MemWrite),
				  .Branch_in(Branch), .RegWrite_in(RegWrite), .MemtoReg_in(MemtoReg), .Jump_in(Jump), .funct_in(funct),.opcode_in(opcode),
				  .pc_next(EX_pc_incr), .rd1_out(EX_rd1), .rd2_out(EX_rd2), .ext_out(EX_ext), .Jump_Dst_out(EX_jump_addr), .shamt_out(EX_shamt),
				  .rt_out(EX_rt), .rd_out(EX_rd), .RegDst_out(EX_RegDst), .ALUSrc_out(EX_ALUSrc), .MemRead_out(EX_MemRead), .MemWrite_out(EX_MemWrite),
				  .Branch_out(EX_Branch), .RegWrite_out(EX_RegWrite), .MemtoReg_out(EX_MemtoReg), .Jump_out(EX_Jump), .ALUOp_out(EX_ALUOp), .funct_out(EX_funct),.opcode_out(EX_opcode) ) ;
		  

	add32 BRADD( .a(EX_pc_incr), .b(b_offset), .result(EX_b_tgt) );
	mux2 ALUMUX( .sel(EX_ALUSrc), .a(EX_rd2), .b(EX_ext), .y(alu_b) );
	mux2_5bit RFMUX( .sel(EX_RegDst), .a(EX_rt), .b(EX_rd), .y(rfile_wn) );
	alu_ctl ALUCTL( .ALUOp(EX_ALUOp), .Funct(EX_funct), .ALUOperation(Operation) );

	//Multiplier multiplier( .clk(clk), .dataA(EX_rd1), .dataB(alu_b), .Signal(EX_funct), .dataOut(product), .reset(rst) ) ;
	// if I have time I will do that.
	
	ALU alu( .dataA(EX_rd1), .dataB(alu_b), .Signal(Operation), .dataOut(alu_out), .zero(Zero) );
	Shifter shifter( .dataA(EX_rd2), .dataB(EX_shamt), .Signal(EX_funct), .dataOut(shift_out), .reset(rst) );
		
	mux2_cal CALMUX( .funct(EX_funct), .alu_out(alu_out), .shift_out(shift_out), .dataOut(cal_out) ) ;
	
	EX_MEM 	EX_MEM(.clk(clk), .pc_incr(EX_pc_incr), .branch_addr_in(EX_b_tgt), .CAL_in(cal_out), .rd2(EX_rd2), .wn_in(rfile_wn), .Zero_in(Zero), .MemRead_in(EX_MemRead), .MemWrite_in(EX_MemWrite),
				  .Branch_in(EX_Branch), .RegWrite_in(EX_RegWrite), .MemtoReg_in(EX_MemtoReg), .Jump_in(EX_Jump), .jump_addr_in(EX_jump_addr), .opcode_in(EX_opcode),
				  .pc_next(MEM_pc_incr), .branch_addr_out(MEM_b_tgt), .CAL_out(MEM_cal), .rd2_out(MEM_rd2), .wn_out(MEM_wn), .Zero_out(MEM_zero), .MemRead_out(MEM_MemRead), .MemWrite_out(MEM_MemWrite),
				  .Branch_out(MEM_Branch), .RegWrite_out(MEM_RegWrite), .MemtoReg_out(MEM_MemtoReg), .Jump_out(MEM_Jump), .jump_addr_out(MEM_jump_addr ), .opcode_out(MEM_opcode) ) ;



	and(PCSrc, MEM_Branch, MEM_zero);
	memory DataMem( 	.clk(clk), .MemRead(MEM_MemRead), .MemWrite(MEM_MemWrite), .wd(MEM_rd2), .addr(MEM_cal), .rd(dmem_rdata) ) ;
	MEM_WB MEM_WB(	.clk(clk), .CAL_in(MEM_cal), .rd(dmem_rdata), .wn(MEM_wn), .RegWrite_in(MEM_RegWrite), .MemtoReg_in(MEM_MemtoReg),
					.CAL_out( WB_cal), .rd_out(WB_rd), .wn_out(WB_wn), .RegWrite_out(WB_RegWrite), .MemtoReg_out(WB_MemtoReg) ) ;


	
	mux2 WRMUX( .sel(WB_MemtoReg), .a(WB_cal), .b(WB_rd), .y(rfile_wd) ) ;
endmodule

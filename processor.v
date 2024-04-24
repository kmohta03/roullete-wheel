/**
 * READ THIS DESCRIPTION!
 *
 * This is your processor module that will contain the bulk of your code submission. You are to implement
 * a 5-stage pipelined processor in this module, accounting for hazards and implementing bypasses as
 * necessary.
 *
 * Ultimately, your processor will be tested by a master skeleton, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file, Wrapper.v, acts as a small wrapper around your processor for this purpose. Refer to Wrapper.v
 * for more details.
 *
 * As a result, this module will NOT contain the RegFile nor the memory modules. Study the inputs 
 * very carefully - the RegFile-related I/Os are merely signals to be sent to the RegFile instantiated
 * in your Wrapper module. This is the same for your memory elements. 
 *
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for RegFile
    ctrl_writeReg,                  // O: Register to write to in RegFile
    ctrl_readRegA,                  // O: Register to read from port A of RegFile
    ctrl_readRegB,                  // O: Register to read from port B of RegFile
    data_writeReg,                  // O: Data to write to for RegFile
    data_readRegA,                  // I: Data from port A of RegFile
    data_readRegB                   // I: Data from port B of RegFile
	 
	);

	// Control signals
	input clock, reset;
	
	// Imem
    output [31:0] address_imem;
	input [31:0] q_imem;

	// Dmem
	output [31:0] address_dmem, data;
	output wren;
	input [31:0] q_dmem;

	// Regfile
	output ctrl_writeEnable;
	output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	output [31:0] data_writeReg;
	input [31:0] data_readRegA, data_readRegB;

	/* YOUR CODE STARTS HERE */
    wire stall; 
    wire [31:0] noOp;
    assign noOp = 32'b0; 

    // -------- STAGE 1 ----------- //
    
    wire [31:0] next_instruction_addy, current_instruction_addy, pcAdd1, bFlush, setX, instruction, pc_bjCheck;
    wire borjFlushCheck, bltbneTaken;
    assign next_instruction_addy = reset ? 32'b0 : (sw_check) ? current_instruction_addy : pcAdd1;

    assign pc_bjCheck = (bltbneTaken) ? controlAdder : ((dx_opcode == 5'b00011) | (dx_opcode == 5'b00001) | ((dx_opcode == 5'b10110) & ~(DX_B == 32'b0))) ? jT : (dx_opcode == 5'b00100) ? jR : (stall_check) ? current_instruction_addy : next_instruction_addy;
    

    register pc_reg(!clock, pc_bjCheck, !stall, reset, current_instruction_addy);
    alu pc_alu(current_instruction_addy, 32'd1, 5'b0, 5'b0, pcAdd1, , ,);

    assign setX = {15'b001011111000000, q_imem[16:0]};
    wire sw_check; 
    assign sw_check = ((q_imem[31:27] == 5'b00111 && FD_IR[31:27] == 5'b00111) && ~fiveNoOp);
    assign instruction = !(q_imem[31:27] == 5'b10101) ?  q_imem : setX;

    assign address_imem = current_instruction_addy;
    


    // wire [31:0] next_instruction_addy, current_instruction_addy, pcAdd1, bFlush, setX, instruction, pc_bjCheck;
    // wire borjFlushCheck, bltbneTaken; 
    // assign next_instruction_addy = reset ? 32'b0 : pcAdd1;

    // assign address_imem = current_instruction_addy;

    // // Stage 1
    // register pc_reg(!clock, pc_bjCheck, !stall, reset, current_instruction_addy); // Stores address of current instruction

    // alu pc_alu(current_instruction_addy, 32'd1, 5'b0, 5'b0, pcAdd1, , ,); // Adds 1 to PC, then sends directly to FD_PC

    // assign setX = (q_imem[31:27] == 5'b10101) ? {15'b001011111000000, q_imem[16:0]} : q_imem; // setx or everything else

    // assign instruction = setX;

    // // Jump stuff
    // assign pc_bjCheck = (bltbneTaken) ? controlAdder :
    //                     ((dx_opcode == 5'b00011) | (dx_opcode == 5'b00001) | ((dx_opcode == 5'b10110) & ~(DX_B == 32'b0))) ? jT :
    //                     (dx_opcode == 5'b00100) ? jR :
    //                     next_instruction_addy;
    
    //add new PC_in variable when looking at jal instructions
    wire [5:0] noOpCount;
    wire isNoOp;
    assign isNoOp = (q_imem == 32'b0);
    wire noOpCheck; 
    counter_6bit nopCount(clock, isNoOp, (reset | ~isNoOp), noOpCount);

    assign noOpCheck = (noOpCount == 6'd6);

    wire enableStorage;
    assign enableStorage = noOpCheck;

    wire fiveNoOp;

    dffe_ref permanentStorage(
        .q(fiveNoOp),
        .d(1'b1), // We want to set the storage to 1 when enabled
        .clk(clock),
        .en(enableStorage),
        .clr(reset) // Use the reset signal to clear the storage
    );


    // --------- STAGE 2 -----------//
    wire [4:0] opcode, rd, rs, rt, shamt, alu_op;
    wire [31:0] immediate, A, B, fd_flush;
    wire rType, iType, jiType, jiiType;

    wire [31:0] FD_pc_next_instruction, FD_IR;

    register fd_pc_next_instruction_addy(!clock, pcAdd1, !stall, reset, FD_pc_next_instruction);

    assign fd_flush = (borjFlushCheck || sw_check) ? noOp : instruction;

    register fd_ir(!clock, fd_flush, !stall, reset, FD_IR);

    instruction_decoder fd_decode(FD_IR, opcode, rd, rs, rt, shamt, alu_op, immediate, rType, iType, jiType, jiiType);


    wire stall_check = 1'b0; 

    //assign stall_check = ((dx_opcode == 5'b01000) && ((rs == dx_rd) || (rt == dx_rd)) && (opcode != 5'b00111)) ? 1'b1 : 1'b0;
    //assign stall_check = (dx_opcode == 5'b00111 && opcode == 5'b00111) ? 1'b1 : 1'b0;

    assign ctrl_readRegA = rs;
    assign ctrl_readRegB = rt;

    assign A = data_readRegA;
    assign B = (opcode == 5'b00101) ? immediate : data_readRegB;

    // --------- STAGE 3 -----------//
    wire [31:0] DX_A, DX_B, DX_pc_next_instruction, DX_IR, dx_flush_check;
    register dx_A (!clock, A, !stall, reset, DX_A);
    register dx_B (!clock, B, !stall, reset, DX_B);
    register dx_pc_next_instruction_addy(!clock, FD_pc_next_instruction, !stall, reset, DX_pc_next_instruction);
    
    assign dx_flush_check = borjFlushCheck ? noOp : FD_IR;
    register dx_ir(!clock, dx_flush_check, !stall, reset, DX_IR);

    wire [4:0] dx_opcode, dx_rd, dx_rs, dx_rt, dx_shamt, dx_alu_op;
    wire [31:0] dx_immediate, alu_result;
    wire dx_rType, dx_iType, dx_jiType, dx_jiiType, alu_overflow;

    instruction_decoder dx_decode(DX_IR, dx_opcode, dx_rd, dx_rs, dx_rt, dx_shamt, dx_alu_op, dx_immediate, dx_rType, dx_iType, dx_jiType, dx_jiiType);
    
    
    //bypassing logic
    wire bypass_aluA_mw, bypass_aluA_xm, bypass_aluB_mw, bypass_aluB_xm;
    wire bypass_aluA_jr_mw, bypass_aluA_jr_xm, bypass_aluA_branch_mw, bypass_aluA_branch_xm;
    wire bypass_aluB_branch_mw, bypass_aluB_branch_xm;

    // assign bypass_aluA_mw = ((mw_opcode == 5'b00000) | (mw_opcode == 5'b00101) | (mw_opcode == 5'b00011) | (mw_opcode == 5'b01000)) && // ALU ops, jal, lw
    //                         (mw_rd == dx_rs) && (mw_rd != 5'b00000); // rd = rs and rd != 0

    // assign bypass_aluA_xm = ((xm_opcode == 5'b00000) | (xm_opcode == 5'b00101) | (xm_opcode == 5'b00011) | (xm_opcode == 5'b01000)) && // ALU ops, jal, lw
    //                         (xm_rd == dx_rs) && (xm_rd != 5'b00000); // rd = rs and rd != 0

    // // Bypassing logic for aluB
    // assign bypass_aluB_mw = ((mw_opcode == 5'b00000) | (mw_opcode == 5'b00101) | (mw_opcode == 5'b00011) | (mw_opcode == 5'b01000)) && // ALU ops, jal, lw
    //                         (mw_rd == dx_rt) && (mw_rd != 5'b00000); // rd = rt and rd != 0

    // assign bypass_aluB_xm = ((xm_opcode == 5'b00000) | (xm_opcode == 5'b00101) | (xm_opcode == 5'b00011) | (xm_opcode == 5'b01000)) && // ALU ops, jal, lw
    //                         (xm_rd == dx_rt) && (xm_rd != 5'b00000); // rd = rt and rd != 0

    // // Assign bypass values
    // wire[31:0] bypass_aluA, bypass_aluB;
    // assign bypass_aluA = (bypass_aluA_xm) ? XM_O :
    //                     (bypass_aluA_mw) ? data_writeReg :
    //                     DX_A;


    wire bypass_branch_aluA_mw, bypass_branch_aluA_xm, bypass_branch_aluB_mw, bypass_branch_aluB_xm;
    wire is_bne_or_blt;
    assign is_bne_or_blt = (dx_opcode == 5'b00010) | (dx_opcode == 5'b00110); // bne or blt

    assign bypass_branch_aluA_mw = is_bne_or_blt && // bne or blt
                                (mw_rd == dx_rs) && (mw_rd != 5'b00000); // rd = rs and rd != 0

    assign bypass_branch_aluA_xm = is_bne_or_blt && // bne or blt
                                    (xm_rd == dx_rs) && (xm_rd != 5'b00000); // rd = rs and rd != 0

    assign bypass_branch_aluB_mw = is_bne_or_blt && // bne or blt
                                    (mw_rd == dx_rt) && (mw_rd != 5'b00000); // rd = rt and rd != 0

    assign bypass_branch_aluB_xm = is_bne_or_blt && // bne or blt
                                    (xm_rd == dx_rt) && (xm_rd != 5'b00000); // rd = rt and rd != 0

    //jr branching 

    assign bypass_aluA_jr_mw = (dx_opcode == 5'b00100) && // jr
                           (mw_rd == dx_rs) && (mw_rd != 5'b00000); // rd = rs and rd != 0

    assign bypass_aluA_jr_xm = (dx_opcode == 5'b00100) && // jr
                           (xm_rd == dx_rs) && (xm_rd != 5'b00000); // rd = rs and rd != 0

    //memory bypassing 
// // Bypassing from Memory to Execute stage (for lw)
    wire bypass_lw_xm_B, bypass_lw_mw_B, bypass_lw_xm_A, bypass_lw_mw_A;
    assign bypass_lw_xm_B = (xm_opcode == 5'b01000) && // lw
                        (xm_rd == dx_rt) && (xm_rd != 5'b00000); // rd = rt and rd != 0

    assign bypass_lw_mw_B = (mw_opcode == 5'b01000) && // lw
                        (mw_rd == dx_rt) && (mw_rd != 5'b00000); // rd = rt and rd != 0
    
    assign bypass_lw_xm_A = (xm_opcode == 5'b01000) &&       // lw
                        (xm_rd == dx_rs) && (xm_rd != 5'b00000); // rd = rt and rd != 0

    assign bypass_lw_mw_A = (mw_opcode == 5'b01000) && // lw
                        (mw_rd == dx_rs) && (mw_rd != 5'b00000); // rd = rt and rd != 0
    

//     // Bypassing from Memory to Memory stage (for sw)
//     wire bypass_sw_xm, bypass_sw_mw;
//     assign bypass_sw_xm = (xm_opcode == 5'b00111) && // sw
//                         (xm_rt == dx_rt) && (xm_rt != 5'b00000); // rt = rt and rt != 0

//     assign bypass_sw_mw = (mw_opcode == 5'b00111) && // sw
//                         (mw_rt == dx_rt) && (mw_rt != 5'b00000); 
    
//     assign bypass_aluB = (dx_opcode == 5'b00101 | opcode == 5'b00111 | opcode == 5'b01000) ? dx_immediate : // addi
//                     (bypass_aluB_xm || bypass_lw_xm) ? XM_O :
//                     (bypass_aluB_mw || bypass_lw_mw) ? data_writeReg :
//                     DX_B;


    wire [31:0] bypass_branch_aluA, bypass_branch_aluB;


    //wire bypass_aluA_mw, bypass_aluA_xm, bypass_aluB_mw, bypass_aluB_xm;
    //wire bypass_aluA_jr_mw, bypass_aluA_jr_xm, bypass_aluA_branch_mw, bypass_aluA_branch_xm;
    //wire bypass_aluB_branch_mw, bypass_aluB_branch_xm;

    assign bypass_aluA_mw = ((mw_opcode == 5'b00000) | (mw_opcode == 5'b00101)) && // ALU ops
                            (mw_rd == dx_rs) && (mw_rd != 5'b00000); // rd = rs and rd != 0

    assign bypass_aluA_xm = ((xm_opcode == 5'b00000) | (xm_opcode == 5'b00101)) && // ALU ops
                            (xm_rd == dx_rs) && (xm_rd != 5'b00000); // rd = rs and rd != 0

    assign bypass_aluB_mw = ((mw_opcode == 5'b00000) | (mw_opcode == 5'b00101)) && // ALU ops
                            (mw_rd == dx_rt) && (mw_rd != 5'b00000); // rd = rt and rd != 0

    assign bypass_aluB_xm = ((xm_opcode == 5'b00000) | (xm_opcode == 5'b00101)) && // ALU ops
                            (xm_rd == dx_rt) && (xm_rd != 5'b00000); // rd = rt and rd != 0

    // jr bypassing
    assign bypass_aluA_jr_mw = (dx_opcode == 5'b00100) && // jr
                            (mw_rd == dx_rs) && (mw_rd != 5'b00000); // rd = rs and rd != 0

    assign bypass_aluA_jr_xm = (dx_opcode == 5'b00100) && // jr
                            (xm_rd == dx_rs) && (xm_rd != 5'b00000); // rd = rs and rd != 0

    // bne/blt bypassing
    //wire is_bne_or_blt;
    assign is_bne_or_blt = (dx_opcode == 5'b00010) | (dx_opcode == 5'b00110); // bne or blt

    assign bypass_aluA_branch_mw = is_bne_or_blt && // bne or blt
                                (mw_rd == dx_rs) && (mw_rd != 5'b00000); // rd = rs and rd != 0

    assign bypass_aluA_branch_xm = is_bne_or_blt && // bne or blt
                                (xm_rd == dx_rs) && (xm_rd != 5'b00000); // rd = rs and rd != 0

    assign bypass_aluB_branch_mw = is_bne_or_blt && // bne or blt
                                (mw_rd == dx_rt) && (mw_rd != 5'b00000); // rd = rt and rd != 0

    assign bypass_aluB_branch_xm = is_bne_or_blt && // bne or blt
                                (xm_rd == dx_rt) && (xm_rd != 5'b00000); // rd = rt and rd != 0

    wire [31:0] bypass_aluA, bypass_aluB;

    assign bypass_aluA = (bypass_aluA_jr_xm | bypass_aluA_branch_xm | bypass_aluA_xm) ? XM_O :
                        (bypass_aluA_jr_mw | bypass_aluA_branch_mw | bypass_aluA_mw) ? data_writeReg :
                        DX_A;

    assign bypass_aluB = ((dx_opcode == 5'b00101) | (dx_opcode == 5'b00111) | (dx_opcode == 5'b01000) |
                        (dx_opcode == 5'b00010) | (dx_opcode == 5'b00110)) ? dx_immediate :
                        (bypass_aluB_xm | bypass_aluB_branch_xm) ? XM_O :
                        (bypass_aluB_mw | bypass_aluB_branch_mw) ? data_writeReg :
                        DX_B;

    //assign aluA = bypass_aluA;
    //assign aluB = bypass_aluB;


    wire [31:0] aluA, aluB;
    assign aluA = (bypass_lw_xm_A) ? q_dmem : (bypass_lw_mw_A) ? data_writeReg : bypass_aluA;
    assign aluB = (dx_opcode == 5'b00111) ? dx_immediate : (bypass_lw_xm_B) ? q_dmem : (bypass_lw_mw_B) ? data_writeReg : bypass_aluB;

    assign bypass_branch_aluA = (bypass_lw_xm_A) ? q_dmem : (bypass_branch_aluA_xm || bypass_aluA_jr_xm) ? XM_O : 
                                (bypass_branch_aluA_mw || bypass_aluA_jr_mw || bypass_lw_mw_A) ? data_writeReg :
                                DX_A;

    assign bypass_branch_aluB = (bypass_lw_xm_B) ? q_dmem : (bypass_branch_aluB_xm)  ? XM_O : 
                                (bypass_branch_aluB_mw || bypass_lw_mw_B) ? data_writeReg :
                                DX_B;

    //alu
    wire [4:0] aluOP;
    assign aluOP = dx_iType ? 5'b00000 : dx_alu_op;
    alu arithmetics(aluA, aluB, aluOP, dx_shamt, alu_result, , , alu_overflow);
    //multdiv 

    wire multOp, divOp;

    wire multffOut, divffOut, controlMULT, controlDIV;

    wire [31:0] multdivResult, final_result;
    wire multdivException, multdivReady;

    assign multOp = (dx_opcode == 5'b00000) && (dx_alu_op == 5'b00110);
    assign divOp = (dx_opcode == 5'b00000) && (dx_alu_op == 5'b00111);

    assign stall = (multdivReady || ~(multOp || divOp)) ? 1'b0 : 1'b1;

    dffe_ref multff (.q(multffOut), .d(multOp & ~multdivReady), .clk(~clock), .en(1'b1), .clr(reset));
    dffe_ref divff (.q(divffOut), .d(divOp & ~multdivReady), .clk(~clock), .en(1'b1), .clr(reset));

    assign controlMULT = multOp && ~multffOut;
    assign controlDIV = divOp && ~divffOut;

    multdiv multdiv_arithmetics (aluA, aluB, controlMULT, controlDIV, ~clock, multdivResult, multdivException, multdivReady);
    //branch calculations 
    wire isNotEqual, isLessThan;
    wire[31:0] controlAdder, jT, jR; 

    alu alubranch(dx_immediate, DX_pc_next_instruction, 5'b00000, 5'b0, controlAdder, , ,);
    alu logicCheck(bypass_branch_aluA, bypass_branch_aluB, 5'b00001, 5'b0, , isNotEqual, isLessThan, );
    
    assign jT = {5'b0, DX_IR[26:0]};
    assign jR = (xm_opcode == 5'b01000 && xm_rd == dx_rd) ? q_dmem : bypass_branch_aluA;

    assign bltbneTaken = ((dx_opcode == 5'b00010) & isNotEqual) | ((dx_opcode == 5'b00110) & isLessThan);
    assign borjFlushCheck = (bltbneTaken | (dx_opcode == 5'b00001)| (dx_opcode == 5'b00011)| (dx_opcode == 5'b00100) | (dx_opcode == 5'b10110));
    //custom instruction
    wire [31:0] properties;
    number_properties getProperties(aluA, properties);
    
    //exception handling 
    wire overflowAdd, overflowAddi, overflowSub, overflowMult, overflowDiv; 
    assign overflowMult = (dx_opcode == 5'b00000) & (dx_alu_op == 5'b00110) & multdivException;
    assign overflowDiv = (dx_opcode == 5'b00000) & (dx_alu_op == 5'b00111) & multdivException;
    assign overflowAdd = (dx_opcode == 5'b00000) & (dx_alu_op == 5'b00000) & alu_overflow;
    assign overflowAddi = (dx_opcode == 5'b00101) & alu_overflow;
    assign overflowSub = (dx_opcode == 5'b00000) & (dx_alu_op == 5'b00001) & alu_overflow;

    wire exceptionFlag;
    assign exceptionFlag = overflowAdd || overflowAddi || overflowSub || overflowMult || overflowDiv;
    wire [16:0] immediateFlagValue;
    assign immediateFlagValue = (overflowAdd) ? 17'b1 : (overflowAddi) ? 17'b10 : (overflowSub) ? 17'b11 : (overflowMult) ? 17'b100 : (overflowDiv) ? 17'b101 : 17'b0;

    wire [31:0] updated_instruction; 
    assign updated_instruction = (exceptionFlag) ? {15'b001011111000000, immediateFlagValue} : DX_IR;

    assign final_result = (exceptionFlag) ? {{15{immediateFlagValue[16]}}, immediateFlagValue} : (dx_opcode == 5'b00011) ? DX_pc_next_instruction : (multOp | divOp) ? multdivResult : (dx_opcode == 5'b01110) ? properties : alu_result;              

    // --------- STAGE 4 -----------//
    wire [31:0] XM_O, XM_B, XM_IR;
    register xm_O (!clock, final_result, !stall, reset, XM_O); //CHANGE BACK
    register xm_B (!clock, DX_B, !stall, reset, XM_B); 
    //add exception logic if not already added in stage 3
    register xm_ir(!clock, updated_instruction, !stall, reset, XM_IR); // CHANGE BACK
    wire [4:0] xm_opcode, xm_rd, xm_rs, xm_rt, xm_shamt, xm_alu_op;
    wire [31:0] xm_immediate;
    wire xm_rType, xm_iType, xm_jiType, xm_jiiType;

    instruction_decoder xm_decode(XM_IR, xm_opcode, xm_rd, xm_rs, xm_rt, xm_shamt, xm_alu_op, xm_immediate, xm_rType, xm_iType, xm_jiType, xm_jiiType);
   
    assign wren = (xm_opcode == 5'b00111) ? 1'b1 : 1'b0;
    assign address_dmem = XM_O; 
    assign data = ((xm_rd == ((mw_opcode == 5'b00011) ? 5'b11111 : mw_rd))) ? data_writeReg : XM_B;
    
    // add memory stuff for sw and lw
    

    // --------- STAGE 5 -----------//
    
    //EDIT BASED ON MW instruction decode
    wire [31:0] MW_O, MW_IR, MW_D, MW_B;
    register mw_O (!clock, XM_O, !stall, reset, MW_O);
    register mw_D (!clock, q_dmem, !stall, reset, MW_D);
    register mw_B (!clock, XM_B, !stall, reset, MW_B);
    register mw_IR (!clock, XM_IR, !stall, reset, MW_IR);

    wire [4:0] mw_opcode, mw_rd, mw_rs, mw_rt, mw_shamt, mw_alu_op;
    wire [31:0] mw_immediate;
    wire mw_rType, mw_iType, mw_jiType, mw_jiiType;

    instruction_decoder mw_decode(MW_IR, mw_opcode, mw_rd, mw_rs, mw_rt, mw_shamt, mw_alu_op, mw_immediate, mw_rType, mw_iType, mw_jiType, mw_jiiType);

    assign ctrl_writeReg = (mw_opcode == 5'b00011) ? 5'b11111 : mw_rd;
    
    assign data_writeReg = (mw_opcode == 5'b01000) ? MW_D : MW_O;
    assign ctrl_writeEnable = ((mw_opcode == 5'b00011) || (mw_opcode == 5'b01000) || (mw_opcode == 5'b00000) || (mw_opcode == 5'b00101) || (mw_opcode == 5'b01110)) ? 1'b1 : 1'b0;
	
	/* END CODE */

endmodule

module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;

    wire overflowCheckAdd, overflowCheckSub;
    // add your code here:
    wire [31:0] adder;
    wire add_c32;
    adder_32 add_32(data_operandA, data_operandB, 1'b0 , adder, add_c32, overflowCheckAdd);

    wire [31:0] sub;
    wire sub_c32;
    subtract_32 sub_32(data_operandA, data_operandB, sub, sub_c32, overflowCheckSub); 

    wire [31:0] and_out;
    and_gate and_32(data_operandA, data_operandB, and_out);

    wire [31:0] or_out;
    or_gate or_32(data_operandA, data_operandB, or_out);

    wire [31:0] sll_out;
    sll_32 sll_32(data_operandA, ctrl_shiftamt, sll_out); 

    wire [31:0] sra_out;
    sra_32 sra_32(data_operandA, ctrl_shiftamt, sra_out); 


    assign isNotEqual = (sub) ? 1'b1 : 1'b0;

    // wire not_msb, not_overflow; 

    // not notmsb(not_msb, sub[31]); 
    // not notoverflow(not_overflow, sub_c32); 

    // wire negativesub;
    // and nsub(negativesub, sub[31], not_overflow); 

    // wire psubover;
    // and psub(psubover, not_msb, sub_c32); 
    
    // wire tempo;
    // or ile(tempo, psubover, negativesub);
    // not ilenot(isLessThan, tempo);

    
    wire overflowAdd, overflowSub;
    xor xor1(overflowAdd, overflowCheckAdd, add_c32);
    xor xor2(overflowSub, overflowCheckSub, sub_c32);

    wire [2:0] opcode = {ctrl_ALUopcode[2], ctrl_ALUopcode[1], ctrl_ALUopcode[0]};
    assign overflow = (opcode) ? overflowSub : overflowAdd;


    wire msb_sub = sub[31];  // Most significant bit (sign bit of the result)
    wire not_msb_sub;
    wire not_overflow;

    // Inverters for MSB and overflow flag
    not not1(not_msb_sub, msb_sub);
    not not2(not_overflow, overflow);

    // If result is negative and no overflow, then A < B
    wire negativesub;
    and and1(negativesub, msb_sub, not_overflow);

    // If result is non-negative and there is overflow, then A < B
    wire psubover;
    and and2(psubover, not_msb_sub, overflow);

    // Combine conditions
    or or1(isLessThan, negativesub, psubover);
    
    mux_8 mux(data_result, opcode, adder, sub, and_out, or_out, sll_out, sra_out, 32'b0, 32'b0);

endmodule
module subtract_32(data_operandA, data_operandB, out, c32, overflowCheck);

    input [31:0] data_operandA, data_operandB; 
    wire [31:0] ndata_operandB;
    output [31:0] out;
    output c32, overflowCheck;

    not not1(ndata_operandB[0], data_operandB[0]);
    not not2(ndata_operandB[1], data_operandB[1]);
    not not3(ndata_operandB[2], data_operandB[2]);
    not not4(ndata_operandB[3], data_operandB[3]);
    not not5(ndata_operandB[4], data_operandB[4]);
    not not6(ndata_operandB[5], data_operandB[5]);
    not not7(ndata_operandB[6], data_operandB[6]);
    not not8(ndata_operandB[7], data_operandB[7]);
    not not9(ndata_operandB[8], data_operandB[8]);
    not not10(ndata_operandB[9], data_operandB[9]);
    not not11(ndata_operandB[10], data_operandB[10]);
    not not12(ndata_operandB[11], data_operandB[11]);
    not not13(ndata_operandB[12], data_operandB[12]);
    not not14(ndata_operandB[13], data_operandB[13]);
    not not15(ndata_operandB[14], data_operandB[14]);
    not not16(ndata_operandB[15], data_operandB[15]);
    not not17(ndata_operandB[16], data_operandB[16]);
    not not18(ndata_operandB[17], data_operandB[17]);
    not not19(ndata_operandB[18], data_operandB[18]);
    not not20(ndata_operandB[19], data_operandB[19]);
    not not21(ndata_operandB[20], data_operandB[20]);
    not not22(ndata_operandB[21], data_operandB[21]);
    not not23(ndata_operandB[22], data_operandB[22]);
    not not24(ndata_operandB[23], data_operandB[23]);
    not not25(ndata_operandB[24], data_operandB[24]);
    not not26(ndata_operandB[25], data_operandB[25]);
    not not27(ndata_operandB[26], data_operandB[26]);
    not not28(ndata_operandB[27], data_operandB[27]);
    not not29(ndata_operandB[28], data_operandB[28]);
    not not30(ndata_operandB[29], data_operandB[29]);
    not not31(ndata_operandB[30], data_operandB[30]);
    not not32(ndata_operandB[31], data_operandB[31]);

    adder_32 sub_32(data_operandA, ndata_operandB, 1'b1, out, c32, overflowCheck);

endmodule
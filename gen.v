module gen(data_operandA, data_operandB, g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31);

    input [31:0] data_operandA, data_operandB; 
    output g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31;
    
    and and1(g0, data_operandA[0], data_operandB[0]);
    and and2(g1, data_operandA[1], data_operandB[1]);
    and and3(g2, data_operandA[2], data_operandB[2]);
    and and4(g3, data_operandA[3], data_operandB[3]);
    and and5(g4, data_operandA[4], data_operandB[4]);
    and and6(g5, data_operandA[5], data_operandB[5]);
    and and7(g6, data_operandA[6], data_operandB[6]);
    and and8(g7, data_operandA[7], data_operandB[7]);
    and and9(g8, data_operandA[8], data_operandB[8]);
    and and10(g9, data_operandA[9], data_operandB[9]);
    and and11(g10, data_operandA[10], data_operandB[10]);
    and and12(g11, data_operandA[11], data_operandB[11]);
    and and13(g12, data_operandA[12], data_operandB[12]);
    and and14(g13, data_operandA[13], data_operandB[13]);
    and and15(g14, data_operandA[14], data_operandB[14]);
    and and16(g15, data_operandA[15], data_operandB[15]);
    and and17(g16, data_operandA[16], data_operandB[16]);
    and and18(g17, data_operandA[17], data_operandB[17]);
    and and19(g18, data_operandA[18], data_operandB[18]);
    and and20(g19, data_operandA[19], data_operandB[19]);
    and and21(g20, data_operandA[20], data_operandB[20]);
    and and22(g21, data_operandA[21], data_operandB[21]);
    and and23(g22, data_operandA[22], data_operandB[22]);
    and and24(g23, data_operandA[23], data_operandB[23]);
    and and25(g24, data_operandA[24], data_operandB[24]);
    and and26(g25, data_operandA[25], data_operandB[25]);
    and and27(g26, data_operandA[26], data_operandB[26]);
    and and28(g27, data_operandA[27], data_operandB[27]);
    and and29(g28, data_operandA[28], data_operandB[28]);
    and and30(g29, data_operandA[29], data_operandB[29]);
    and and31(g30, data_operandA[30], data_operandB[30]);
    and and32(g31, data_operandA[31], data_operandB[31]);

endmodule 
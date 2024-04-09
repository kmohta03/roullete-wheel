module prop(data_operandA, data_operandB, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31);

    input [31:0] data_operandA, data_operandB; 
    output p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31;
    
    or or1(p0, data_operandA[0], data_operandB[0]);
    or or2(p1, data_operandA[1], data_operandB[1]);
    or or3(p2, data_operandA[2], data_operandB[2]);
    or or4(p3, data_operandA[3], data_operandB[3]);
    or or5(p4, data_operandA[4], data_operandB[4]);
    or or6(p5, data_operandA[5], data_operandB[5]);
    or or7(p6, data_operandA[6], data_operandB[6]);
    or or8(p7, data_operandA[7], data_operandB[7]);
    or or9(p8, data_operandA[8], data_operandB[8]);
    or or10(p9, data_operandA[9], data_operandB[9]);
    or or11(p10, data_operandA[10], data_operandB[10]);
    or or12(p11, data_operandA[11], data_operandB[11]);
    or or13(p12, data_operandA[12], data_operandB[12]);
    or or14(p13, data_operandA[13], data_operandB[13]);
    or or15(p14, data_operandA[14], data_operandB[14]);
    or or16(p15, data_operandA[15], data_operandB[15]);
    or or17(p16, data_operandA[16], data_operandB[16]);
    or or18(p17, data_operandA[17], data_operandB[17]);
    or or19(p18, data_operandA[18], data_operandB[18]);
    or or20(p19, data_operandA[19], data_operandB[19]);
    or or21(p20, data_operandA[20], data_operandB[20]);
    or or22(p21, data_operandA[21], data_operandB[21]);
    or or23(p22, data_operandA[22], data_operandB[22]);
    or or24(p23, data_operandA[23], data_operandB[23]);
    or or25(p24, data_operandA[24], data_operandB[24]);
    or or26(p25, data_operandA[25], data_operandB[25]);
    or or27(p26, data_operandA[26], data_operandB[26]);
    or or28(p27, data_operandA[27], data_operandB[27]);
    or or29(p28, data_operandA[28], data_operandB[28]);
    or or30(p29, data_operandA[29], data_operandB[29]);
    or or31(p30, data_operandA[30], data_operandB[30]);
    or or32(p31, data_operandA[31], data_operandB[31]);

endmodule

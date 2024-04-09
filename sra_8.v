module sra_8(out, data_operandA);

    output [31:0] data_operandA;
    input [31:0] out;

    assign data_operandA[0] = out[8];
    assign data_operandA[1] = out[9];
    assign data_operandA[2] = out[10];
    assign data_operandA[3] = out[11];
    assign data_operandA[4] = out[12];
    assign data_operandA[5] = out[13];
    assign data_operandA[6] = out[14];
    assign data_operandA[7] = out[15];
    assign data_operandA[8] = out[16];
    assign data_operandA[9] = out[17];
    assign data_operandA[10] = out[18];
    assign data_operandA[11] = out[19];
    assign data_operandA[12] = out[20];
    assign data_operandA[13] = out[21];
    assign data_operandA[14] = out[22];
    assign data_operandA[15] = out[23];
    assign data_operandA[16] = out[24];
    assign data_operandA[17] = out[25];
    assign data_operandA[18] = out[26];
    assign data_operandA[19] = out[27];
    assign data_operandA[20] = out[28];
    assign data_operandA[21] = out[29];
    assign data_operandA[22] = out[30];
    assign data_operandA[23] = out[31];
    assign data_operandA[24] = out[31];
    assign data_operandA[25] = out[31];
    assign data_operandA[26] = out[31];
    assign data_operandA[27] = out[31];
    assign data_operandA[28] = out[31];
    assign data_operandA[29] = out[31];
    assign data_operandA[30] = out[31];
    assign data_operandA[31] = out[31];

endmodule
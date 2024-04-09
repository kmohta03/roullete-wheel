module fadder_8(data_operandA, data_operandB, cin, g0, g1, g2, g3, g4, g5, g6, p0, p1, p2, p3, p4, p5, p6, out, overflowCheck);

    input[7:0] data_operandA, data_operandB; 
    input cin, g0, g1, g2, g3, g4, g5, g6, p0, p1, p2, p3, p4, p5, p6;
    output [7:0] out; 
    output overflowCheck;

    wire cin, c1, c2, c3, c4, c5, c6, c7;

    carry_8 carry(data_operandA, data_operandB, cin, c1, c2, c3, c4, c5, c6, c7, g0, g1, g2, g3, g4, g5, g6, p0, p1, p2, p3, p4, p5, p6);

    assign overflowCheck = c7;

    wire out0, out1, out2, out3, out4, out5, out6, out7;

    xor xor0(out[0], data_operandA[0], data_operandB[0], cin); 
    xor xor1(out[1], data_operandA[1], data_operandB[1], c1);
    xor xor2(out[2], data_operandA[2], data_operandB[2], c2); 
    xor xor3(out[3], data_operandA[3], data_operandB[3], c3);
    xor xor4(out[4], data_operandA[4], data_operandB[4], c4); 
    xor xor5(out[5], data_operandA[5], data_operandB[5], c5);
    xor xor6(out[6], data_operandA[6], data_operandB[6], c6); 
    xor xor7(out[7], data_operandA[7], data_operandB[7], c7);

endmodule
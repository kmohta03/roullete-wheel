module and_gate(data_operandA, data_operandB, out);

    input [31:0] data_operandA, data_operandB;
    output [31:0] out; 

    wire g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31;
    gen gen(data_operandA, data_operandB, g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31);
    assign out = {g31, g30, g29, g28, g27, g26, g25, g24, g23, g22, g21, g20, g19, g18, g17, g16, g15, g14, g13, g12, g11, g10, g9, g8, g7, g6, g5, g4, g3, g2, g1, g0};

endmodule
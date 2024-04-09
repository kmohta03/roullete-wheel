module div_reg(clock, currentAQ, oldAQ);

    input clock;
    input [63:0] currentAQ; 

    output [63:0] oldAQ;
    wire [63:0] output_reg;


    reg_64 div(clock, currentAQ, 1'b1, 1'b0, output_reg);

    assign oldAQ = output_reg;

endmodule

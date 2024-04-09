module sll_32 (data_operandA, shamt, out);

    input [31:0] data_operandA;
    input [4:0] shamt;
    output [31:0] out;
    wire [31:0] out1, out2, out3, out4, out5;
    wire [31:0] noshiftout1, noshiftout2, noshiftout3, noshiftout4;

    sll_16 sll_16(data_operandA, out1);
    assign noshiftout1 = (shamt[4]) ? out1 : data_operandA;

    sll_8 sll_8(noshiftout1, out2);
    assign noshiftout2 = (shamt[3]) ? out2 : noshiftout1;

    sll_4 sll_4(noshiftout2, out3);
    assign noshiftout3 = (shamt[2]) ? out3 : noshiftout2;

    sll_2 sll_2(noshiftout3, out4);
    assign noshiftout4 = (shamt[1]) ? out4 : noshiftout3;

    sll_1 sll_1(noshiftout4, out5);
    assign out = (shamt[0]) ? out5 : noshiftout4;

endmodule
module div(clock, ctrl_DIV, dividend, divisor, currentAQ);
    input clock, ctrl_DIV;
    input [31:0] divisor, dividend;
    output [63:0] currentAQ;

    wire [63:0] newAQ, oldAQ, shiftedAQ, init, subResult, addResult;
    wire temp1, temp2, temp3, subNegative;

    wire [31:0] negDividend, negDivisor, actualDivisor, actualDividend;
    alu dividendneg(32'b0, dividend, 5'b00001, 5'b0, negDividend, temp1, temp2, temp3);
    alu divisorneg(32'b0, divisor, 5'b00001, 5'b0, negDivisor, temp1, temp2, temp3);

    assign actualDividend = dividend[31] ? negDividend : dividend; 
    assign actualDivisor = divisor[31] ? negDivisor : divisor;

    assign shiftedAQ = {oldAQ[62:0], 1'b0};

    alu subtract(shiftedAQ[63:32], actualDivisor, 5'b00001, 5'b0, subResult[63:32], temp1, subNegative, temp3);
    assign subResult[31:0] = shiftedAQ[31:0];

    alu add(subResult[63:32], actualDivisor, 5'b00000, 5'b0, addResult[63:32], temp1, temp2, temp3);
    assign addResult[31:0] = shiftedAQ[31:0];

    wire [63:0] restoreCheck;
    assign restoreCheck = subNegative ? addResult : subResult;

    assign newAQ = {restoreCheck[63:1], ~subNegative};

    assign init = {32'b0, actualDividend};

    wire [63:0] inputAQ;
    assign inputAQ = ctrl_DIV ? init : newAQ;

    div_reg reg_div(clock, inputAQ, oldAQ);

    assign currentAQ = oldAQ;
endmodule

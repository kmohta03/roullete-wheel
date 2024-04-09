module ecd(
    input wire [31:0] dividend,
    input wire [31:0] divisor,
    output wire [31:0] result,
    output wire specialCaseDetected
);
    wire isNotEqual,isNotEqual2, temp;
    wire [31:0] specialCaseOutput = 32'hC0000000; 

    alu dividendneg(32'h80000000, dividend, 5'b00001, 5'b0, , isNotEqual, , );

    alu divisorneg(32'd2, divisor, 5'b00001, 5'b0, , isNotEqual2, , );


    assign specialCaseDetected = ~isNotEqual & ~isNotEqual2;
    wire [31:0] genericDivisionResult = 32'd0; 
    assign result = specialCaseDetected ? specialCaseOutput : genericDivisionResult;

endmodule

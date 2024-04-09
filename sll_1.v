module sll_1(data_operandA, out); 
    
    input [31:0] data_operandA; 
    output [31:0] out;
    assign out = {data_operandA[30:0], 1'b0};

endmodule
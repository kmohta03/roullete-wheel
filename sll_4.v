module sll_4(data_operandA, out); 
    
    input [31:0] data_operandA; 
    output [31:0] out;
    assign out = {data_operandA[27:0], 4'b0};

endmodule
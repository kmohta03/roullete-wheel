module sll_16(data_operandA, out); 
    
    input [31:0] data_operandA; 
    output [31:0] out;
    assign out = {data_operandA[15:0], 16'b0};

endmodule
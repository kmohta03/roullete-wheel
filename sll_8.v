module sll_8(data_operandA, out); 
    
    input [31:0] data_operandA; 
    output [31:0] out;
    assign out = {data_operandA[23:0], 8'b0};

endmodule
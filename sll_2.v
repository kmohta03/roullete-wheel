module sll_2(data_operandA, out); 
    
    input [31:0] data_operandA; 
    output [31:0] out;
    assign out = {data_operandA[29:0], 2'b0};

endmodule
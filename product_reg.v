module product_reg(clock, current_product, previous_product, ctrl_MULT);

    input clock, ctrl_MULT; 
    input [64:0] current_product; 

    output [64:0] previous_product;
    wire [64:0] output_reg;


    reg_65 product(clock, current_product, 1'b1, 1'b0, output_reg);

    assign previous_product = $signed(output_reg) >>> 2;

endmodule

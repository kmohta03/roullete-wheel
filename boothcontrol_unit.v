module booth(clock, ctrl_MULT, multiplicand, multiplier, product);

    input clock, ctrl_MULT;
    input [31:0] multiplicand, multiplier; 
    output [63:0] product; 

    wire [64:0] current_product;
    wire [64:0] previous_product;
    wire [31:0] a_leftshift, add, add2, sub, sub2;
    wire temp1, temp2, temp3;
    wire [31:0] add_input;
    wire [2:0] last3;

    assign a_leftshift = $signed(multiplicand) <<< 1; 

    wire [31:0] alu_operand; 

    assign alu_operand = ctrl_MULT ? 32'b0 : previous_product[64:33];

    // ALU operations
    alu addA(multiplicand, alu_operand, 5'b0, 5'b0, add, temp1, temp2, temp3);
    alu add2A(a_leftshift, alu_operand, 5'b0, 5'b0, add2, temp1, temp2, temp3); 
    alu subA(alu_operand, multiplicand, 5'b00001, 5'b0, sub, temp1, temp2, temp3);
    alu sub2A(alu_operand, a_leftshift, 5'b00001, 5'b0, sub2, temp1, temp2, temp3);

    wire [2:0] mult3;
    assign mult3 = {multiplier[2:0], 1'b0};
    assign last3 = ctrl_MULT ? mult3 : previous_product[2:0];

    mux_8 booth(add_input, last3, alu_operand, add, add, add2, sub2, sub, sub, alu_operand);
    wire [31:0] upper_half;
    assign upper_half = add_input;
    wire temp; 
    and and1(temp, ctrl_MULT, clock, (last3[2] | last3[1] | last3[0]));
    // Compute next value of current_product
    assign current_product[64:33] = upper_half;
    assign current_product[32:1] = ctrl_MULT  ? multiplier: previous_product[32:1]; 
    assign current_product[0] = (ctrl_MULT) ? 1'b0 : previous_product[0];

    product_reg reg_product(clock, current_product, previous_product, ctrl_MULT);

    // Assign product output
    assign product = previous_product[64:1];

endmodule

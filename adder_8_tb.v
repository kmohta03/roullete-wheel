`timescale 1 ns / 100 ps

module adder_8_tb;

    ////////// Module Instantiation ////////
    // inputs to the module (reg)

    wire [7:0] data_operandA, data_operandB;
    wire cin; 
    // outputs of the module (wire)
    
    wire [7:0] out;
    // Instantiate the module to test

    reg [6:0] g;
    reg [6:0] p;


    //adder_8 add_8(data_operandA, data_operandB, cin, g[0], g[1], g[2], g[3], g[4], g[5], g[6], p[0], p[1], p[2], p[3], p[4], p[5], p[6], out);
    adder_8 add_8(data_operandA, data_operandB, cin, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, out);    
    integer i; 
    assign cin = 0;
    assign {data_operandA} = i[31:0];
    assign {data_operandB} = i[31:0];
    ////////// Input Initialization ////////
    // Initialize the inputs and specify the runtime
    initial begin
        // Initialize the inputs to 0
        for (i = 0; i < 7; i = i + 1) begin
        // Perform bitwise AND and OR operations
        g[i] = data_operandA[i] & data_operandB[i];
        p[i] = data_operandA[i] | data_operandB[i];

        // Insert delays or other checks as needed
        #10; // Example delay
        end
        
        for (i = 0; i < 10; i = i+1) begin
            #10
            $display("A:%d, B:%d| Sum:%d", data_operandA, data_operandB, out);
        end 
        $finish;
    end

    // Print the inputs and outputs whenever inputs change
endmodule






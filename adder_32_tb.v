`timescale 1 ns / 100 ps

module adder_32_tb;

    ////////// Module Instantiation ////////
    // inputs to the module (reg)

    wire [31:0] A, B;
    wire c0; 
    // outputs of the module (wire)
    
    wire [31:0] out;
    wire c32;
    // Instantiate the module to test

    adder_32 add_32(A, B, c0, out, c32);
    integer i; 
    assign c0 = 0;
    // assign {A} = i[31:0];
    // assign {B} = i[31:0];
    assign A = 128; 
    assign B = 127;
    //assign B = 11111111111111111111111111111111;
    ////////// Input Initialization ////////
    // Initialize the inputs and specify the runtime
    initial begin
        // Initialize the inputs to 0
        
        for (i = 0; i < 10; i = i+1) begin
            #10
            
            $display("A:%d, B:%d| Sum:%d, Overflow:%d", A, B, out, c32);
        end 
        
        $finish;
    end

    // Print the inputs and outputs whenever inputs change
endmodule






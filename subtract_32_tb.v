`timescale 1 ns / 100 ps

module subtract_32_tb;

    ////////// Module Instantiation ////////
    // inputs to the module (reg)

    wire [31:0] A, B;

    // outputs of the module (wire)
    
    wire [31:0] out;
    // Instantiate the module to test

    subtract_32 sub_32(A, B, out);
    integer i; 

    assign {B, A} = i[31:0];
    ////////// Input Initialization ////////
    // Initialize the inputs and specify the runtime
    initial begin
        // Initialize the inputs to 0
        
        for (i = 0; i < 10; i = i+1) begin
            #10
            $display("A:%d, B:%d| Sum:%d", A, B, out);
        end 
        
        $finish;
    end

    // Print the inputs and outputs whenever inputs change
endmodule






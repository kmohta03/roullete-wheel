`timescale 1 ns / 100 ps

module or_tb;

    ////////// Module Instantiation ////////
    // inputs to the module (reg)

    wire [31:0] A, B;
    
    // outputs of the module (wire)
    wire [31:0] out;
    or_gate or1(A, B, out);
    integer i; 

    assign {A, B} = i[31:0];
    //assign {B} = i[31:0];
    ////////// Input Initialization ////////
    // Initialize the inputs and specify the runtime
    initial begin
        // Initialize the inputs to 0
        
        for (i = 0; i < 10; i = i+1) begin
            #10
            $display("A:%b, B:%b| GOut: %b", A, B, out);
        end    
        $finish;
    end

    // Print the inputs and outputs whenever inputs change
endmodule



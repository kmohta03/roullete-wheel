`timescale 1 ns / 100 ps

module gen_tb;

    ////////// Module Instantiation ////////
    // inputs to the module (reg)

    wire [31:0] A, B;
    
    // outputs of the module (wire)
    wire g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31;  
    // Instantiate the module to test
    gen gen(A, B, g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31);
    integer i; 

    assign {A} = i[31:0];
    assign {B} = i[31:0];
    ////////// Input Initialization ////////
    // Initialize the inputs and specify the runtime
    initial begin
        // Initialize the inputs to 0
        
        for (i = 0; i < 10; i = i+1) begin
            #10
            $display("A:%b, B:%b| GOut: ", A, B);
            $display(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31);
        end 
        $finish;
    end

    // Print the inputs and outputs whenever inputs change
endmodule






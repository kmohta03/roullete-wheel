module Ps2Controller(     
	input clk, 	
	input reset, 	
	inout ps2_clk,
	inout ps2_data, 
	latchedRX);
	
    wire [7:0] tx_data, rx_data;
    wire write_data, read_data, busy, err;
    Ps2Interface keyboardInput(ps2_clk ,ps2_data, clk, reset,tx_data, write_data, rx_data, read_data, busy, err);
    output reg [7:0] latchedRX;
    
    always @(read_data) begin
        latchedRX <= rx_data;
    end
    
endmodule
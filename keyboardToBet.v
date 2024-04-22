module keyboardToBet(input [7:0] keyboardValue, output reg [7:0] betOpcode)
    always @(keyboardValue) begin
    case (keyboardValue)
        8'h0E: betOpcode = 6'b000000; // 0
        8'h16: betOpcode = 6'b000011; // 3
        8'h1E: betOpcode = 6'b000110; // 6
        8'h26: betOpcode = 6'd9; // 9
        8'h25: betOpcode = 6'd12; // 12
        8'h2E: betOpcode = 6'd15; // 15
        8'h36: betOpcode = 6'd18; // 18
        8'h3D: betOpcode = 6'd21; // 21
        8'h3E: betOpcode = 6'd24; // 24
        8'h46: betOpcode = 6'd27 // 27
        8'h45: betOpcode = 6'd30 // 30
        8'h4E: betOpcode = 6'd33 // 33
        8'h55: betOpcode = 6'd36 // 36
        8'h66: betOpcode = 6'b1011111 // 2:1 top row
        


        default: betOpcode = 6'b111111; // Default case
    endcase
end
endmodule
module keyboardToBet(input [7:0] keyboardValue, output reg [7:0] betOpcode);
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
        8'h46: betOpcode = 6'd27; // 27
        8'h45: betOpcode = 6'd30; // 30
        8'h4E: betOpcode = 6'd33; // 33
        8'h55: betOpcode = 6'd36; // 36
        8'h66: betOpcode = 6'b101111; // 2:1 top row

        8'h0D: betOpcode = 6'd37; //00
        8'h15: betOpcode = 6'd2; // 2
        8'h1D: betOpcode = 6'd5; // 5
        8'h24: betOpcode = 6'd8; // 8
        8'h2D: betOpcode = 6'd11; // 11
        8'h2C: betOpcode = 6'd14; //14
        8'h35: betOpcode = 6'd17; //17
        8'h3C: betOpcode = 6'd20; //20
        8'h43: betOpcode = 6'd23; //23
        8'h44: betOpcode = 6'd26; //26
        8'h4D: betOpcode = 6'd29; //29
        8'h54: betOpcode = 6'd32; //32 
        8'h5B: betOpcode = 6'd35; // 35
        8'h5D: betOpcode = 6'b110000; // 2:1 middle 

        8'h58: betOpcode = 6'd1; // 1
        8'h1C: betOpcode = 6'd4; // 4
        8'h1B: betOpcode = 6'd7; // 7
        8'h23: betOpcode = 6'd10; // 10
        8'h2B: betOpcode = 6'd13; // 13
        8'h34: betOpcode = 6'd16; // 16
        8'h33: betOpcode = 6'd19; // 19
        8'h3B: betOpcode = 6'd22; // 22
        8'h42: betOpcode = 6'd25; // 25 
        8'h4B: betOpcode = 6'd28; // 28
        8'h4C: betOpcode = 6'd31; // 31
        8'h52: betOpcode = 6'd34; // 34 
        8'h5A: betOpcode = 6'b110001; //2:1 bottom

        8'h12: betOpcode = 6'b101010; // 1-18
        8'h22: betOpcode = 6'b101100; // 1-12
        8'h32: betOpcode = 6'b101101; // 13-24
        8'h41: betOpcode = 6'b101110; // 25-36
        8'h59: betOpcode = 6'b101011; // 19-36

        8'h1F: betOpcode = 6'b100110; // RED
        8'h11: betOpcode = 6'b101001; // ODD
        8'h29: betOpcode = 6'b111110; // SPIN
        8'h2F: betOpcode = 6'b101000; // EVEN (menus button)
        8'h14: betOpcode = 6'b100111; // BLACK (control right)


        default: betOpcode = 6'b111111; // Default case
    endcase
end
endmodule
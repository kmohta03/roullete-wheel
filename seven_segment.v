module seven_segment_display(
  input wire [3:0] count,
  output reg [6:0] seg,
  output reg [7:0] an
);

always @(*) begin
  case (count)
    4'd0: seg = 7'b1000000; // 0
    4'd2: seg = 7'b1111001; // 1
    4'd4: seg = 7'b0100100; // 2
    4'd6: seg = 7'b0110000; // 3
    4'd8: seg = 7'b0011001; // 4
    4'd10: seg = 7'b0010010; // 5
    4'd12: seg = 7'b0000010; // 6
    4'd14: seg = 7'b1111000; // 7
    4'd16: seg = 7'b0000000; // 8
    4'd18: seg = 7'b0010000; // 9
    default: seg = 7'b1111111; // blank
  endcase
  
  an = 8'b11111110; // Enable the first digit (rightmost)
end

endmodule
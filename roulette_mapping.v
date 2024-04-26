module roulette_mapping (
  input [5:0] roulette_number,
  output reg [5:0] binary_number
);

  always @* begin
    case (roulette_number)
      6'd0: binary_number = 6'd0;
      6'd28: binary_number = 6'd1;
      6'd9: binary_number = 6'd2;
      6'd26: binary_number = 6'd3;
      6'd30: binary_number = 6'd4;
      6'd11: binary_number = 6'd5;
      6'd7: binary_number = 6'd6;
      6'd20: binary_number = 6'd7;
      6'd32: binary_number = 6'd8;
      6'd17: binary_number = 6'd9;
      6'd5: binary_number = 6'd10;
      6'd22: binary_number = 6'd11;
      6'd34: binary_number = 6'd12;
      6'd15: binary_number = 6'd13;
      6'd3: binary_number = 6'd14;
      6'd24: binary_number = 6'd15;
      6'd36: binary_number = 6'd16;
      6'd13: binary_number = 6'd17;
      6'd1: binary_number = 6'd18;
      6'd0: binary_number = 6'd19;
      6'd27: binary_number = 6'd20;
      6'd10: binary_number = 6'd21;
      6'd25: binary_number = 6'd22;
      6'd29: binary_number = 6'd23;
      6'd12: binary_number = 6'd24;
      6'd8: binary_number = 6'd25;
      6'd19: binary_number = 6'd26;
      6'd31: binary_number = 6'd27;
      6'd18: binary_number = 6'd28;
      6'd6: binary_number = 6'd29;
      6'd21: binary_number = 6'd30;
      6'd33: binary_number = 6'd31;
      6'd16: binary_number = 6'd32;
      6'd4: binary_number = 6'd33;
      6'd23: binary_number = 6'd34;
      6'd35: binary_number = 6'd35;
      6'd14: binary_number = 6'd36;
      6'd2: binary_number = 6'd37;
      default: binary_number = 6'd0;
    endcase
  end

endmodule
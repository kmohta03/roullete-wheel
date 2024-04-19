module led_decoder (
    input wire [5:0] led_number,
    output reg [2:0] mux_select_0,
    output reg [2:0] mux_select_1,
    output reg [2:0] mux_select_2,
    output reg [2:0] mux_select_3,
    output reg [2:0] mux_select_4, 
    output reg [2:0] mux_select_5
);

    always @(*) begin
        case (led_number)
            6'd0: begin
                mux_select_0 <= 3'b001;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd1: begin
                mux_select_0 <= 3'b010;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd2: begin
                mux_select_0 <= 3'b011;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end            
            6'd3: begin
                mux_select_0 <= 3'b100;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd4: begin
                mux_select_0 <= 3'b101;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd5: begin
                mux_select_0 <= 3'b110;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd6: begin
                mux_select_0 <= 3'b111;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd7: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b001;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd8: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b010;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd9: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b011;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd10: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b100;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd11: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b101;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd12: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b110;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd13: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b111;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd14: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b001;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd15: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b010;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd16: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b011;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd17: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b100;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd18: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b101;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd19: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b110;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd20: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b111;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd21: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b001;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd22: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b010;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd23: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b011;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd24: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b100;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd25: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b101;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd26: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b110;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd27: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b111;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b000;
            end
            6'd28: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b001;
                mux_select_5 <= 3'b000;
            end
            6'd29: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b010;
                mux_select_5 <= 3'b000;
            end
            6'd30: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b011;
                mux_select_5 <= 3'b000;
            end
            6'd31: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b100;
                mux_select_5 <= 3'b000;
            end
            6'd32: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b101;
                mux_select_5 <= 3'b000;
            end
            6'd33: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b110;
                mux_select_5 <= 3'b000;
            end
            6'd34: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b111;
                mux_select_5 <= 3'b000;
            end
            6'd35: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b001;
            end
            6'd36: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b010;
            end
            6'd36: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b011;
            end
            6'd37: begin
                mux_select_0 <= 3'b000;
                mux_select_1 <= 3'b000;
                mux_select_2 <= 3'b000;
                mux_select_3 <= 3'b000;
                mux_select_4 <= 3'b000;
                mux_select_5 <= 3'b100;
            end
        endcase 
        end
endmodule
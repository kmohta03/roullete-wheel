module motor_control (
    input clk,
    input check,
    input [31:0] reg_19,
    input [31:0] reg_20,
    input [31:0] reg_21,
    input [31:0] reg_22,
    output reg [7:0] motorposition1,
    output reg [7:0] motorposition2,
    output reg [7:0] motorposition3,
    output reg [7:0] motorposition4
);

reg [7:0] count_19, count_20, count_21, count_22;
reg [31:0] delay_count;

parameter CLK_FREQ = 100_000_000; // Assuming a 100 MHz clock frequency
parameter HALF_SEC_COUNT = CLK_FREQ / 2; // Half-second delay count

always @(posedge clk & check) begin
    if(check) begin
        if (delay_count < HALF_SEC_COUNT) begin
            delay_count <= delay_count + 1;
        end else begin
            delay_count <= 0;
            
            // Check register $19
            if (reg_19 != 0) begin
                if (count_19 < reg_19) begin
                    motorposition1 <= (motorposition1 == 90) ? 20 : 90;
                    count_19 <= count_19 + 1;
                end
            end else begin
                count_19 <= 0;
            end
            
            // Check register $20
            if (reg_20 != 0) begin
                if (count_20 < reg_20) begin
                    motorposition2 <= (motorposition2 == 90) ? 20 : 90;
                    count_20 <= count_20 + 1;
                end
            end else begin
                count_20 <= 0;
            end
            
            // Check register $21
            if (reg_21 != 0) begin
                if (count_21 < reg_21) begin
                    motorposition3 <= (motorposition3 == 90) ? 20 : 90;
                    count_21 <= count_21 + 1;
                end
            end else begin
                count_21 <= 0;
            end
            
            // Check register $22
            if (reg_22 != 0) begin
                if (count_22 < reg_22) begin
                    motorposition4 <= (motorposition4 == 90) ? 20 : 90;
                    count_22 <= count_22 + 1;
                end
            end else begin
                count_22 <= 0;
            end
        end
    end 
end

endmodule
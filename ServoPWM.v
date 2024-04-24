module ServoPWM #(
    parameter
    PULSE_FREQ = 50, // Servo motor operates at 50 Hz
    SYS_FREQ = 100 // FPGA clock frequency in MHz
)(
    input clk, // System clock
    input reset, // Reset signal
    input [6:0] duty_cycle, // Duty cycle (0-99)
    output reg servo_signal // PWM signal for servo motor
);

// Local parameters
localparam PULSE_PERIOD = SYS_FREQ * 1_000_000 / PULSE_FREQ; // Pulse period in clock cycles
localparam MIN_PULSE = SYS_FREQ * 500; // Minimum pulse width (0.3 ms)
localparam MAX_PULSE = SYS_FREQ * 2500; // Maximum pulse width (2.5 ms)
localparam PULSE_RANGE = MAX_PULSE - MIN_PULSE;

// Counter for generating PWM signal
reg [$clog2(PULSE_PERIOD)-1:0] counter;

// Calculate pulse width based on duty cycle
wire [$clog2(MAX_PULSE)-1:0] pulse_width;
assign pulse_width = MIN_PULSE + (duty_cycle * PULSE_RANGE / 100);

// Generate PWM signal
always @(posedge clk or posedge reset) begin
    if (reset) begin
        counter <= 0;
        servo_signal <= 0;
    end else begin
        if (counter < PULSE_PERIOD - 1) begin
            counter <= counter + 1;
            if (counter < pulse_width)
                servo_signal <= 1;
            else
                servo_signal <= 0;
        end else begin
            counter <= 0;
            servo_signal <= 0;
        end
    end
end

endmodule
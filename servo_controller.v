module servo_controller (
    input clk,
    input reset,
    input [6:0] duty_cycle,
    output servo_signal
);

// Instantiate the ServoPWM module
ServoPWM #(
    .PULSE_FREQ(50),
    .SYS_FREQ(100)
) servo_pwm (
    .clk(clk),
    .reset(reset),
    .duty_cycle(duty_cycle),
    .servo_signal(servo_signal)
);

endmodule
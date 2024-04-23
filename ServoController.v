module ServoController(
    input clk,
    input reset,
    input[7:0] position, // Servo position (-90 to 90 degrees)
    output servo_signal);
    // Map position to duty cycle
    wire[9:0] duty_cycle = ((position + 90) * 1023) / 180;

    // Instantiate the modified PWMSerializer module
    PWMSerializer pwm_serializer (
        .clk(clk),
        .reset(reset),
        .duty_cycle(duty_cycle),
        .signal(servo_signal)
    );
    
endmodule




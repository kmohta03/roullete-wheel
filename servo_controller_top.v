module servo_controller_top (
    input clk,
    input reset,
    input [6:0] duty_cycle_1,
    input [6:0] duty_cycle_2,
    input [6:0] duty_cycle_3,
    input [6:0] duty_cycle_4,
    input [6:0] duty_cycle_5,
    output jc_1,
    output jc_2,
    output jc_3,
    output jc_4,
    output jc_7
);

// Instantiate the servo_controller modules for each motor
servo_controller servo_ctrl_1 (
    .clk(clk),
    .reset(~reset),
    .duty_cycle(duty_cycle_1),
    .servo_signal(jc_1)
);

servo_controller servo_ctrl_2 (
    .clk(clk),
    .reset(~reset),
    .duty_cycle(duty_cycle_2),
    .servo_signal(jc_2)
);

servo_controller servo_ctrl_3 (
    .clk(clk),
    .reset(~reset),
    .duty_cycle(duty_cycle_3),
    .servo_signal(jc_3)
);

servo_controller servo_ctrl_4 (
    .clk(clk),
    .reset(~reset),
    .duty_cycle(duty_cycle_4),
    .servo_signal(jc_4)
);

servo_controller servo_ctrl_5 (
    .clk(clk),
    .reset(~reset),
    .duty_cycle(duty_cycle_5),
    .servo_signal(jc_7)
);

endmodule
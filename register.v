module register(clk, new_data, write_enable, reset, reg_data); 

    input clk, write_enable, reset; 
    input [31:0] new_data; 
    output [31:0] reg_data;

    dffe_ref bit1(reg_data[0], new_data[0], clk, write_enable, reset);
    dffe_ref bit2(reg_data[1], new_data[1], clk, write_enable, reset);
    dffe_ref bit3(reg_data[2], new_data[2], clk, write_enable, reset);
    dffe_ref bit4(reg_data[3], new_data[3], clk, write_enable, reset);
    dffe_ref bit5(reg_data[4], new_data[4], clk, write_enable, reset);
    dffe_ref bit6(reg_data[5], new_data[5], clk, write_enable, reset);
    dffe_ref bit7(reg_data[6], new_data[6], clk, write_enable, reset);
    dffe_ref bit8(reg_data[7], new_data[7], clk, write_enable, reset);
    dffe_ref bit9(reg_data[8], new_data[8], clk, write_enable, reset);
    dffe_ref bit10(reg_data[9], new_data[9], clk, write_enable, reset);
    dffe_ref bit11(reg_data[10], new_data[10], clk, write_enable, reset);
    dffe_ref bit12(reg_data[11], new_data[11], clk, write_enable, reset);
    dffe_ref bit13(reg_data[12], new_data[12], clk, write_enable, reset);
    dffe_ref bit14(reg_data[13], new_data[13], clk, write_enable, reset);
    dffe_ref bit15(reg_data[14], new_data[14], clk, write_enable, reset);
    dffe_ref bit16(reg_data[15], new_data[15], clk, write_enable, reset);
    dffe_ref bit17(reg_data[16], new_data[16], clk, write_enable, reset);
    dffe_ref bit18(reg_data[17], new_data[17], clk, write_enable, reset);
    dffe_ref bit19(reg_data[18], new_data[18], clk, write_enable, reset);
    dffe_ref bit20(reg_data[19], new_data[19], clk, write_enable, reset);
    dffe_ref bit21(reg_data[20], new_data[20], clk, write_enable, reset);
    dffe_ref bit22(reg_data[21], new_data[21], clk, write_enable, reset);
    dffe_ref bit23(reg_data[22], new_data[22], clk, write_enable, reset);
    dffe_ref bit24(reg_data[23], new_data[23], clk, write_enable, reset);
    dffe_ref bit25(reg_data[24], new_data[24], clk, write_enable, reset);
    dffe_ref bit26(reg_data[25], new_data[25], clk, write_enable, reset);
    dffe_ref bit27(reg_data[26], new_data[26], clk, write_enable, reset);
    dffe_ref bit28(reg_data[27], new_data[27], clk, write_enable, reset);
    dffe_ref bit29(reg_data[28], new_data[28], clk, write_enable, reset);
    dffe_ref bit30(reg_data[29], new_data[29], clk, write_enable, reset);
    dffe_ref bit31(reg_data[30], new_data[30], clk, write_enable, reset);
    dffe_ref bit32(reg_data[31], new_data[31], clk, write_enable, reset);

endmodule
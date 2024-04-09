module reg_64(clk, new_data, write_enable, reset, reg_data); 

    input clk, write_enable, reset; 
    input [63:0] new_data; 
    output [63:0] reg_data;

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
    dffe_ref bit33(reg_data[32], new_data[32], clk, write_enable, reset);
    dffe_ref bit34(reg_data[33], new_data[33], clk, write_enable, reset);
    dffe_ref bit35(reg_data[34], new_data[34], clk, write_enable, reset);
    dffe_ref bit36(reg_data[35], new_data[35], clk, write_enable, reset);
    dffe_ref bit37(reg_data[36], new_data[36], clk, write_enable, reset);
    dffe_ref bit38(reg_data[37], new_data[37], clk, write_enable, reset);
    dffe_ref bit39(reg_data[38], new_data[38], clk, write_enable, reset);
    dffe_ref bit40(reg_data[39], new_data[39], clk, write_enable, reset);
    dffe_ref bit41(reg_data[40], new_data[40], clk, write_enable, reset);
    dffe_ref bit42(reg_data[41], new_data[41], clk, write_enable, reset);
    dffe_ref bit43(reg_data[42], new_data[42], clk, write_enable, reset);
    dffe_ref bit44(reg_data[43], new_data[43], clk, write_enable, reset);
    dffe_ref bit45(reg_data[44], new_data[44], clk, write_enable, reset);
    dffe_ref bit46(reg_data[45], new_data[45], clk, write_enable, reset);
    dffe_ref bit47(reg_data[46], new_data[46], clk, write_enable, reset);
    dffe_ref bit48(reg_data[47], new_data[47], clk, write_enable, reset);
    dffe_ref bit49(reg_data[48], new_data[48], clk, write_enable, reset);
    dffe_ref bit50(reg_data[49], new_data[49], clk, write_enable, reset);
    dffe_ref bit51(reg_data[50], new_data[50], clk, write_enable, reset);
    dffe_ref bit52(reg_data[51], new_data[51], clk, write_enable, reset);
    dffe_ref bit53(reg_data[52], new_data[52], clk, write_enable, reset);
    dffe_ref bit54(reg_data[53], new_data[53], clk, write_enable, reset);
    dffe_ref bit55(reg_data[54], new_data[54], clk, write_enable, reset);
    dffe_ref bit56(reg_data[55], new_data[55], clk, write_enable, reset);
    dffe_ref bit57(reg_data[56], new_data[56], clk, write_enable, reset);
    dffe_ref bit58(reg_data[57], new_data[57], clk, write_enable, reset);
    dffe_ref bit59(reg_data[58], new_data[58], clk, write_enable, reset);
    dffe_ref bit60(reg_data[59], new_data[59], clk, write_enable, reset);
    dffe_ref bit61(reg_data[60], new_data[60], clk, write_enable, reset);
    dffe_ref bit62(reg_data[61], new_data[61], clk, write_enable, reset);
    dffe_ref bit63(reg_data[62], new_data[62], clk, write_enable, reset);
    dffe_ref bit64(reg_data[63], new_data[63], clk, write_enable, reset);
endmodule
module counter_6bit(clk, en, clr, count);
    input clk, en, clr;
    output [5:0] count;
    
    wire [5:0] d_input;
    wire [5:0] carry;
    
    assign d_input[0] = ~count[0];  
    assign carry[0] = count[0];   
    assign d_input[1] = carry[0] ^ count[1]; 
    assign carry[1] = carry[0] & count[1];   
    assign d_input[2] = carry[1] ^ count[2]; 
    assign carry[2] = carry[1] & count[2];
    assign d_input[3] = carry[2] ^ count[3]; 
    assign carry[3] = carry[2] & count[3];
    assign d_input[4] = carry[3] ^ count[4]; 
    assign carry[4] = carry[3] & count[4];
    assign d_input[5] = carry[4] ^ count[5]; 
    assign carry[5] = carry[4] & count[5];

    dffe_ref bit0(count[0], d_input[0], clk, en, clr);
    dffe_ref bit1(count[1], d_input[1], clk, en, clr);
    dffe_ref bit2(count[2], d_input[2], clk, en, clr);
    dffe_ref bit3(count[3], d_input[3], clk, en, clr);
    dffe_ref bit4(count[4], d_input[4], clk, en, clr);
    dffe_ref bit5(count[5], d_input[5], clk, en, clr);
endmodule

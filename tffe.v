module tffe(q, t, clk, clr);
    input t, clk, clr;
    output q;

    wire dffe_q, w1;
    assign w1 = (t ^ dffe_q);
    assign q = dffe_q;
    dffe_ref dffe(dffe_q, w1, clk, 1'b1, clr);
endmodule
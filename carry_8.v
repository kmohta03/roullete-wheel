module carry_8(data_operandA, data_operandB, c0, c1, c2, c3, c4, c5, c6, c7, g0, g1, g2, g3, g4, g5, g6, p0, p1, p2, p3, p4, p5, p6);
    
    input [7:0] data_operandA, data_operandB;
    input c0, g0, g1, g2, g3, g4, g5, g6, p0, p1, p2, p3, p4, p5, p6;

    output c1, c2, c3, c4, c5, c6, c7;
   
    wire g0, g1, g2, g3, g4, g5, g6;
    wire p0, p1, p2, p3, p4, p5, p6;

    wire p0c0, p1p0c0, p1g0, p2p1p0c0, p2p1g0, p2g1, p3p2p1p0c0, p3p2p1g0, p3p2g1, p3g2, p4p3p2p1p0c0, p4p3p2p1g0, p4p3p2g1, p4p3g2, p4g3;

    //c1
    and andp0c0(p0c0, p0, c0); 
    or orc1(c1, g0, p0c0); 
    //c2
    and andp1p0c0(p1p0c0, p1, p0, c0);
    and andp1g0(p1g0, p1, g0); 
    or orc2(c2, g1, p1g0, p1p0c0);
    //c3
    and andp2p1p0c0(p2p1p0c0, p2, p1, p0, c0);
    and andp2p1g0(p2p1g0, p2, p1, g0); 
    and andp2g1(p2g1, p2, g1); 
    or orc3(c3, g2, p2g1, p2p1g0, p2p1p0c0); 
    //c4
    and andp3p2p1p0c0(p3p2p1p0c0, p3, p2, p1, p0, c0); 
    and andp3p2p1g0(p3p2p1g0, p3, p2, p1, g0); 
    and andp3p2g1(p3p2g1, p3, p2, g1);
    and andp3g2(p3g2, p3, g2);
    or orc4(c4, g3, p3g2, p3p2g1, p3p2p1g0, p3p2p1p0c0);
    //c5
    and andp4p3p2p1p0c0(p4p3p2p1p0c0, p4, p3, p2, p1, p0, c0); 
    and andp4p3p2p1g0(p4p3p2p1g0, p4, p3, p2, p1, g0); 
    and andp4p3p2g1(p4p3p2g1, p4, p3, p2, g1); 
    and andp4p3g2(p4p3g2, p4, p3, g2); 
    and andp4g3(p4g3, p4, g3);
    or orc5(c5, g4, p4g3, p4p3g2, p4p3p2g1, p4p3p2p1g0, p4p3p2p1p0c0);
    //c6
    wire p5p4p3p2p1p0c0, p5p4p3p2p1g0, p5p4p3p2g1, p5p4p3g2, p5p4g3, p5g4;
    and andp5p4p3p2p1p0c0(p5p4p3p2p1p0c0, p5, p4, p3, p2, p1, p0, c0);
    and andp5p4p3p2p1g0(p5p4p3p2p1g0, p5, p4, p3, p2, p1, g0); 
    and andp5p4p3p2g1(p5p4p3p2g1, p5, p4, p3, p2, g1); 
    and andp5p4p3g2(p5p4p3g2, p5, p4, p3, g2);
    and andp5p4g3(p5p4g3, p5, p4, g3); 
    and andp5g4(p5g4, p5, g4);
    or orc6(c6, g5, p5p4p3p2p1p0c0, p5p4p3p2p1g0, p5p4p3p2g1, p5p4p3g2, p5p4g3, p5g4);
    //c7
    wire p6p5p4p3p2p1p0c0, p6p5p4p3p2p1g0, p6p5p4p3p2g1, p6p5p4p3g2, p6p5p4g3, p6p5g4, p6g5;
    and andp6p5p4p3p2p1p0c0(p6p5p4p3p2p1p0c0, p6, p5, p4, p3, p2, p1, p0, c0); 
    and andp6p5p4p3p2p1g0(p6p5p4p3p2p1g0, p6, p5, p4, p3, p2, p1, g0); 
    and andp6p5p4p3p2g1(p6p5p4p3p2g1, p6, p5, p4, p3, p2, g1); 
    and andp6p5p4p3g2(p6p5p4p3g2, p6, p5, p4, p3, g2); 
    and andp6p5p4g3(p6p5p4g3, p6, p5, p4, g3); 
    and andp6p5g4(p6p5g4, p6, p5, g4); 
    and andp6g5(p6g5, p6, g5);
    or orc7(c7, g6, p6p5p4p3p2p1p0c0, p6p5p4p3p2p1g0, p6p5p4p3p2g1, p6p5p4p3g2, p6p5p4g3, p6p5g4, p6g5);
    // //c8
    // wire p7p6p5p4p3p2p1p0c0, p7p6p5p4p3p2p1g0, p7p6p5p4p3p2g1, p7p6p5p4p3g2, p7p6p5p4g3, p7p6p5g4, p7p6g5, p7g6;
    // and p7p6p5p4p3p2p1p0c0(p7p6p5p4p3p2p1p0c0, p7, p6p5p4p3p2p1p0c0); 
    // and p7p6p5p4p3p2p1g0(p7p6p5p4p3p2p1g0, p7, p6p5p4p3p2p1g0); 
    // and p7p6p5p4p3p2g1(p7p6p5p4p3p2g1, p7 p6p5p4p3p2g1); 
    // and p7p6p5p4p3g2(p7p6p5p4p3g2, p7, p6p5p4p3g2); 
    // and p7p6p5p4g3(p7p6p5p4g3, p7, p6p5p4g3);
    // and p7p6p5g4(p7p6p5g4, p7, p6p5g4);
    // and p7p6g5(p7p6g5, p7, p6g5); 
    // and p7g6(p7g6, p7, g6);
    // or c8(c8, g7, p7p6p5p4p3p2p1p0c0, p7p6p5p4p3p2p1g0, p7p6p5p4p3p2g1, p7p6p5p4p3g2, p7p6p5p4g3, p7p6p5g4, p7p6g5, p7g6);
    // //c9
    // wire p8p7p6p5p4p3p2p1p0c0, p8p7p6p5p4p3p2p1g0, p8p7p6p5p4p3p2g1, p8p7p6p5p4p3g2, p8p7p6p5p4g3, p8p7p6p5g4, p8p7p6g5, p8p7g6, p8g7;
    // and p8p7p6p5p4p3p2p1p0c0(p8p7p6p5p4p3p2p1p0c0, p8, p7p6p5p4p3p2p1p0c0); 
    // and p8p7p6p5p4p3p2p1g0(p8p7p6p5p4p3p2p1g0, p8, p7p6p5p4p3p2p1g0); 
    // and p8p7p6p5p4p3p2g1(p8p7p6p5p4p3p2g1, p8, p7p6p5p4p3p2g1);
    // and p8p7p6p5p4p3g2(p8p7p6p5p4p3g2, p8, p7p6p5p4p3g2); 
    // and p8p7p6p5p4g3(p8p7p6p5p4g3, p8, p7p6p5p4g3); 
    // and p8p7p6p5g4(p8p7p6p5g4, p8, p7p6p5g4); 
    // and p8p7p6g5(p8p7p6g5, p8, p7p6g5); 
    // and p8p7g6(p8p7g6, p8, p7g6); 
    // and p8g7(p8g7, p8, g7); 
    // or c9(c9, g8, p8p7p6p5p4p3p2p1p0c0, p8p7p6p5p4p3p2p1g0, p8p7p6p5p4p3p2g1, p8p7p6p5p4p3g2, p8p7p6p5p4g3, p8p7p6p5g4, p8p7p6g5, p8p7g6, p8g7);
    // //c10
    // wire p9p8p7p6p5p4p3p2p1p0c0, p9p8p7p6p5p4p3p2p1g0, p9p8p7p6p5p4p3p2g1, p9p8p7p6p5p4p3g2, p9p8p7p6p5p4g3, p9p8p7p6p5g4, p9p8p7p6g5, p9p8p7g6, p9p8g7, p9g8;
    // and p9p8p7p6p5p4p3p2p1p0c0(p9p8p7p6p5p4p3p2p1p0c0, p9, p8p7p6p5p4p3p2p1p0c0); 
    // and p9p8p7p6p5p4p3p2p1g0(p9p8p7p6p5p4p3p2p1g0, p9, p8p7p6p5p4p3p2p1g0); 
    // and p9p8p7p6p5p4p3p2g1(p9p8p7p6p5p4p3p2g1, p9, p8p7p6p5p4p3p2g1); 
    // and p9p8p7p6p5p4p3g2(p9p8p7p6p5p4p3g2, p9, p8p7p6p5p4p3g2); 
    // and p9p8p7p6p5p4g3(p9p8p7p6p5p4g3, p9, p8p7p6p5p4g3); 
    // and p9p8p7p6p5g4(p9p8p7p6p5g4, p9, p8p7p6p5g4); 
    // and p9p8p7p6g5(p9p8p7p6g5, p9, p8p7p6g5); 
    // and p9p8p7g6(p9p8p7g6, p9, p8p7g6); 
    // and p9p8g7(p9p8g7, p9, p8g7);
    // and p9g8(p9g8, p9, g8);
    // or c10(c10, g9, p9p8p7p6p5p4p3p2p1p0c0, p9p8p7p6p5p4p3p2p1g0, p9p8p7p6p5p4p3p2g1, p9p8p7p6p5p4p3g2, p9p8p7p6p5p4g3, p9p8p7p6p5g4, p9p8p7p6g5, p9p8p7g6, p9p8g7, p9g8);

endmodule
module adder_32(data_operandA, data_operandB, c0, out, c32, overflowCheck);
    input [31:0] data_operandA, data_operandB;
    input c0;  
    output [31:0] out;
    output c32, overflowCheck;

    wire g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31;
    wire p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31;

    wire c8, c16, c24;

    wire P0, G0, P1, G1, P2, G2, P3, G3;

    wire [7:0] out1, out2, out3, out4;

    gen gen(data_operandA, data_operandB, g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31);
    prop prop(data_operandA, data_operandB, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31);


    and andP0(P0, p7, p6, p5, p4, p3, p2, p1, p0); 
    bigG0 andG0(g7, g6, g5, g4, g3, g2, g1, g0, p7, p6, p5, p4, p3, p2, p1, G0);

    and andP1(P1, p8, p9, p10, p11, p12, p13, p14, p15); 
    bigG1 andG1(g15, g14, g13, g12, g11, g10, g9, g8, p15, p14, p13, p12, p11, p10, p9, G1);

    and andP2(P2, p16, p17, p18, p19, p20, p21, p22, p23); 
    bigG2 andG2(g23, g22, g21, g20, g19, g18, g17, g16, p23, p22, p21, p20, p19, p18, p17, G2);

    and andP3(P3, p24, p25, p26, p27, p28, p29, p30, p31); 
    bigG3 andG3(g31, g30, g29, g28, g27, g26, g25, g24, p31, p30, p29, p28, p27, p26, p25, G3);

    //using above get c8, c16, c24, c32
    wire P0c0, P1P0c0, P1G0, P2P1P0c0, P2P1G0, P2G1, P3P2P1P0c0, P3P2P1G0, P3P2G1, P3G2;
    and andP0c0(P0c0, P0, c0); 
    or orc8(c8, G0, P0c0); 

    and andP1P0c0(P1P0c0,P1, P0, c0); 
    and andP1G0(P1G0, P1, G0);
    or orc16(c16, G1, P1G0, P1P0c0);

    and andP2P1P0c0(P2P1P0c0, P2, P1, P0, c0); 
    and andP2P1G0(P2P1G0, P2, P1, G0); 
    and andP2G1(P2G1, P2, G1); 
    or orc24(c24, G2, P2P1P0c0, P2P1G0, P2G1);

    and andP3P2P1P0c0(P3P2P1P0c0, P3, P2, P1, P0, c0); 
    and andP3P2P1G0(P3P2P1G0, P3, P2, P1, G0);
    and andP3P2G1(P3P2G1, P3, P2, G1);
    and andP3G2(P3G2, P3, G2);
    or orc32(c32, G3, P3P2P1P0c0, P3P2P1G0, P3P2G1, P3G2);
    

    adder_8 add1(data_operandA[7:0], data_operandB[7:0], c0, g0, g1, g2, g3, g4, g5, g6, p0, p1, p2, p3, p4, p5, p6, out1); 
    adder_8 add2(data_operandA[15:8], data_operandB[15:8], c8,  g8, g9, g10, g11, g12, g13, g14, p8, p9, p10, p11, p12, p13, p14, out2);
    adder_8 add3(data_operandA[23:16], data_operandB[23:16], c16, g16, g17, g18, g19, g20, g21, g22, p16, p17, p18, p19, p20, p21, p22, out3); 
    fadder_8 add4(data_operandA[31:24], data_operandB[31:24], c24, g24, g25, g26, g27, g28, g29, g30, p24, p25, p26, p27, p28, p29, p30, out4, overflowCheck);

    assign out = {out4, out3, out2, out1};

   

endmodule
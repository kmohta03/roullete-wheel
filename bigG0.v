module bigG0(g7, g6, g5, g4, g3, g2, g1, g0, p7, p6, p5, p4, p3, p2, p1, G); 
   
    input g7, g6, g5, g4, g3, g2, g1, g0, p7, p6, p5, p4, p3, p2, p1; 
    output G; 

    wire p7p6p5p4p3p2p1g0, p7p6p5p4p3p2g1, p7p6p5p4p3g2, p7p6p5p4g3, p7p6p5g4, p7p6g5, p7g6;
    and andp7p6p5p4p3p2p1g0(p7p6p5p4p3p2p1g0, p7, p6, p5, p4, p3, p2, p1, g0); 
    and andp7p6p5p4p3p2g1(p7p6p5p4p3p2g1, p7, p6, p5, p4, p3, p2, g1);
    and andp7p6p5p4p3g2(p7p6p5p4p3g2, p7, p6, p5, p4, p3, g2); 
    and andp7p6p5p4g3(p7p6p5p4g3,  p7, p6, p5, p4, g3); 
    and andp7p6p5g4(p7p6p5g4, p7, p6, p5, g4);
    and andp7p6g5(p7p6g5, p7, p6, g5); 
    and andp7g6(p7g6, p7, g6);
    or orG0(G, g7, p7p6p5p4p3p2p1g0, p7p6p5p4p3p2g1, p7p6p5p4p3g2, p7p6p5p4g3, p7p6p5g4, p7p6g5, p7g6);
endmodule
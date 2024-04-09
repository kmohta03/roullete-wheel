module dlatch(D, E, Q, Qn);

    input D, E;
    output Q, Qn;

    wire Dn, En, n1, n2, n3, n4;


    not not1(Dn, D);  
    not not2(En, E); 
    nand nand1(n1, D, E);
    nand nand2(n2, Dn, E);
    nand nand3(n3, n1, n4);
    nand nand4(n4, n2, n3);

    assign Q = n3;
    assign Qn = n4;

endmodule

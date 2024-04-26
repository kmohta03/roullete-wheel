module regfile(
	clock,
	ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg,
	data_readRegA, data_readRegB, led_number, spin_check,
	bet1, bet2, bet3, bet4, bet5, bet6, bet7, bet8, bet9, bet10, bet11, bet12, finalpayout, 
	numproperty, register5, register29, LED_mappings, betCount, betReceived, chipDispense, register6, nonMapped, register17, register16);
    
    output [128:0] chipDispense; 
    input [31:0] register6; 
    output [31:0] register17;
    output [31:0] register16;
    assign register17 = r17; 
    assign register16 = r16; 
    assign register6 = r6;
    output [5:0] nonMapped;
    assign nonMapped = r14[5:0];
    assign chipDispense = {r5, r22, r21, r20, r19};
	input clock, ctrl_writeEnable, ctrl_reset;
	input spin_check, betReceived;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;
	output [5:0] led_number;
	output [31:0] data_readRegA, data_readRegB;
	input [7:0] bet1, bet2, bet3, bet4, bet5, bet6, bet7, bet8, bet9, bet10, bet11, bet12; 
	output [31:0] finalpayout;
	output [6:0] numproperty;
	output register5;
	output [1:0] register29;
	output [15:0] LED_mappings;
	input [4:0] betCount;
	// add your code here
	assign led_number = r8[5:0];
	assign finalpayout = r18;
	assign numproperty = r17[6:0];
	assign register5 = r5[1];
	assign register29 = r29[1:0];
	
	assign LED_mappings = {r5[0], r18[6:0], r19[1:0], r20[1:0], r21[1:0], r22[1:0]};
	//assign LED_mappings[7:0] = {r19[1:0], r20[1:0], r21[1:0], r22[1:0]};
	//assign LED_mappings[0] = r3[0];
	wire [31:0] A, B, write;

	decoder32 regA(A, ctrl_readRegA, 1'b1);
	decoder32 regB(B, ctrl_readRegB, 1'b1);
	decoder32 writeReg(write, ctrl_writeReg, ctrl_writeEnable); // instead of and gate done decode with write_enable

	wire clk; 

	assign clk = clock;

	wire [31:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31;

	wire [31:0] rg25, rg26, rg27, rg4, rg5;
	assign rg25 = {bet4, bet3, bet2, bet1}; 
	assign rg26 = {bet8, bet7, bet6, bet5}; 
	assign rg27 = {bet12, bet11, bet10, bet9};

	assign rg4 = {31'b0, spin_check};
	wire [31:0] rg2;
	wire [31:0] rg3; 
	assign rg3 = {31'b0, betReceived};
	assign rg2 = {27'b0, betCount};

	register reg0(clk, data_writeReg, write[0], 1'b1, r0);
	register reg1(clk, data_writeReg, write[1], ctrl_reset, r1);
	register reg2(clk, rg2, 1'b1, ctrl_reset, r2);
	register reg3(clk, rg3, 1'b1, ctrl_reset, r3);
	register reg4(clk, rg4, 1'b1, ctrl_reset, r4);
	register reg5(clk, data_writeReg, write[5], ctrl_reset, r5);
	register reg6(clk, register6, 1'b1, ctrl_reset, r6);
	register reg7(clk, data_writeReg, write[7], ctrl_reset, r7);
	register reg8(clk, data_writeReg, write[8], ctrl_reset, r8);
	register reg9(clk, data_writeReg, write[9], ctrl_reset, r9);
	register reg10(clk, data_writeReg, write[10], ctrl_reset, r10);
	register reg11(clk, data_writeReg, write[11], ctrl_reset, r11);
	register reg12(clk, data_writeReg, write[12], ctrl_reset, r12);
	register reg13(clk, data_writeReg, write[13], ctrl_reset, r13);
	register reg14(clk, data_writeReg, write[14], ctrl_reset, r14);
	register reg15(clk, data_writeReg, write[15], ctrl_reset, r15);
	register reg16(clk, data_writeReg, write[16], 1'b0, r16);
	register reg17(clk, data_writeReg, write[17], ctrl_reset, r17);
	register reg18(clk, data_writeReg, write[18], ctrl_reset, r18);
	register reg19(clk, data_writeReg, write[19], ctrl_reset, r19);
	register reg20(clk, data_writeReg, write[20], ctrl_reset, r20);
	register reg21(clk, data_writeReg, write[21], ctrl_reset, r21);
	register reg22(clk, data_writeReg, write[22], ctrl_reset, r22);
	register reg23(clk, data_writeReg, write[23], ctrl_reset, r23);
	register reg24(clk, data_writeReg, write[24], ctrl_reset, r24);
	register reg25(clk, rg25, 1'b1, ctrl_reset, r25);
	register reg26(clk, rg26, 1'b1, ctrl_reset, r26);
	register reg27(clk, rg27, 1'b1, ctrl_reset, r27);
	register reg28(clk, data_writeReg, write[28], ctrl_reset, r28);
	register reg29(clk, data_writeReg, write[29], ctrl_reset, r29);
	register reg30(clk, data_writeReg, write[30], ctrl_reset, r30);
	register reg31(clk, data_writeReg, write[31], ctrl_reset, r31);

	assign data_readRegA = A[0] ? r0 : 32'bz;
	assign data_readRegA = A[1] ? r1 : 32'bz;
	assign data_readRegA = A[2] ? r2 : 32'bz;
	assign data_readRegA = A[3] ? r3 : 32'bz;
	assign data_readRegA = A[4] ? r4 : 32'bz;
	assign data_readRegA = A[5] ? r5 : 32'bz;
	assign data_readRegA = A[6] ? r6 : 32'bz;
	assign data_readRegA = A[7] ? r7 : 32'bz;
	assign data_readRegA = A[8] ? r8 : 32'bz;
	assign data_readRegA = A[9] ? r9 : 32'bz;
	assign data_readRegA = A[10] ? r10 : 32'bz;
	assign data_readRegA = A[11] ? r11 : 32'bz;
	assign data_readRegA = A[12] ? r12 : 32'bz;
	assign data_readRegA = A[13] ? r13 : 32'bz;
	assign data_readRegA = A[14] ? r14 : 32'bz;
	assign data_readRegA = A[15] ? r15 : 32'bz;
	assign data_readRegA = A[16] ? r16 : 32'bz;
	assign data_readRegA = A[17] ? r17 : 32'bz;
	assign data_readRegA = A[18] ? r18 : 32'bz;
	assign data_readRegA = A[19] ? r19 : 32'bz;
	assign data_readRegA = A[20] ? r20 : 32'bz;
	assign data_readRegA = A[21] ? r21 : 32'bz;
	assign data_readRegA = A[22] ? r22 : 32'bz;
	assign data_readRegA = A[23] ? r23 : 32'bz;
	assign data_readRegA = A[24] ? r24 : 32'bz;
	assign data_readRegA = A[25] ? r25 : 32'bz;
	assign data_readRegA = A[26] ? r26 : 32'bz;
	assign data_readRegA = A[27] ? r27 : 32'bz;
	assign data_readRegA = A[28] ? r28 : 32'bz;
	assign data_readRegA = A[29] ? r29 : 32'bz;
	assign data_readRegA = A[30] ? r30 : 32'bz;
	assign data_readRegA = A[31] ? r31 : 32'bz;

	assign data_readRegB = B[0] ? r0 : 32'bz;
	assign data_readRegB = B[1] ? r1 : 32'bz;
	assign data_readRegB = B[2] ? r2 : 32'bz;
	assign data_readRegB = B[3] ? r3 : 32'bz;
	assign data_readRegB = B[4] ? r4 : 32'bz;
	assign data_readRegB = B[5] ? r5 : 32'bz;
	assign data_readRegB = B[6] ? r6 : 32'bz;
	assign data_readRegB = B[7] ? r7 : 32'bz;
	assign data_readRegB = B[8] ? r8 : 32'bz;
	assign data_readRegB = B[9] ? r9 : 32'bz;
	assign data_readRegB = B[10] ? r10 : 32'bz;
	assign data_readRegB = B[11] ? r11 : 32'bz;
	assign data_readRegB = B[12] ? r12 : 32'bz;
	assign data_readRegB = B[13] ? r13 : 32'bz;
	assign data_readRegB = B[14] ? r14 : 32'bz;
	assign data_readRegB = B[15] ? r15 : 32'bz;
	assign data_readRegB = B[16] ? r16 : 32'bz;
	assign data_readRegB = B[17] ? r17 : 32'bz;
	assign data_readRegB = B[18] ? r18 : 32'bz;
	assign data_readRegB = B[19] ? r19 : 32'bz;
	assign data_readRegB = B[20] ? r20 : 32'bz;
	assign data_readRegB = B[21] ? r21 : 32'bz;
	assign data_readRegB = B[22] ? r22 : 32'bz;
	assign data_readRegB = B[23] ? r23 : 32'bz;
	assign data_readRegB = B[24] ? r24 : 32'bz;
	assign data_readRegB = B[25] ? r25 : 32'bz;
	assign data_readRegB = B[26] ? r26 : 32'bz;
	assign data_readRegB = B[27] ? r27 : 32'bz;
	assign data_readRegB = B[28] ? r28 : 32'bz;
	assign data_readRegB = B[29] ? r29 : 32'bz;
	assign data_readRegB = B[30] ? r30 : 32'bz;
	assign data_readRegB = B[31] ? r31 : 32'bz;

endmodule

`timescale 1ns / 1ps
/**
 * 
 * READ THIS DESCRIPTION:
 *
 * This is the Wrapper module that will serve as the header file combining your processor, 
 * RegFile and Memory elements together.
 *
 * This file will be used to generate the bitstream to upload to the FPGA.
 * We have provided a sibling file, Wrapper_tb.v so that you can test your processor's functionality.
 * 
 * We will be using our own separate Wrapper_tb.v to test your code. You are allowed to make changes to the Wrapper files 
 * for your own individual testing, but we expect your final processor.v and memory modules to work with the 
 * provided Wrapper interface.
 * 
 * Refer to Lab 5 documents for detailed instructions on how to interface 
 * with the memory elements. Each imem and dmem modules will take 12-bit 
 * addresses and will allow for storing of 32-bit values at each address. 
 * Each memory module should receive a single clock. At which edges, is 
 * purely a design choice (and thereby up to you). 
 * 
 * You must change line 36 to add the memory file of the test you created using the assembler
 * For example, you would add sample inside of the quotes on line 38 after assembling sample.s
 *
 **/

module Wrapper (clock, reset, JA, JB, JC, LED, ps2_clk, ps2_data);
	input clock, reset;
    output [7:0] JA;
    output [6:0] JB; 
    output [2:0] JC; 
    output [15:0] LED;
	inout ps2_clk, ps2_data;

	wire rwe, mwe;
	wire[4:0] rd, rs1, rs2;
	wire[31:0] instAddr, instData, 
		rData, regA, regB,
		memAddr, memDataIn, memDataOut;


	// ADD YOUR MEMORY FILE HERE
	localparam INSTR_FILE = "led_number_generator";
	
	// Main Processing Unit
	processor CPU(.clock(clock), .reset(reset), 
								
		// ROM
		.address_imem(instAddr), .q_imem(instData),
									
		// Regfile
		.ctrl_writeEnable(rwe),     .ctrl_writeReg(rd),
		.ctrl_readRegA(rs1),     .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB),
									
		// RAM
		.wren(mwe), .address_dmem(memAddr), 
		.data(memDataIn), .q_dmem(memDataOut)); 
	
	// Instruction Memory (ROM)
	ROM #(.MEMFILE({INSTR_FILE, ".mem"}))
	InstMem(.clk(clock), 
		.addr(instAddr[11:0]), 
		.dataOut(instData));
	
	// Register File
	wire [5:0] led_number;
	regfile RegisterFile(.clock(clock), 
		.ctrl_writeEnable(rwe), .ctrl_reset(reset), 
		.ctrl_writeReg(rd),
		.ctrl_readRegA(rs1), .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB), .led_number(led_number));
	
	//wire [2:0] mux_select_0, mux_select_1, mux_select_2, mux_select_3, mux_select_4, mux_select_5;
	assign JA = {2'b0, led_number};
	assign JB = {mux_select_2[0], mux_select_3, mux_select_4};
	assign JC = mux_select_5;  
	assign LED[3] = led_number[0];
	assign LED[4] = led_number[1];
	assign LED[5] = led_number[2];
	assign LED[6] = led_number[3];
	assign LED[7] = led_number[4];
	//assign LED[8] = led_number[5];
	assign LED[0] = JA ? 1'b1 : 1'b0;
	assign LED[1] = JB ? 1'b1 : 1'b0;
	assign LED[2] = (JA ||JB || JC) ? 1'b1 : 1'b0;
	
	led_decoder RoulletteLEDs(led_number, mux_select_0, mux_select_1, mux_select_2, mux_select_3, mux_select_4, mux_select_5);

	wire [7:0] keyboardValue; 
	assign LED[15:10] = betOpcode;
	Ps2Controller keyboardComs(.clk(clock), .reset(reset), .ps2_clk(ps2_clk), .ps2_data(ps2_data), .latchedRX(keyboardValue));

	wire [5:0] betOpcode; 
	keyboardToBet betOp(.keyboardValue(keyboardValue), .betOpcode(betOpcode));


	// Processor Memory (RAM)
	RAM ProcMem(.clk(clock), 
		.wEn(mwe), 
		.addr(memAddr[11:0]), 
		.dataIn(memDataIn), 
		.dataOut(memDataOut));

endmodule

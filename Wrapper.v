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

module Wrapper (clock, reset, JA, JB, JC, LED, ps2_clk, ps2_data, seg, AN);
	input clock, reset;
    output [7:0] JA;
    input [6:0] JB; 
    output [4:0] JC; 
    output [15:0] LED;
	output [6:0] seg; 
	output [7:0] AN;
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
	
	wire spin_check; 
	assign spin_check = (reset) ? 1'b0 : (betOpcode == 6'b111110);
	//assign spin_check = 1'b1;

	// Register File
	wire [5:0] led_number;
	reg [7:0] bet1, bet2, bet3, bet4, bet5, bet6, bet7, bet8, bet9, bet10, bet11, bet12;
    wire [31:0] register25;
	wire [31:0] finalpayout;

	wire [6:0] numproperty;
	wire[1:0] register29;
	regfile RegisterFile( .clock(clock), 
		.ctrl_writeEnable(rwe), .ctrl_reset(reset), 
		.ctrl_writeReg(rd),
		.ctrl_readRegA(rs1), .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB), .led_number(led_number), .spin_check(spin_check), .bet1(bet1), .bet2(bet2), .bet3(bet3), .bet4(bet4), .bet5(bet5), .bet6(bet6), .bet7(bet7), .bet8(bet8), .bet9(bet9), .bet10(bet10), .bet11(bet11), .bet12(bet12), .finalpayout(finalpayout), 
		.numproperty(numproperty), .register28(register28), .register29(register29), .LED_mappings(LED), .betCount(betCount[5:1]));
	wire [7:0] register28;
	wire [2:0] mux_select_0, mux_select_1, mux_select_2, mux_select_3, mux_select_4, mux_select_5;
	assign JA = {2'b0, led_number};
	
	//assign LED[7:0] = bet1;
//	assign LED[6:0] = register28;
//	assign LED[7] = finalpayout;
//	assign LED[13:8] = finalpayout[5:0];
//	assign LED[15:14] = finalpayout[7:6];
    
	
	//led_decoder RoulletteLEDs(led_number, mux_select_0, mux_select_1, mux_select_2, mux_select_3, mux_select_4, mux_select_5);

	wire [7:0] keyboardValue; 


	wire read_data;
	Ps2Controller keyboardComs(.clk(clock), .reset(reset), .ps2_clk(ps2_clk), .ps2_data(ps2_data), .latchedRX(keyboardValue), .read_data(read_data));

	assign JC[0] = motor1_signal;
	wire motor1_signal;
	ServoPWM motor1(.clk(clock), .reset(reset), .duty_cycle(7'd0), .servo_signal(motor1_signal));
	//ServoController motor1(.clk(clock), .reset(reset), .position(motorposition1[7:0]), .servo_signal(motor1_signal));
	// BETTING LOGIC
	wire [5:0] betOpcode; 
	keyboardToBet betOp(.keyboardValue(keyboardValue), .betOpcode(betOpcode));

	wire[2:0] arduinoColor;

	//assign arduinoColor = {JB[2], JB[1], JB[0]};
	//CHANGE BACK CHANGE BACK CHANGE BACK CHANGE AN
	assign arduinoColor = 3'b101;

	wire betReady; 

	// reg ongoingSpin = 0;

	// always @(posedge clock or posedge reset) begin
	// 	if (reset)
	// 		ongoingSpin <= 0;
	// 	else if (spin)
	// 		ongoingSpin <= 1;
	// 	else
	// 		ongoingSpin <= 0;
	// end

	assign betReady = (read_data & betOpcode != (6'b111111 | 6'b111110) & arduinoColor != 3'b000); 

	wire [5:0] betCount;
	wire count_enable = betReady & !spin_check; //SWITCH BACK WHEN WE DONT WANT COUNTER TO INCREMENT
	wire count_clear = reset; 
	counter_6bit betCounter(
		.clk(clock),
		.en(count_enable),
		.clr(count_clear),
		.count(betCount)
	);


	// Combine Arduino color and betOpcode for latching
	wire [7:0] combinedBet; // 2 bits for Arduino color + 6 bits for betOpcode
	assign combinedBet = {arduinoColor [1:0], betOpcode};
    
	// Latch logic based on the number of bets done
	always @(posedge clock) begin
		if (reset) begin
			// Reset all bet registers
			bet1 <= 0;
			bet2 <= 0;
			bet3 <= 0;
			bet4 <= 0;
			bet5 <= 0;
			bet6 <= 0;
			bet7 <= 0;
			bet8 <= 0;
			bet9 <= 0;
			bet10 <= 0;
			bet11 <= 0;
			bet12 <= 0;
		end
		else if (spin_check) begin
		    case (betCount + 2)
                6'd0: bet1 <= combinedBet;
				6'd2: bet2 <= combinedBet;
				6'd4: bet3 <= combinedBet;
				6'd6: bet4 <= combinedBet;
				6'd8: bet5 <= combinedBet;
				6'd10: bet6 <= combinedBet;
				6'd12: bet7 <= combinedBet;
				6'd14: bet8 <= combinedBet;
				6'd16: bet9 <= combinedBet;
				6'd18: bet10 <= combinedBet;
				6'd20: bet11 <= combinedBet;
				6'd22: bet12 <= combinedBet;
		    endcase
		end
		else if (betReady) begin
			case (betCount)
				6'd0: bet1 <= combinedBet;
				6'd2: bet2 <= combinedBet;
				6'd4: bet3 <= combinedBet;
				6'd6: bet4 <= combinedBet;
				6'd8: bet5 <= combinedBet;
				6'd10: bet6 <= combinedBet;
				6'd12: bet7 <= combinedBet;
				6'd14: bet8 <= combinedBet;
				6'd16: bet9 <= combinedBet;
				6'd18: bet10 <= combinedBet;
				6'd20: bet11 <= combinedBet;
				6'd22: bet12 <= combinedBet;
				default: ; // Do nothing for counts beyond 12
			endcase
		end
	end

    seven_segment_display sevenSeg(betCount[3:0], seg, AN);

	wire [31:0] motorposition1;
	// Processor Memory (RAM)
	RAM ProcMem(.clk(clock), 
		.wEn(mwe), 
		.addr(memAddr[11:0]), 
		.dataIn(memDataIn), 
		.dataOut(memDataOut),
		.motorposition1(motorposition1));

endmodule

`timescale 1ns / 1ps
module RAM #( parameter DATA_WIDTH = 32, ADDRESS_WIDTH = 12, DEPTH = 20) (
    input wire                     clk,
    input wire                     wEn,
    input wire [ADDRESS_WIDTH-1:0] addr,
    input wire [DATA_WIDTH-1:0]    dataIn,
    output reg [DATA_WIDTH-1:0]    dataOut = 0, 
    output reg [31:0] motorposition1,
    output reg [31:0] motorposition2,
    output reg [31:0] motorposition3,
    output reg [31:0] motorposition4,
    output reg [31:0] chipMotor);
    
    reg[DATA_WIDTH-1:0] MemoryArray[0:DEPTH-1];
    
    integer i;
    initial begin
        for (i = 0; i < DEPTH; i = i + 1) begin
            MemoryArray[i] <= 0;
        end
        // if(MEMFILE > 0) begin
        //     $readmemh(MEMFILE, MemoryArray);
        // end
    end
    
    always @(posedge clk) begin
        if(wEn) begin
            MemoryArray[addr] <= dataIn;
        end else begin
            dataOut <= MemoryArray[addr];
        end
        chipMotor <= MemoryArray[9][31:0];
        motorposition1 <= MemoryArray[10][31:0];
        motorposition2 <= MemoryArray[11][31:0];
        motorposition3 <= MemoryArray[12][31:0];
        motorposition4 <= MemoryArray[13][31:0];
        
    end
endmodule

module instruction_decoder(input [31:0] instruction,
    output [4:0] opcode, rd, rs, rt, shamt,
    output [4:0] alu_op,
    output [31:0] immediate, 
    output rType, iType, jiType, jiiType
);

    assign opcode = instruction[31:27];
    
    assign rd = instruction[26:22];

    
    assign rs = ((instruction[31:27] == 5'b00010) | (instruction[31:27] == 5'b00110) | (instruction[31:27] == 5'b00100)) ? instruction[26:22] :
                instruction[21:17];

    assign rt = ((instruction[31:27] == 5'b00010) | (instruction[31:27] == 5'b00110)) ? instruction[21:17] :
                (instruction[31:27] == 5'b00111) ? instruction[26:22] : (instruction[31:27] == 5'b10110) ? 5'b11110 : instruction[16:12];
   
    assign shamt = instruction[11:7];
    assign alu_op = instruction[6:2];
    assign immediate = {{15{instruction[16]}}, instruction[16:0]};

    assign iType = ((instruction[31:27] == 5'b00101) | (instruction[31:27] == 5'b00111) | (instruction[31:27] == 5'b01000) | (instruction[31:27] == 5'b00010) | (instruction[31:27] == 5'b00110)) ? 1'b1 : 1'b0;
    assign rType = (instruction[31:27] == 5'b00000) ? 1'b1 : 1'b0;
    assign jiType = (instruction[31:27] == 5'b00001 | instruction[31:27] == 5'b00011 | instruction[31:27] == 5'b10110 | instruction[31:27] == 5'b10101) ? 1'b1 : 1'b0;
    assign jiiType = (instruction[31:27] == 5'b00100) ? 1'b1 : 1'b0;


endmodule


`timescale 1ns / 1ps
module Instruction_Memory(
    input [63:0] Inst_Address,
    output [31:0] Instruction
    );
    
    reg [7:0] InstructionMemory [15:0];
    
    initial
    begin
        InstructionMemory[0] = 8'b10000011;
        InstructionMemory[1] = 8'b00110100;
        InstructionMemory[2] = 8'b00000101;
        InstructionMemory[3] = 8'b00001111;
        InstructionMemory[4] = 8'b10110011;
        InstructionMemory[5] = 8'b10000100;
        InstructionMemory[6] = 8'b10011010;
        InstructionMemory[7] = 8'b00000000;
        InstructionMemory[8] = 8'b10010011;
        InstructionMemory[9] = 8'b10000100;
        InstructionMemory[10] = 8'b00010100;
        InstructionMemory[11] = 8'b00000000;
        InstructionMemory[12] = 8'b00100011;
        InstructionMemory[13] = 8'b00111000;
        InstructionMemory[14] = 8'b10010101;
        InstructionMemory[15] = 8'b00001110;
    end
    
    assign Instruction = {InstructionMemory[Inst_Address+3], InstructionMemory[Inst_Address+2], InstructionMemory[Inst_Address+1], InstructionMemory[Inst_Address]};
    
endmodule

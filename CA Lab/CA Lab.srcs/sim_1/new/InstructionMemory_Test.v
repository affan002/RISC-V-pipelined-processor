`timescale 1ns / 1ps
module InstructionMemory_Test();

    reg [63:0] Inst_Address;
    wire [31:0] Instruction;
    
    Instruction_Memory IM (Inst_Address, Instruction);
    
    initial
    begin
    
        Inst_Address = 2;
        
        #100
        Inst_Address = 4;
        
        #100
        Inst_Address = 9;
        
        #100
        Inst_Address = 13;
    
    end

endmodule

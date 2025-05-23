`timescale 1ns / 1ps
module Instruction_Memory(
    input [63:0] Inst_Address,
    output reg [31:0] Instruction
    );
    
    reg [7:0] InstructionMemory [180:0];
    
    
    // old implementation
//    initial
//    begin
//        InstructionMemory[0] = 8'b10000011;
//        InstructionMemory[1] = 8'b00110100;
//        InstructionMemory[2] = 8'b10000101;
//        InstructionMemory[3] = 8'b00000010;
//        InstructionMemory[4] = 8'b10110011;
//        InstructionMemory[5] = 8'b10000100;
//        InstructionMemory[6] = 8'b10011010;
//        InstructionMemory[7] = 8'b00000000;
//        InstructionMemory[8] = 8'b10010011;
//        InstructionMemory[9] = 8'b10000100;
//        InstructionMemory[10] = 8'b00010100;
//        InstructionMemory[11] = 8'b00000000;
//        InstructionMemory[12] = 8'b00100011;
//        InstructionMemory[13] = 8'b00110100;
//        InstructionMemory[14] = 8'b10010101;
//        InstructionMemory[15] = 8'b00000010;
//    end
    

    initial begin
        {InstructionMemory[3], InstructionMemory[2], InstructionMemory[1], InstructionMemory[0]} = 32'h10000293; //1
        {InstructionMemory[7], InstructionMemory[6], InstructionMemory[5], InstructionMemory[4]} = 32'h00700313; //2
        {InstructionMemory[11], InstructionMemory[10], InstructionMemory[9], InstructionMemory[8]} = 32'h00000413; //3
        {InstructionMemory[15], InstructionMemory[14], InstructionMemory[13], InstructionMemory[12]} = 32'h04640a63; //4
        {InstructionMemory[19], InstructionMemory[18], InstructionMemory[17], InstructionMemory[16]} = 32'h10000293; //5
        {InstructionMemory[23], InstructionMemory[22], InstructionMemory[21], InstructionMemory[20]} = 32'hfff30493; //6
        {InstructionMemory[27], InstructionMemory[26], InstructionMemory[25], InstructionMemory[24]} = 32'h408484b3; //7
        {InstructionMemory[31], InstructionMemory[30], InstructionMemory[29], InstructionMemory[28]} = 32'h00000513; //8
        {InstructionMemory[35], InstructionMemory[34], InstructionMemory[33], InstructionMemory[32]} = 32'h02950c63; //9
        {InstructionMemory[39], InstructionMemory[38], InstructionMemory[37], InstructionMemory[36]} = 32'h00251593; //10
        {InstructionMemory[43], InstructionMemory[42], InstructionMemory[41], InstructionMemory[40]} = 32'h00b285b3; //11
        {InstructionMemory[47], InstructionMemory[46], InstructionMemory[45], InstructionMemory[44]} = 32'h00150613; //12
        {InstructionMemory[51], InstructionMemory[50], InstructionMemory[49], InstructionMemory[48]} = 32'h00261613; //13
        {InstructionMemory[55], InstructionMemory[54], InstructionMemory[53], InstructionMemory[52]} = 32'h00c28633; //14
        {InstructionMemory[59], InstructionMemory[58], InstructionMemory[57], InstructionMemory[56]} = 32'h0005a683; //15
        {InstructionMemory[63], InstructionMemory[62], InstructionMemory[61], InstructionMemory[60]} = 32'h00062703; //16
        {InstructionMemory[67], InstructionMemory[66], InstructionMemory[65], InstructionMemory[64]} = 32'h00d74463; //17
        {InstructionMemory[71], InstructionMemory[70], InstructionMemory[69], InstructionMemory[68]} = 32'h00000663; //18
        {InstructionMemory[75], InstructionMemory[74], InstructionMemory[73], InstructionMemory[72]} = 32'h00e5a023; //19
        {InstructionMemory[79], InstructionMemory[78], InstructionMemory[77], InstructionMemory[76]} = 32'h00d62023; //20
        {InstructionMemory[83], InstructionMemory[82], InstructionMemory[81], InstructionMemory[80]} = 32'h00150513; //21
        {InstructionMemory[87], InstructionMemory[86], InstructionMemory[85], InstructionMemory[84]} = 32'hfc0006e3; //22
        {InstructionMemory[91], InstructionMemory[90], InstructionMemory[89], InstructionMemory[88]} = 32'h00140413; //23
        {InstructionMemory[95], InstructionMemory[94], InstructionMemory[93], InstructionMemory[92]} = 32'hfa0008e3; //24
        {InstructionMemory[99], InstructionMemory[98], InstructionMemory[97], InstructionMemory[96]} = 32'h00000013; //25
    end 
       
       always @(Inst_Address) begin
            Instruction[31:24] <= InstructionMemory[Inst_Address + 3];
            Instruction[23:16] <= InstructionMemory[Inst_Address + 2];
            Instruction[15:8] <= InstructionMemory[Inst_Address + 1];
            Instruction[7:0] <= InstructionMemory[Inst_Address];
       end
    
endmodule

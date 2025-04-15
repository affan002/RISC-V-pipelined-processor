`timescale 1ns / 1ps
module Instruction_Memory(
    input [63:0] Inst_Address,
    output reg [31:0] Instruction
    );
    
    reg [7:0] InstructionMemory [75:0];
    
    
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
    
//    assign Instruction = {InstructionMemory[Inst_Address+3], InstructionMemory[Inst_Address+2], InstructionMemory[Inst_Address+1], InstructionMemory[Inst_Address]};
       initial begin
      InstructionMemory[75] = 8'hfb;
      InstructionMemory[74] = 8'hfe;
      InstructionMemory[73] = 8'hce;
      InstructionMemory[72] = 8'he3;
      
      InstructionMemory[71] = 8'h00;
      InstructionMemory[70] = 8'h85;
      InstructionMemory[69] = 8'h05;
      InstructionMemory[68] = 8'h13;
      
      InstructionMemory[67] = 8'h00;
      InstructionMemory[66] = 8'h1e;
      InstructionMemory[65] = 8'h8e;
      InstructionMemory[64] = 8'h93;
      
      InstructionMemory[63] = 8'h00;
      InstructionMemory[62] = 8'h98;
      InstructionMemory[61] = 8'h30;
      InstructionMemory[60] = 8'h23;
      
      InstructionMemory[59] = 8'h00;
      InstructionMemory[58] = 8'he5;
      InstructionMemory[57] = 8'h30;
      InstructionMemory[56] = 8'h23;
      
      InstructionMemory[55] = 8'hff;
      InstructionMemory[54] = 8'hff;
      InstructionMemory[53] = 8'h44;
      InstructionMemory[52] = 8'he3;
      
      InstructionMemory[51] = 8'h00;
      InstructionMemory[50] = 8'h85;
      InstructionMemory[49] = 8'h85;
      InstructionMemory[48] = 8'h93;
      
      InstructionMemory[47] = 8'h00;
      InstructionMemory[46] = 8'h1f;
      InstructionMemory[45] = 8'h0f;
      InstructionMemory[44] = 8'h13;
      
      InstructionMemory[43] = 8'h00;
      InstructionMemory[42] = 8'h08;
      InstructionMemory[41] = 8'h37;
      InstructionMemory[40] = 8'h03;
      
      InstructionMemory[39] = 8'h00;
      InstructionMemory[38] = 8'h05;
      InstructionMemory[37] = 8'h88;
      InstructionMemory[36] = 8'h33;
      
      InstructionMemory[35] = 8'h01;
      InstructionMemory[34] = 8'h17;
      InstructionMemory[33] = 8'h46;
      InstructionMemory[32] = 8'h63;
      
      InstructionMemory[31] = 8'h00;
      InstructionMemory[30] = 8'h05;
      InstructionMemory[29] = 8'hb8;
      InstructionMemory[28] = 8'h83;
      
      InstructionMemory[27] = 8'h00;
      InstructionMemory[26] = 8'h08;
      InstructionMemory[25] = 8'h37;
      InstructionMemory[24] = 8'h03;
      
      InstructionMemory[23] = 8'h00;
      InstructionMemory[22] = 8'ha0;
      InstructionMemory[21] = 8'h08;
      InstructionMemory[20] = 8'h33;
      
      InstructionMemory[19] = 8'h00;
      InstructionMemory[18] = 8'h85;
      InstructionMemory[17] = 8'h05;
      InstructionMemory[16] = 8'h93;
      
      InstructionMemory[15] = 8'h00;
      InstructionMemory[14] = 8'h05;
      InstructionMemory[13] = 8'h34;
      InstructionMemory[12] = 8'h83;
      
      InstructionMemory[11] = 8'h00;
      InstructionMemory[10] = 8'h1e;
      InstructionMemory[9] = 8'h8f;
      InstructionMemory[8] = 8'h13;
      
      InstructionMemory[7] = 8'h00;
      InstructionMemory[6] = 8'h00;
      InstructionMemory[5] = 8'h0f;
      InstructionMemory[4] = 8'h13;
      
      InstructionMemory[3] = 8'h00;
      InstructionMemory[2] = 8'ha0;
      InstructionMemory[1] = 8'h0f;
      InstructionMemory[0] = 8'h93;
end
       
       
       always @(Inst_Address) begin
            Instruction[31:24] <= InstructionMemory[Inst_Address + 3];
            Instruction[23:16] <= InstructionMemory[Inst_Address + 2];
            Instruction[15:8] <= InstructionMemory[Inst_Address + 1];
            Instruction[7:0] <= InstructionMemory[Inst_Address];
       end
    
endmodule

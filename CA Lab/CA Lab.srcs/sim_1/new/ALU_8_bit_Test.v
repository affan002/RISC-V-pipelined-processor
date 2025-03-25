`timescale 1ns / 1ps
module ALU_8_bit_Test();

    reg [7:0] a; reg[7:0] b;
    reg CarryIn;
    reg [3:0] ALUOp;
    wire [7:0] Result;
    wire CarryOut;
    
    ALU_8_bit ALU8Test (a, b, CarryIn, ALUOp, Result, CarryOut);
    
    initial begin
        #0
            a = 8'b10101101; b = 8'b11001010; CarryIn = 0; ALUOp = 4'b0000;
        #100
            a = 8'b01100111; b = 8'b10011011; CarryIn = 1; ALUOp = 4'b0001;
        #100
            a = 8'b11100001; b = 8'b00101010; CarryIn = 0; ALUOp = 4'b0010;
        #100
            a = 8'b01010101; b = 8'b11111111; CarryIn = 1; ALUOp = 4'b0110;
        #100
            a = 8'b00011100; b = 8'b10010001; CarryIn = 1; ALUOp = 4'b1100;
    end

endmodule

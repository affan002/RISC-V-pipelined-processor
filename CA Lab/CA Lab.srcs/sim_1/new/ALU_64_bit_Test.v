`timescale 1ns / 1ps
module ALU_64_bit_Test();

    reg [63:0] a; reg[63:0] b;
    reg CarryIn;
    reg [3:0] ALUOp;
    wire [63:0] Result;
    wire CarryOut;
    wire Zero;
    
    ALU_64_bit ALU64Test (a, b, CarryIn, ALUOp, Result, CarryOut, Zero);
    
    initial begin
        #0
            a = 64'b1010110111001010011001111001101111100001111111110001110010010001;
            b = 64'b1100101001100111100110111110000100101010010101011111111100011100;
            CarryIn = 0; ALUOp = 4'b0000;
        #100
            a = 64'b0011001111011001111011001110011001110011001111011001111011001111;
            b = 64'b1001101110011011001101100110110011011001101100110110011011111111;
            CarryIn = 1; ALUOp = 4'b0001;
        #100
            a = 64'b1110000111100011100011100011100011100011100011100001010101010101;
            b = 64'b0010101000101001010010100101001010010100101010010010010010010010;
            CarryIn = 0; ALUOp = 4'b0010;
        #100
            a = 64'b0101010101010101010101010101010101010101010101010101010101010101;
            b = 64'b1111111111111111111111111111111111111111111111111111111111111111;
            CarryIn = 1; ALUOp = 4'b0110;
        #100
            a = 64'b0001100011100100000110001100011000110000001110011100100100100100;
            b = 64'b1001001001100110010100101001001001000101001001000100011000110001;
            CarryIn = 1; ALUOp = 4'b1100;
    end

endmodule

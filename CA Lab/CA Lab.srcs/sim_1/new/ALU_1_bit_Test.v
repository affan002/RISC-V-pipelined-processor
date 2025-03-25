`timescale 1ns / 1ps

module ALU_1_bit_Test();

    reg a, b, CarryIn;
    reg [3:0] ALUOp;
    wire Result, CarryOut;
    
    ALU_1_bit ALUTest(a, b, CarryIn, ALUOp, Result, CarryOut);
    
    initial
    begin
    
        #0
            a = 0; b = 0; CarryIn = 1; ALUOp = 4'b0000;     // AND
        #100
            a = 0; b = 1; CarryIn = 0; ALUOp = 4'b0000;     // AND
        #100
            a = 1; b = 1; CarryIn = 1; ALUOp = 4'b0000;     // AND
        
        #100
            a = 0; b = 0; CarryIn = 0; ALUOp = 4'b0001;     // OR
        #100
            a = 0; b = 1; CarryIn = 1; ALUOp = 4'b0001;     // OR
        #100
            a = 1; b = 1; CarryIn = 0; ALUOp = 4'b0001;     // OR
            
        #100
            a = 0; b = 0; CarryIn = 0; ALUOp = 4'b0010;     // Adder
        #100
            a = 0; b = 1; CarryIn = 0; ALUOp = 4'b0010;     // Adder
        #100
            a = 1; b = 1; CarryIn = 1; ALUOp = 4'b0010;     // Adder
        
        #100
            a = 0; b = 0; CarryIn = 1; ALUOp = 4'b0110;     // Subtract
        #100
            a = 0; b = 1; CarryIn = 1; ALUOp = 4'b0110;     // Subtract
        #100
            a = 1; b = 1; CarryIn = 1; ALUOp = 4'b0110;     // Subtract
            
        #100
            a = 0; b = 0; CarryIn = 0; ALUOp = 4'b1100;     // NOR
        #100
            a = 0; b = 1; CarryIn = 1; ALUOp = 4'b1100;     // NOR
        #100
            a = 1; b = 1; CarryIn = 0; ALUOp = 4'b1100;     // NOR
            
    end

endmodule

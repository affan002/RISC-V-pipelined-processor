`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 09:48:19 AM
// Design Name: 
// Module Name: control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control_unit(
    input [6:0] Opcode,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );
    always@(*)begin
        if(Opcode==7'b0110011)
            begin
            assign Branch=1'b0;
            assign MemRead=1'b0;
            assign MemtoReg=1'b0;
            assign ALUOp=2'b10;
            assign MemWrite=1'b0;
            assign ALUSrc=1'b0;
            assign RegWrite=1'b1;
            end
        else if(Opcode==7'b0000011)
            begin
            assign Branch=1'b0;
            assign MemRead=1'b1;
            assign MemtoReg=1'b1;
            assign ALUOp=2'b00;
            assign MemWrite=1'b0;
            assign ALUSrc=1'b1;
            assign RegWrite=1'b1;
            end
        else if(Opcode==7'b0100011)
            begin
            assign Branch=1'b0;
            assign MemRead=1'b0;
            assign MemtoReg=1'bx;
            assign ALUOp=2'b00;
            assign MemWrite=1'b1;
            assign ALUSrc=1'b1;
            assign RegWrite=1'b0;
            end
        else if(Opcode==7'b1100011)
            begin
            assign Branch=1'b1;
            assign MemRead=1'b0;
            assign MemtoReg=1'bx;
            assign ALUOp=2'b01;
            assign MemWrite=1'b0;
            assign ALUSrc=1'b0;
            assign RegWrite=1'b0;
            end
    end
endmodule

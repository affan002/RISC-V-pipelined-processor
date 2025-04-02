`timescale 1ns / 1ps


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
        if(Opcode==7'b0110011) begin
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 2'b10;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
        end
        else if(Opcode==7'b0000011) begin
            Branch = 1'b0;
            MemRead = 1'b1;
            MemtoReg = 1'b1;
            ALUOp = 2'b00;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        else if(Opcode==7'b0100011) begin
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'bx;
            ALUOp = 2'b00;
            MemWrite = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
        end
        else if(Opcode==7'b1100011) begin
            Branch = 1'b1;
            MemRead = 1'b0;
            MemtoReg = 1'bx;
            ALUOp = 2'b01;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
        end
    end
endmodule
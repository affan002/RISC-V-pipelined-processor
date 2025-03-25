`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 09:50:49 AM
// Design Name: 
// Module Name: top_control_tb
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


module top_control_tb;

    // Inputs
    reg [6:0] Opcode;
    reg [3:0] Funct;

    // Outputs
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    wire [3:0] Operation;

    // Instantiate the  (UUT)
    top_control uut (
        Opcode,
        Funct,
        Branch,
        MemRead,
        MemtoReg,
        MemWrite,
        ALUSrc,
        RegWrite,
        Operation
    );
    initial begin
       
        // (Opcode = 7'b0110011, Funct = 4'b0000)
        Opcode = 7'b0110011; Funct = 4'b0000; // ADD operation
        #10;

        // (Opcode = 7'b0000011)
        Opcode = 7'b0000011; Funct = 4'bxxxx; // Funct is don't-care
        #10;

        // (Opcode = 7'b0100011)
        Opcode = 7'b0100011; Funct = 4'bxxxx; // Funct is don't-care
        #10;
    end
endmodule

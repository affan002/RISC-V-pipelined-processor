`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 11:34:33 PM
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
     input clk, reset,
     input ID_EX_RegWrite, ID_EX_MemToReg, ID_EX_Branch, ID_EX_MemWrite, ID_EX_MemRead, Zero,
     input [63:0] ALU_result, ID_EX_ReadData2, Branch_address,
     input [4:0] ID_EX_RD,
     
     output reg EX_MEM_RegWrite, EX_MEM_MemToReg, EX_MEM_Branch, EX_MEM_MemWrite, EX_MEM_MemRead,
    output reg [63:0] EX_MEM_ALU_result, EX_MEM_ReadData2, EX_MEM_Branch_address,
    output reg EX_MEM_zero,
    output reg [4:0] EX_MEM_RD
     
    );
    always @(posedge clk) begin
        if (reset) begin
            // Reset all outputs to default values
            EX_MEM_RegWrite <= 0;
            EX_MEM_MemToReg <= 0;
            EX_MEM_Branch <= 0;
            EX_MEM_MemWrite <= 0;
            EX_MEM_MemRead <= 0;
            
            EX_MEM_ALU_result <= 64'b0;
            EX_MEM_ReadData2 <= 64'b0;
            EX_MEM_Branch_address <= 64'b0;
            
            EX_MEM_zero <= 0;
            
            EX_MEM_RD <= 5'b0;
        end
        else begin
            // Pass input values to outputs (pipeline register functionality)
            EX_MEM_RegWrite <= ID_EX_RegWrite;
            EX_MEM_MemToReg <= ID_EX_MemToReg;
            EX_MEM_Branch <= ID_EX_Branch;
            EX_MEM_MemWrite <= ID_EX_MemWrite;
            EX_MEM_MemRead <= ID_EX_MemRead;
            
            EX_MEM_ALU_result <= ALU_result;
            EX_MEM_ReadData2 <= ID_EX_ReadData2;
            EX_MEM_Branch_address <= Branch_address;
            
            EX_MEM_zero <= Zero;
            
            EX_MEM_RD <= ID_EX_RD;
        end
    end
    
endmodule

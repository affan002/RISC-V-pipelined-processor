`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 11:44:19 PM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
input clk, reset,
    // Control signals from EX/MEM stage
    input EX_MEM_RegWrite, EX_MEM_MemToReg,
    // Data values from memory stage
    input [63:0] ReadData, EX_MEM_ALU_result,
    // Destination register
    input [4:0] EX_MEM_RD,
    
    // Control signals passed to Writeback stage
    output reg MEM_WB_RegWrite, MEM_WB_MemToReg,
    // Data values passed to Writeback stage
    output reg [63:0] MEM_WB_ReadData, MEM_WB_ALU_result,
    // Destination register passed to Writeback stage
    output reg [4:0] MEM_WB_RD
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all outputs to default values
            MEM_WB_RegWrite <= 0;
            MEM_WB_MemToReg <= 0;
            
            MEM_WB_ReadData <= 64'b0;
            MEM_WB_ALU_result <= 64'b0;
            
            MEM_WB_RD <= 5'b0;
        end
        else begin
            // Pass input values to outputs (pipeline register functionality)
            MEM_WB_RegWrite <= EX_MEM_RegWrite;
            MEM_WB_MemToReg <= EX_MEM_MemToReg;
            
            MEM_WB_ReadData <= ReadData;
            MEM_WB_ALU_result <= EX_MEM_ALU_result;
            
            MEM_WB_RD <= EX_MEM_RD;
        end
    end
endmodule

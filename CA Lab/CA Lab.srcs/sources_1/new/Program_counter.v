`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 10:39:47 PM
// Design Name: 
// Module Name: Program_counter
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


module Program_Counter(
input clk, reset,
input [63:0] PC_In,
output reg [63:0] PC_Out
    );
    
    reg pc_s;
    always @(posedge clk or posedge reset) begin
        if (~reset) begin
            if (PC_In > 199) begin
                PC_Out <= 0;
            end else begin
                if (~pc_s) begin
                    PC_Out <= 0;
                    pc_s <= 1;
                end else begin
                PC_Out <= PC_In; end
            end
        end else begin
            pc_s <= 0;
            PC_Out <= 0;
        end
    end

endmodule

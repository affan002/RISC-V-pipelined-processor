`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 09:46:12 AM
// Design Name: 
// Module Name: ALU_control
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


module ALU_control(
    input [1:0] ALUOp,
    input [3:0] Funct,
    output reg [3:0] Operation
    );
    
    always @(*) begin
        
        if (ALUOp == 2'b00) 
        begin
             Operation = 4'b0010;
        end
        else if (ALUOp == 2'b01) 
        begin
             Operation = 4'b0110;
        end
        else if (ALUOp == 2'b10) 
        
        begin
            if (Funct == 4'b0000)
             begin
                 Operation = 4'b0010;
            end
            else if (Funct == 4'b1000) 
            begin
                 Operation = 4'b0110;
            end 
            else if (Funct == 4'b0111)
             begin
               Operation = 4'b0000;
            end 
            else if (Funct == 4'b0110)
             begin
                Operation = 4'b0001;
            end            
        end
    end
endmodule

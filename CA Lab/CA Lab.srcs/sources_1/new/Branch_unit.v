`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025 08:04:49 PM
// Design Name: 
// Module Name: Branch_unit
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


module Branch_unit(
    input funct3,
    input Zero,
    input lessThan,
    output branchSel
    );
    
    assign branchSel = (funct3 == 3'b000) ? Zero:
                       (funct3 == 3'b100) ? lessThan :
                       1'b0;
    
   
endmodule

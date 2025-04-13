`timescale 1ns / 1ps
module ALU_64_bit(
    input [63:0] a, [63:0] b,
    input [3:0] ALUOp,
    output reg [63:0] Result,
    output Zero,
    output lessThan
    );
   
//        (ALUOp == 4'b0000) ? {1'b0, a & b} :           // AND operation
//        (ALUOp == 4'b0001) ? {1'b0, a | b} :           // OR operation
//        (ALUOp == 4'b0010) ? a + b :                   // ADD operation
//        (ALUOp == 4'b0110) ? a - b :                   // SUB operation
//        {1'b0, ~(a | b)};                              // NOR (default)
     wire signed [63:0] signed_a = a;
     wire signed [63:0] signed_b = b;
     
     
     always @(ALUOp, a, b) begin
        case (ALUOp)
           4'b0000: Result <= a&b;
           4'b0001: Result <= a|b;
           4'b0010: Result <= a+b;
           4'b0110: Result <= a-b;
           4'b1100: Result <= ~a & ~b;
           4'b1000: Result <= a << b;
           default: Result <= 64'b0;
        endcase
     end           
    
    
    assign Zero = (Result == 0);
    
    assign lessThan = (signed_a < signed_b);
     
    
endmodule

`timescale 1ns / 1ps
module ALU_64_bit(
    input [63:0] a, [63:0] b,
    input CarryIn,
    input [3:0] ALUOp,
    output [63:0] Result,
    output CarryOut,
    output Zero
    );
    
    
    assign {CarryOut, Result} = (ALUOp == 4'b0000) ? a && b : (ALUOp == 4'b0001) ? a || b :
                    (ALUOp == 4'b0010) ? a + b : (ALUOp == 4'b0110) ? a - b : ~(a || b);
                    
    assign Zero = (Result == 0) ? 1 : 0;
    
    
endmodule

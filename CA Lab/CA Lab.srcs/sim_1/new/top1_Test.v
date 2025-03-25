`timescale 1ns / 1ps

module top1_Test();

    reg [31:0] instruction;
    wire [63:0] ReadData1;
    wire [63:0] ReadData2;
    
    top1 topModuleTest (instruction, ReadData1, ReadData2);
    
    initial
    begin
    
        instruction = 32'b10110111001001010110011001101001;
        
        #100
        instruction = 32'b01101011010011011100110101010011;
        
        #100
        instruction = 32'b11001110101101001111010100110000;
    
    end

endmodule

`timescale 1ns / 1ps
module registerFile(
    input [63:0] WriteData,
    input [4:0] RS1,
    input [4:0] RS2,
    input [4:0] RD,
    input RegWrite,
    input Clk,
    input Reset,
    output reg [63:0] ReadData1,
    output reg [63:0] ReadData2
    );
    
    reg [63:0] array [31:0];
    
    integer i;
    initial
    begin
        for (i = 0; i < 32; i = i + 1) begin
            array[i] = i + 1;
        end
    end
    
    always @(posedge Clk)
    begin
        if (RegWrite)
            array[RD] <= WriteData;
    end
    
    always @(*)
    begin
        if (Reset)
        begin
            ReadData1 <= 0;
            ReadData2 <= 0;
        end
        else
        begin
            ReadData1 <= array[RS1];
            ReadData2 <= array[RS2];
        end
    end
    
endmodule

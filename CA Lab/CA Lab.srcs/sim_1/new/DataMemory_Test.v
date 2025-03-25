`timescale 1ns / 1ps
module DataMemory_Test();

    reg [63:0] Memory_Address;
    reg [63:0] Write_Data;
    reg clk;
    reg MemWrite;
    reg MemRead;
    wire [63:0] Read_Data;
    
    Data_Memory DM (Memory_Address, Write_Data, clk, MemWrite, MemRead, Read_Data);
    
    initial
    begin
    
        clk = 0;
        Memory_Address = 20;    Write_Data = 35;
        
        #0
            MemWrite = 0;   MemRead = 0;
            
        #100
            MemWrite = 1;   MemRead = 0;
            
        #100
            MemWrite = 0;   MemRead = 1;
        
    
    end
    
    always
        #5 clk = ~clk;

endmodule

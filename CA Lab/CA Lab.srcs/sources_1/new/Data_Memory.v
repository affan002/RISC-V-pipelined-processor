`timescale 1ns / 1ps
module Data_Memory(
    input [63:0] Memory_Address,
    input [63:0] Write_Data,
    input clk,
    input MemWrite,
    input MemRead,
    output reg [63:0] Read_Data
    );
    
    reg [7:0] DataMemory [63:0];
    
    integer i;
    initial
    begin
        for (i = 0; i < 64; i = i + 1) begin
            DataMemory[i] = i;
        end
    end
    
    always @ (posedge clk)
    begin
        if (MemWrite) begin
            DataMemory[Memory_Address+7] <= Write_Data[63:56];
            DataMemory[Memory_Address+6] <= Write_Data[55:48];
            DataMemory[Memory_Address+5] <= Write_Data[47:40];
            DataMemory[Memory_Address+4] <= Write_Data[39:32];
            DataMemory[Memory_Address+3] <= Write_Data[31:24];
            DataMemory[Memory_Address+2] <= Write_Data[23:16];
            DataMemory[Memory_Address+1] <= Write_Data[15:8];
            DataMemory[Memory_Address] <= Write_Data[7:0];
        end
    end
    
    always @ (*)
    begin
        if (MemRead) begin
            Read_Data <= {DataMemory[Memory_Address+7], DataMemory[Memory_Address+6], DataMemory[Memory_Address+5], DataMemory[Memory_Address+4],
                        DataMemory[Memory_Address+3], DataMemory[Memory_Address+2], DataMemory[Memory_Address+1], DataMemory[Memory_Address+0]};
        end
    end
    
endmodule

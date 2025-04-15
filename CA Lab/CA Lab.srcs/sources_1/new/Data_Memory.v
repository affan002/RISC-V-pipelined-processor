`timescale 1ns / 1ps
module Data_Memory(
    input [63:0] Memory_Address,
    input [63:0] Write_Data,
    input clk,
    input MemWrite,
    input MemRead,
    output reg [63:0] ReadData,
    
    // outputs for waveform display
    output [63:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9
    );
    
    reg [7:0] DataMemory [99:0];
    
    integer i;
    initial
    begin
        for (i = 0; i < 100; i = i + 1)
            DataMemory[i] = 0;
        DataMemory[0] = 10; //7 in decimal
        DataMemory[8] = 9; // 6 in decimal
        DataMemory[16] = 8; // 5 in decimal
        DataMemory[24] = 7; // 4 in decimal
        DataMemory[32] = 6; // 3 in decimal
        DataMemory[40] = 5; // 2 in decimal
        DataMemory[48] = 4; // 1 in decimal
        DataMemory[56] = 3;
        DataMemory[64] = 2;
        DataMemory[72] = 1;
    end
    
    
    // displaying the whole DataMemory
    assign w0 = {DataMemory[7], DataMemory[6], DataMemory[5], DataMemory[4], DataMemory[3], DataMemory[2], DataMemory[1], DataMemory[0]};
    assign w1 = {DataMemory[15], DataMemory[14], DataMemory[13], DataMemory[12], DataMemory[11], DataMemory[10], DataMemory[9], DataMemory[8]};
    assign w2 = {DataMemory[23], DataMemory[22], DataMemory[21], DataMemory[20], DataMemory[19], DataMemory[18], DataMemory[17], DataMemory[16]};
    assign w3 = {DataMemory[31], DataMemory[30], DataMemory[29], DataMemory[28], DataMemory[27], DataMemory[26], DataMemory[25], DataMemory[24]};
    assign w4 = {DataMemory[39], DataMemory[38], DataMemory[37], DataMemory[36], DataMemory[35], DataMemory[34], DataMemory[33], DataMemory[32]};
    assign w5 = {DataMemory[47], DataMemory[46], DataMemory[45], DataMemory[44], DataMemory[43], DataMemory[42], DataMemory[41], DataMemory[40]};
    assign w6 = {DataMemory[55], DataMemory[54], DataMemory[53], DataMemory[52], DataMemory[51], DataMemory[50], DataMemory[49], DataMemory[48]};
    assign w7 = {DataMemory[63], DataMemory[62], DataMemory[61], DataMemory[60], DataMemory[59], DataMemory[58], DataMemory[57], DataMemory[56]};
    assign w8 = {DataMemory[71], DataMemory[70], DataMemory[69], DataMemory[68], DataMemory[67], DataMemory[66], DataMemory[65], DataMemory[64]};
    assign w9 = {DataMemory[79], DataMemory[78], DataMemory[77], DataMemory[76], DataMemory[75], DataMemory[74], DataMemory[73], DataMemory[72]};
    
    always @ (posedge clk)
    begin
        if (MemWrite==1'b1) begin
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
        if (MemRead==1'b1) begin
             ReadData[7:0] <= DataMemory[Memory_Address+0];
             ReadData[15:8] <= DataMemory[Memory_Address+1];
             ReadData[23:16] <= DataMemory[Memory_Address+2];
             ReadData[31:24] <= DataMemory[Memory_Address+3];
             ReadData[39:32] <= DataMemory[Memory_Address+4];
             ReadData[47:40] <= DataMemory[Memory_Address+5];
             ReadData[55:48] <= DataMemory[Memory_Address+6];
             ReadData[63:56] <= DataMemory[Memory_Address+7];
        end
    else begin
        ReadData = 64'bx; // Default value when not reading
    end
    end
    
endmodule

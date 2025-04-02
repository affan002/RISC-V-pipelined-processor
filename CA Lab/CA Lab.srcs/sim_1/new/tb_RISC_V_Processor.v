`timescale 1ns / 1ps

module RISC_V_Processor_tb();
    // Testbench signals
    reg clk;
    reg reset;
    wire [63:0] pc_out;
    
    // Instantiate the processor
    RISC_V_Processor uut (
        .clk(clk),
        .reset(reset)
    );
    
    // Monitor PC for debugging
    assign pc_out = uut.pc_out;
    
    // Clock generation - 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        // Initialize and reset
        reset = 1;
        #15; // Hold reset for 15ns
        reset = 0;
        
        // Run for 8 clock cycles (enough for our 4 instructions)
        #80;
        
        // End simulation
        $finish;
    end
    
endmodule
`timescale 1ns / 1ps

module RISC_V_tb();
    reg clk, reset;
    
    RISC_V_Processor u1(clk, reset);
    
    // Inputs
    reg clk;
    reg reset;
    
    // Instantiate the processor
    RISC_V_Processor uut (
        .clk(clk),
        .reset(reset)
    );
    
    // Test sequence
    initial begin
        // Initialize with reset
        reset = 1;
        #20; // Hold reset for 20ns
        reset = 0;
        
        // Run simulation for a sufficiently long time
        #200;
    end
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end
    
    // Monitor all wires within the processor (these will be available in waveform)
    // IF stage wires
    wire [63:0] pc_in = uut.PC_in;
    wire [63:0] pc_out = uut.PC_out;
    wire [63:0] out1 = uut.Out1;
    wire [63:0] out2 = uut.Out2;
    wire [31:0] instruction = uut.Instruction;
    
    // ID stage wires
    wire [6:0] opcode = uut.opcode;
    wire [4:0] rd = uut.RD;
    wire [2:0] func3 = uut.func3;
    wire [4:0] rs1 = uut.RS1;
    wire [4:0] rs2 = uut.RS2;
    wire [6:0] func7 = uut.func7;
    wire [63:0] immdata = uut.ImmData;
    wire [63:0] readdata1 = uut.ReadData1;
    wire [63:0] readdata2 = uut.ReadData2;
    
    // Control signals
    wire branch = uut.Branch;
    wire memread = uut.MemRead;
    wire memtoreg = uut.MemtoReg;
    wire [1:0] aluop = uut.ALUOp;
    wire memwrite = uut.MemWrite;
    wire alusrc = uut.ALUSrc;
    wire regwrite = uut.RegWrite;
    wire branchselect = uut.BranchSelect;
    wire branch_taken = uut.Branch & uut.BranchSelect;
    
    // EXE stage wires
    wire [63:0] shifted_data = uut.shifted_data;
    wire [63:0] data_out = uut.Data_Out;
    wire [3:0] funct = uut.Funct;
    wire [3:0] operation = uut.Operation;
    wire [63:0] result = uut.Result;
    wire zero = uut.Zero;
    wire lessthan = uut.lessThan;
    
    // MEM stage wires
    wire [63:0] readdata = uut.ReadData;
    
    // Data memory monitoring
    wire [63:0] mem_w0 = uut.w0;
    wire [63:0] mem_w1 = uut.w1;
    wire [63:0] mem_w2 = uut.w2;
    wire [63:0] mem_w3 = uut.w3;
    wire [63:0] mem_w4 = uut.w4;
    wire [63:0] mem_w5 = uut.w5;
    wire [63:0] mem_w6 = uut.w6;
    
    // WB stage wires
    wire [63:0] writedata = uut.WriteData;
    
    // Component-specific wires
    // ALU Control
    wire [3:0] alu_operation = uut.ALUC.Operation;
    
    // Data Memory
    wire [63:0] dm_read_data = uut.DM.ReadData;
    wire dm_memread = uut.DM.MemRead;
    wire dm_memwrite = uut.DM.MemWrite;
    
    // Branch Unit
    wire branch_unit_out = uut.branch_decision.branchSel;
    
endmodule
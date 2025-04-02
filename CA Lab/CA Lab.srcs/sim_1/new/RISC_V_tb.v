`timescale 1ns / 1ps

module RISC_V_tb();
    // Testbench signals
    reg clk;
    reg reset;
   
    RISC_V_Processor test (
        .clk(clk),
        .reset(reset)
    );
    
    // PC related signals
    wire [63:0] pc_in = test.pc_in;
    wire [63:0] pc_out = test.pc_out;
    
    // Instruction related signals
    wire [31:0] instruction = test.instruction;
    wire [6:0] opcode = test.opcode;
    wire [4:0] rd = test.rd;
    wire [2:0] func3 = test.func3;
    wire [4:0] rs1 = test.rs1;
    wire [4:0] rs2 = test.rs2;
    wire [6:0] func7 = test.func7;
    
    // Control unit signals
    wire branch = test.branch;
    wire mem_read = test.mem_read;
    wire mem_to_reg = test.mem_to_reg;
    wire [1:0] alu_op = test.alu_op;
    wire mem_write = test.mem_write;
    wire alu_src = test.alu_src;
    wire reg_write = test.reg_write;
    
    // Immediate data signals
    wire [63:0] imm = test.imm;
    
    // Register and datapath signals
    wire [63:0] rs1_data = test.rs1_data;
    wire [63:0] rs2_data = test.rs2_data;
    wire [63:0] next_ins_address = test.next_ins_address;
    wire [63:0] branch_ins_address = test.branch_ins_address;
    
    // ALU control signals
    wire [3:0] operation = test.operation;
    
    // ALU-related signals
    wire [63:0] alu_second_operand = test.alu_second_operand;
    wire zero = test.zero;
    wire carryOut = test.carryOut;
    wire [63:0] alu_result = test.alu_result;
    
    // Memory-related signals
    wire [63:0] read_data = test.read_data;
    wire [63:0] write_data = test.write_data;
    
    initial begin 
        reset = 1;
        clk = 0;
        #20 reset = 0;  // Release reset after 20ns
    end
    always #5 clk = ~clk;
    
endmodule
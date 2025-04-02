`timescale 1ns / 1ps
module RISC_V_Processor(
    input clk,
    input reset
);
// wires for pc
wire [63:0] pc_in;
wire [63:0] pc_out;

// wires for instruction memory 
wire [31:0] instruction;
wire [6:0] opcode;
wire [4:0] rd;
wire [2:0] func3;
wire [4:0] rs1;
wire [4:0] rs2;
wire [6:0] func7;

// wires for control_unit
wire branch;
wire mem_read;
wire mem_to_reg;
wire [1:0] alu_op;
wire mem_write;
wire alu_src;
wire reg_write;

// wire for immediate data extractor
wire [63:0] imm;

wire [63:0] rs1_data;
wire [63:0] rs2_data;
wire [63:0] next_ins_address;
wire [63:0] branch_ins_address;

// wire for ALU control 
wire [3:0] operation;

//select between rs1 and immediate
wire [63:0] alu_second_operand;
wire zero;
wire carryOut;
wire [63:0] alu_result;

// data 
wire [63:0] read_data;
wire [63:0] write_data;

Program_Counter PC (clk, reset, pc_in, pc_out);

Instruction_Memory Instruction_Memory (pc_out, instruction);

instruction_parser Instruction_Parser (instruction, opcode, rd, func3, rs1, rs2, func7);

control_unit Control_Unit (opcode, branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write);

registerFile Registers (write_data, rs1, rs2, rd, reg_write, clk, reset, rs1_data, rs2_data);

immediate_data_extractor Immediate_DE (instruction, imm);

Adder Adder (pc_out, 4, next_ins_address);

Adder Branch_Adder (pc_out, imm << 1 , branch_ins_address);

ALU_control ALU_control (alu_op, {instruction[30], instruction[14:12]}, operation);

mux Register_mux (rs2_data, imm, alu_src, alu_second_operand);

ALU_64_bit ALU (rs1_data, alu_second_operand, 0,operation, alu_result, carryOut, zero );

mux PC_mux (next_ins_address, branch_ins_address, zero && branch, pc_in);

Data_Memory Data_Memory (alu_result, rs2_data, clk, mem_write, mem_read, read_data);

mux Writeback_mux (alu_result, read_data, mem_to_reg, write_data);

    
endmodule
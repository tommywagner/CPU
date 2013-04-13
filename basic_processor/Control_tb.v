`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:42:06 02/16/2012
// Design Name:   Control
// Module Name:   /department/home/leporter/Desktop/basic_processor/Control_tb.v
// Project Name:  basic_processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_tb;

	// Inputs
	reg [3:0] OPCODE;

	// Outputs
	wire [1:0] ALU_OP;
	wire [1:0] ALU_SRC_B;
	wire REG_WRITE;
	wire BRANCH;
	wire MEM_WRITE;
	wire MEM_READ;
	wire REG_DST;
	wire MEM_TO_REG;
	wire HALT;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.OPCODE(OPCODE), 
		.ALU_OP(ALU_OP), 
		.ALU_SRC_B(ALU_SRC_B), 
		.REG_WRITE(REG_WRITE), 
		.BRANCH(BRANCH), 
		.MEM_WRITE(MEM_WRITE), 
		.MEM_READ(MEM_READ), 
		.REG_DST(REG_DST), 
		.MEM_TO_REG(MEM_TO_REG), 
		.HALT(HALT)
	);

	initial begin
		// Initialize Inputs
		OPCODE = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


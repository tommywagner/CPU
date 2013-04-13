`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:09:07 02/16/2012
// Design Name:   TopLevel
// Module Name:   /department/home/leporter/Desktop/basic_processor/TopLevel_tb.v
// Project Name:  basic_processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TopLevel
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TopLevel_tb;

	// Inputs
	reg start;
	reg CLK;

	// Outputs
	wire halt;
	wire [3:0] write_register;
	wire [15:0] regWriteValue;
	wire REG_WRITE;
	wire [15:0] memWriteValue;
	wire MEM_WRITE;
	wire [7:0] PC;
	wire BRANCH;
	wire [15:0] InstCounter;
	wire [9:0] Instruction;

	// Instantiate the Unit Under Test (UUT)
	TopLevel uut (
		.start(start), 
		.CLK(CLK), 
		.halt(halt), 
		.write_register(write_register),
		.regWriteValue(regWriteValue), 
		.REG_WRITE(REG_WRITE), 
		.memWriteValue(memWriteValue), 
		.MEM_WRITE(MEM_WRITE), 
		.PC(PC), 
		.BRANCH(BRANCH), 
		.InstCounter(InstCounter),
		.Instruction(Instruction)


	);

	initial begin
		// Initialize Inputs
		start = 0;
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
      start = 1; 
		#10;
		start = 0;
		// Add stimulus here

	end

  always begin
     #5  CLK = ~CLK; // Toggle clock every 5 ticks
  end
      
endmodule


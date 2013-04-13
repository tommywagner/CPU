`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 	Leo Porter
// 
// Create Date:    15:50:22 11/02/2007 
// Design Name: 
// Module Name:    InstROM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This is a basic verilog module to behave as an instruction ROM
// 				 template.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module InstROM(InstAddress, InstOut);
    input [7:0] InstAddress;
    output [9:0] InstOut;
	 
	 // Instructions have [4bit opcode][3bit rs or rt][3bit rt, immediate, or branch target]

	 reg[9:0] InstOut;
	 
	 always @ (InstAddress)
		begin
		case (InstAddress)
		
			// opcode = 0 lhw, rs = 0, rt = 1
		0 : InstOut = 10'b 0010111110;  // load from address at reg 0 to reg 1  
			// opcode = 1 addi, rs/rt = 1, immediate = 1
      
		1 : InstOut = 10'b0010111000;  // addi reg 1 and 1
		// replace instruction 1 with the following to produce an infinite loop (shows branch working)
		//1 : InstOut = 10'b0001001000;  // addi reg 1 and 0
		
		// opcode = 2 shw, rs = 0, rt = 1
		2 : InstOut = 10'b0001001000;  // sw reg 1 to address in reg 0
		
		// opcode = 3 beqz, rs = 1, target = 1
      3 : InstOut = 10'b0001001000;  // beqz reg1 to absolute address 1
		
		// opcode = 15 halt
		4 : InstOut = 10'b0001001000;  // halt
		
		5  : InstOut = 10'b0001001000;  // halt
		
		
		6 : InstOut = 10'b0001010000;  // halt
		7 : InstOut = 10'b0011000000;  // halt
		8 : InstOut = {6'b101110, -4'b0010};
		9 : InstOut = 10'b0100000000;  // halt
		default : InstOut = 10'b0000000000;
    endcase
  end

endmodule

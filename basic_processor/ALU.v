`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:04:22 10/27/2011 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
    input CLK,
    input [2:0] OP,
    input [15:0] INPUTA,
    input [15:0] INPUTB,
    output reg [15:0] OUT,
    output reg ZERO,
	 output wire EQUAL
    );
	 
	assign EQUAL = (INPUTA == INPUTB) ? 1 : 0;
	
	always @(INPUTA, INPUTB, OP)
	begin
	
	case(OP)
		0 : OUT = INPUTA&INPUTB;
		1 : OUT = INPUTB;
		2 : OUT = INPUTA+INPUTB;
		3 : OUT = {INPUTA[7:0], INPUTB[15:8]};
		4 : OUT = INPUTB<<INPUTA;
		5 : OUT = INPUTA-INPUTB;
		default: OUT = 0;
	endcase
	 
	case(OUT)
		16'b0 : ZERO = 1'b1;
		default : ZERO = 1'b0;
	endcase
	//$display("ALU Out %d \n",OUT);
	end

endmodule

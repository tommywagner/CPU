`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:49 02/16/2012 
// Design Name: 
// Module Name:    IF 
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
module IF(
    input Beq,
	 input ALUZero,
    input [3:0] TargetRelative,
	 input [15:0] TargetAbsolute,
	 
	 // if PC-Control is a 0, we branch to either PC+1 or PC+4	 
	 // else it is a direct write from TargetAbsolute (this is output of ALU)
	 input PC_CTRL, 
    input Init,
    input Halt,
	 input CLK,	 
	 
	 
	 
    output reg[7:0] PC
    );
	 
	 always @(posedge CLK)
	 begin
		 if(PC_CTRL == 0) begin //either normal increment or relative branch
				
			if((Beq==1) && (ALUZero == 1))begin
				PC = PC + TargetRelative[3:0]; //relative branch
				
			end else begin
				PC = PC+1;
				
			end
			
		end else begin
			PC = TargetAbsolute[15:0];//direct branch
		end
		
		//special cases, init and halt
		if(Init==1)begin
			PC = 0;
		end else if(Halt==1) begin
			PC = PC;
		end
			
	 end


endmodule

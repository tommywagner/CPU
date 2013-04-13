`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:24:09 10/27/2011 
// Design Name: 
// Module Name:    reg_file 
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

module reg_file(
	 input wire CLK,
	 input init,
	 
	 input wire RegWrite,
	 input [3:0] R1_CTRL,
	 input [3:0] R2_CTRL,
    input [3:0] writeReg,
    input [15:0] writeValue,
	 input [9:0] instr,
	 output reg [15:0] ReadA,
    output reg [15:0] ReadB
    );
	 
	reg [15:0] registers[15:0];
	
		/*
		0		$t1
		1		$t2
		2		$t3
		3		$t4
		4		$t5
		5		$t6
		6		$beq1
		7		$zero
		8		$beq2
		9		$one
		10		$negone
		11		$nine
		12		$sixteen
		13		$fourtyeight
		14		$load
		*/
			
	always@ (instr)
	begin
		$display("ctrl %d isntr %d", R1_CTRL, instr[6:3]);
		
		case (R1_CTRL)
			0:  ReadA = registers[instr[6:3]]; 			// (add+shift+join) first reg (4 bits)
			1:  ReadA = registers[{1'b0, instr[5:3]}];// (and) first reg (3 bits, concatenate 0 to front)
			2:  ReadA = registers[7];						//	reg $zero
			3:  ReadA = registers[6];						//	reg $beq1
			4:  ReadA = registers[3];						// reg $t4
			5:  ReadA = registers[14];						// reg $load
			6:  ReadA = registers[instr[9:6]];			// last 4 bits of instr
		endcase
		
		case (R2_CTRL)
			0:  ReadB = registers[instr[2:0]]; 			// last three bits for reg
			1:  ReadB = registers[7];						//	reg $zero
			2:  ReadB = registers[6];						//	reg $beq1
			3:  ReadB = registers[9];						// reg $one
		endcase
	

		if(init==1)
		begin
			 registers[7]  =   16'b0;
			 registers[9]  =   16'b1;
			 registers[10] =  -16'd1;
			 registers[11] =   16'd 9;
			 registers[12] =   16'd 16;
			 registers[13] =   16'd 48;
		end
		
	end

always @ (posedge CLK)
begin
  if (RegWrite && (writeReg != 4'd7) && (writeReg != 4'd9)&& 
  (writeReg != 4'd10)&& (writeReg != 4'd11)&& (writeReg != 4'd12)&& 
  (writeReg != 4'd13))
  begin
    registers[writeReg] <= writeValue;
  end
end

endmodule

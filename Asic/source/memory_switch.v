`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:10 02/27/2022 
// Design Name: 
// Module Name:    memory_switch 
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
module memory_switch(addr, clk,
in_A_1, in_B_1, in_C_1, in_D_1, in_E_1, in_F_1, in_G_1, in_H_1,
in_A_2, in_B_2, in_C_2, in_D_2, in_E_2, in_F_2, in_G_2, in_H_2,
out_A, out_B, out_C, out_D, out_E, out_F, out_G, out_H);
	 
	input wire addr, clk;
	input wire [31:0] in_A_1, in_B_1, in_C_1, in_D_1, 
		in_E_1, in_F_1, in_G_1, in_H_1;
	input wire [31:0] in_A_2, in_B_2, in_C_2, in_D_2, 
		in_E_2, in_F_2, in_G_2, in_H_2;
	output reg [31:0] out_A, out_B, out_C, out_D, out_E, 
		out_F, out_G, out_H;
	 
	always @(posedge clk) begin
		if (addr == 0) begin
			out_A = in_A_1;
			out_B = in_B_1;
			out_C = in_C_1;
			out_D = in_D_1;
			out_E = in_E_1;
			out_F = in_F_1;
			out_G = in_G_1;
			out_H = in_H_1;
		end else begin
			out_A = in_A_2;
			out_B = in_B_2;
			out_C = in_C_2;
			out_D = in_D_2;
			out_E = in_E_2;
			out_F = in_F_2;
			out_G = in_G_2;
			out_H = in_H_2;
		end
	end
  
endmodule


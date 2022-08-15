`timescale 1ns / 1ps
`include "func_sigma1.v"
`include "func_ch.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:17 02/21/2022 
// Design Name: 
// Module Name:    func_t1 
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
module func_t1
(in_E, in_F, in_G, in_H, in_Ki, in_Wi, func);
	
	input wire[31:0] in_E; 
	input wire[31:0] in_F;
	input wire[31:0] in_G;
	input wire[31:0] in_H;
	input wire[31:0] in_Ki;
	input wire[31:0] in_Wi;
	output wire[31:0] func;
	
	wire[31:0] wire_sigma1;
	wire[31:0] wire_Ch;
	
	func_sigma1 s1(.in_E(in_E), 
		.func(wire_sigma1));
	func_ch ch(.in_E(in_E), .in_F(in_F),
		.in_G(in_G), .func(wire_Ch));
	
	assign func = in_H + wire_sigma1 + wire_Ch +
			in_Ki + in_Wi;

endmodule

`timescale 1ns / 1ps
`include "func_sigma0.v"
`include "func_Ma.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:22:36 02/19/2022 
// Design Name: 
// Module Name:    func_t2 
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
module func_t2(in_A, in_B, in_C, func);
	
	input wire[31:0] in_A, in_B, in_C; 
	output wire[31:0] func;
	
	wire[31:0] wire_sigma0, wire_Ma;
	
	func_sigma0 s0(.in_A(in_A), 
		.func(wire_sigma0));
	func_Ma ma(.in_A(in_A), .in_B(in_B),
		.in_C(in_C), .func(wire_Ma));
	
    assign func = wire_sigma0 + wire_Ma;
	
endmodule

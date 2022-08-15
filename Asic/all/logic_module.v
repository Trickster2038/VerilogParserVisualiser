`timescale 1ns / 1ps
`include "func_t1.v"
`include "func_t2.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:25:40 02/21/2022 
// Design Name: 
// Module Name:    logical_module
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
module logic_module
(in_A, in_B, in_C, in_D, 
in_E, in_F, in_G, in_H,

in_Ki, in_Wi,

out_A, out_B, out_C, out_D, 
out_E, out_F, out_G, out_H);

		input wire [31:0] in_A, in_B, in_C,
		in_D, in_E, in_F, in_G, in_H;
		
		input wire [31:0] in_Ki, in_Wi;
		
		output [31:0] out_A, out_E;
		output wire [31:0] out_B, out_C, out_D,
			out_F, out_G, out_H;
		
		wire[31:0] wire_t1, wire_t2;
		
		assign out_H = in_G;
		assign out_G = in_F;
		assign out_F = in_E;
		
		assign out_D = in_C;
		assign out_C = in_B;
		assign out_B = in_A;
		
		func_t1 t1(.in_E(in_E), .in_F(in_F), 
		.in_G(in_G), 
		.in_H(in_H), .in_Ki(in_Ki), .in_Wi(in_Wi), 
		.func(wire_t1));
		
		func_t2 t2(.in_A(in_A), .in_B(in_B), 
		.in_C(in_C), .func(wire_t2));
		
		assign out_E = in_D + wire_t1;
		assign out_A = wire_t1 + wire_t2;

endmodule
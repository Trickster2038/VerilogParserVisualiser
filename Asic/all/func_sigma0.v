`timescale 1ns / 1ps
`include "right_cyclic_shift.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:31:51 02/19/2022 
// Design Name: 
// Module Name:    func_sigma0 
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
module func_sigma0(in_A, func);

	input wire[31:0] in_A;
	output wire[31:0] func;
	
	wire[31:0] A2, A13, A22;
	
	right_cyclic_shift #(2) 
	A2_node( .out (A2), .num (in_A));

	right_cyclic_shift #(13) 
	A13_node( .out (A13), .num (in_A));

	right_cyclic_shift #(22) 
	A22_node( .out (A22), .num (in_A));	
	
	assign func = A2 ^ A13 ^ A22;

endmodule

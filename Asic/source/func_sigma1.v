`timescale 1ns / 1ps
`include "right_cyclic_shift.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:15 02/21/2022 
// Design Name: 
// Module Name:    func_ch 
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
module func_sigma1(in_E, func);

	input wire[31:0] in_E;
	output wire[31:0] func;
	
	wire[31:0] E6, E11, E25;
	
	right_cyclic_shift #(6) 
	E6_node( .out (E6), .num (in_E));

	right_cyclic_shift #(11) 
	E11_node( .out (E11), .num (in_E));

	right_cyclic_shift #(25) 
	E25_node( .out (E25), .num (in_E));	
	
	assign func = E6 ^ E11 ^ E25;

endmodule

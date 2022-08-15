`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:19 02/21/2022 
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
module func_ch(in_E, in_F, in_G, func);

	input wire[31:0] in_E, in_F, in_G;
	output wire[31:0] func;
	
	assign func = (in_E & in_F) ^ ((~in_E) & in_G);

endmodule

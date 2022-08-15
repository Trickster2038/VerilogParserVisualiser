`ifndef ROTR
`define ROTR
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:12:19 02/19/2022 
// Design Name: 
// Module Name:    left_cyclic_shift 
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
module right_cyclic_shift #(parameter N=1) 
	(num, out);
	
	input wire[31:0] num;
	output reg[31:0] out;
	
	integer i;
	
	always @* begin
		out = num;
		for(i=0; i<N; i=i+1) begin
			out[31:0] = {out[0], out[31:1]};
	 	end
	end
 
endmodule

`endif
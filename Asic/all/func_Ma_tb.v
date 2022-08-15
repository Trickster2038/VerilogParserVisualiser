`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:46:40 02/19/2022
// Design Name:   func_Ma
// Module Name:   C:/Users/Professional/Desktop/XilinxVerilogAsicSha256/Helloworld/HelloWorld/func_Ma_tb.v
// Project Name:  HelloWorld
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: func_Ma
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module func_Ma_tb;

	// Inputs
	reg [31:0] in_A;
	reg [31:0] in_B;
	reg [31:0] in_C;
	
	wire [31:0] func;

	// Instantiate the Unit Under Test (UUT)
	func_Ma uut (
		.in_A(in_A), 
		.in_B(in_B), 
		.in_C(in_C),
		.func(func)
	);

	initial begin
		// Initialize Inputs
		in_A = 32'h6a09e667;
		in_B = 32'hbb67ae85;
		in_C = 32'h3c6ef372;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:57:04 02/21/2022
// Design Name:   func_t1
// Module Name:   C:/Users/Professional/Desktop/XilinxVerilogAsicSha256/Helloworld/HelloWorld/func_t1_tb.v
// Project Name:  HelloWorld
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: func_t1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module func_t1_tb;

	// Inputs
	reg [31:0] in_E;
	reg [31:0] in_F;
	reg [31:0] in_G;
	reg [31:0] in_H;
	reg [31:0] in_Ki;
	reg [31:0] in_Wi;

	// Outputs
	wire [31:0] func;

	// Instantiate the Unit Under Test (UUT)
	func_t1 uut (
		.in_E(in_E), 
		.in_F(in_F), 
		.in_G(in_G), 
		.in_H(in_H), 
		.in_Ki(in_Ki), 
		.in_Wi(in_Wi), 
		.func(func)
	);

	initial begin
		// Initialize Inputs
		in_E = 32'h510e527f;
		in_F = 32'h9b05688c;
		in_G = 32'h1f83d9ab;
		in_H = 32'h5be0cd19;
		in_Ki = 32'h428a2f98;
		in_Wi = 32'h02000000;
		
		// RESULT = f577ed68

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


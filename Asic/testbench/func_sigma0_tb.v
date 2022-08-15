`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:46:27 02/19/2022
// Design Name:   func_sigma0
// Module Name:   C:/Users/Professional/Desktop/XilinxVerilogAsicSha256/Helloworld/HelloWorld/func_sigma0_tb.v
// Project Name:  HelloWorld
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: func_sigma0
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module func_sigma0_tb;

	// Inputs
	reg [31:0] in_A;

	// Outputs
	wire [31:0] func;

	// Instantiate the Unit Under Test (UUT)
	func_sigma0 uut (
		.in_A(in_A), 
		.func(func)
	);

	initial begin
		// Initialize Inputs
		in_A = 32'h6a09e667;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


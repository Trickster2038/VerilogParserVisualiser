`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:08:40 02/21/2022
// Design Name:   func_ch
// Module Name:   C:/Users/Professional/Desktop/XilinxVerilogAsicSha256/Helloworld/HelloWorld/func_ch_tb.v
// Project Name:  HelloWorld
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: func_ch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module func_sigma1_tb;

	// Inputs
	reg [31:0] in_E;

	// Outputs
	wire [31:0] func;

	// Instantiate the Unit Under Test (UUT)
	func_sigma1 uut (
		.in_E(in_E), 
		.func(func)
	);

	initial begin
		// Initialize Inputs
		in_E = 32'h510e527f;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


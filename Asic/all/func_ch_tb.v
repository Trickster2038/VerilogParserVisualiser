`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:38:54 02/21/2022
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

module func_ch_tb;

	// Inputs
	reg [31:0] in_E;
	reg [31:0] in_F;
	reg [31:0] in_G;

	// Outputs
	wire [31:0] func;

	// Instantiate the Unit Under Test (UUT)
	func_ch uut (
		.in_E(in_E), 
		.in_F(in_F), 
		.in_G(in_G), 
		.func(func)
	);

	initial begin
		// Initialize Inputs
		in_E = 32'h510e527f;
		in_F = 32'h9b05688c;
		in_G = 32'h1f83d9ab;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


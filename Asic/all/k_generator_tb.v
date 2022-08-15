`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:11:10 02/27/2022
// Design Name:   k_generator
// Module Name:   C:/Users/Professional/Desktop/XilinxVerilogAsicSha256/Helloworld/HelloWorld/k_generator_tb.v
// Project Name:  HelloWorld
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: k_generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module k_generator_tb;

	// Inputs
	reg [5:0] round_n;

	// Outputs
	wire [31:0] k_out;

	// Instantiate the Unit Under Test (UUT)
	k_generator uut (
		.round_n(round_n), 
		.k_out(k_out)
	);

	initial begin
		// Initialize Inputs
		round_n = 0;
		round_n = 32'h3;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


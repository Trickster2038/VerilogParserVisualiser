`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:19:26 02/19/2022
// Design Name:   left_cyclic_shift
// Module Name:   C:/Users/Professional/Desktop/XilinxVerilogAsicSha256/Helloworld/HelloWorld/left_cyclic_shift_tb.v
// Project Name:  HelloWorld
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: left_cyclic_shift
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module right_cyclic_shift_tb;

	// Inputs
	reg [31:0] num;

	// Outputs 
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	right_cyclic_shift uut (
		.num(num), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		num = 32'hF0000000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
     
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:24:31 02/21/2022
// Design Name:   logical_module
// Module Name:   C:/Users/Professional/Desktop/XilinxVerilogAsicSha256/Helloworld/HelloWorld/logic_module_tb.v
// Project Name:  HelloWorld
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: logical_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module logic_module_tb;

	// Inputs
	reg [31:0] in_A;
	reg [31:0] in_B;
	reg [31:0] in_C;
	reg [31:0] in_D;
	reg [31:0] in_E;
	reg [31:0] in_F;
	reg [31:0] in_G;
	reg [31:0] in_H;
	reg [31:0] in_Ki;
	reg [31:0] in_Wi;

	// Outputs
	wire [31:0] out_A;
	wire [31:0] out_B;
	wire [31:0] out_C;
	wire [31:0] out_D;
	wire [31:0] out_E;
	wire [31:0] out_F;
	wire [31:0] out_G;
	wire [31:0] out_H;

	// Instantiate the Unit Under Test (UUT)
	logic_module uut (
		.in_A(in_A), 
		.in_B(in_B), 
		.in_C(in_C), 
		.in_D(in_D), 
		.in_E(in_E), 
		.in_F(in_F), 
		.in_G(in_G), 
		.in_H(in_H), 
		.in_Ki(in_Ki), 
		.in_Wi(in_Wi), 
		.out_A(out_A), 
		.out_B(out_B), 
		.out_C(out_C), 
		.out_D(out_D), 
		.out_E(out_E), 
		.out_F(out_F), 
		.out_G(out_G), 
		.out_H(out_H)
	);

	initial begin
		// Initialize Inputs
		in_A = 32'h6a09e667;
		in_B = 32'hbb67ae85;
		in_C = 32'h3c6ef372;
		in_D = 32'ha54ff53a;
		
		in_E = 32'h510e527f;
		in_F = 32'h9b05688c;
		in_G = 32'h1f83d9ab;
		in_H = 32'h5be0cd19;
		
		in_Ki = 32'h428a2f98;
		in_Wi = 32'h02000000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:46:18 02/27/2022
// Design Name:   asic_core
// Module Name:   C:/Users/Professional/Desktop/XilinxVerilogAsicSha256/Helloworld/HelloWorld/asic_core_tb.v
// Project Name:  HelloWorld
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: asic_core
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module asic_core_tb;

	// Inputs
	reg [31:0] in_A;
	reg [31:0] in_B;
	reg [31:0] in_C;
	reg [31:0] in_D;
	reg [31:0] in_E;
	reg [31:0] in_F;
	reg [31:0] in_G;
	reg [31:0] in_H;
	reg [5:0] round_n;
	reg [31:0] in_Wi;
	reg mode;
	reg clk;

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
	asic_core uut (
		.in_A(in_A), 
		.in_B(in_B), 
		.in_C(in_C), 
		.in_D(in_D), 
		.in_E(in_E), 
		.in_F(in_F), 
		.in_G(in_G), 
		.in_H(in_H), 
		.round_n(round_n), 
		.in_Wi(in_Wi), 
		.mode(mode), 
		.clk(clk), 
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
		$dumpfile("test.vcd");
 		$dumpvars(0, asic_core_tb);
 		$monitor("Hello from TB");
		// Initialize Inputs
		in_A = 32'h6a09e667;
		in_B = 32'hbb67ae85;
		in_C = 32'h3c6ef372;
		in_D = 32'ha54ff53a;
		
		in_E = 32'h510e527f;
		in_F = 32'h9b05688c;
		in_G = 32'h1f83d9ab;
		in_H = 32'h5be0cd19;
		
		in_Wi = 32'h02000000;
		round_n = 0;

		mode = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		clk = 1;

		#100;
        
		// Add stimulus here
		$finish(3000000);

	end
       
endmodule
 

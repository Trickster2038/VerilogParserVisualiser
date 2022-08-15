`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:18:54 02/27/2022
// Design Name:   memory_switch
// Module Name:   C:/Users/Professional/Desktop/XilinxVerilogAsicSha256/Helloworld/HelloWorld/memory_switch_tb.v
// Project Name:  HelloWorld
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory_switch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
 
module memory_switch_tb;

	// Inputs
	reg addr;
	reg clk;
	reg [31:0] in_A_1;
	reg [31:0] in_B_1;
	reg [31:0] in_C_1;
	reg [31:0] in_D_1;
	reg [31:0] in_E_1;
	reg [31:0] in_F_1;
	reg [31:0] in_G_1;
	reg [31:0] in_H_1;
	reg [31:0] in_A_2; 
	reg [31:0] in_B_2;
	reg [31:0] in_C_2;
	reg [31:0] in_D_2;
	reg [31:0] in_E_2;
	reg [31:0] in_F_2;
	reg [31:0] in_G_2;
	reg [31:0] in_H_2;

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
	memory_switch uut (
		.clk(clk),
		.addr(addr), 
		.in_A_1(in_A_1), 
		.in_B_1(in_B_1), 
		.in_C_1(in_C_1), 
		.in_D_1(in_D_1), 
		.in_E_1(in_E_1), 
		.in_F_1(in_F_1), 
		.in_G_1(in_G_1), 
		.in_H_1(in_H_1), 
		.in_A_2(in_A_2), 
		.in_B_2(in_B_2), 
		.in_C_2(in_C_2), 
		.in_D_2(in_D_2), 
		.in_E_2(in_E_2), 
		.in_F_2(in_F_2), 
		.in_G_2(in_G_2), 
		.in_H_2(in_H_2), 
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
		addr = 0;
		in_A_1 = 32'h1;
		in_B_1 = 32'h2;
		in_C_1 = 0;
		in_D_1 = 0;
		in_E_1 = 0;
		in_F_1 = 0;
		in_G_1 = 0;
		in_H_1 = 0;
		in_A_2 = 32'hF;
		in_B_2 = 32'h7;
		in_C_2 = 0;
		in_D_2 = 0;
		in_E_2 = 0;
		in_F_2 = 0;
		in_G_2 = 0;
		in_H_2 = 0;
		clk = 0;
		#100;
		clk = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		addr = 1;
		clk = 0;
		#100;
		clk = 1;
		// Add stimulus here

	end
      
endmodule


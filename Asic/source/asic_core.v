`timescale 1ns / 1ps
`include "memory_switch.v"
`include "k_generator.v"
`include "logic_module.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:08 02/27/2022 
// Design Name: 
// Module Name:    asic_core 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module asic_core(in_A, in_B, in_C, in_D, 
in_E, in_F, in_G, in_H,

round_n, in_Wi, mode, clk,

out_A, out_B, out_C, out_D, 
out_E, out_F, out_G, out_H);


		input wire [31:0] in_A, in_B, in_C,
		in_D, in_E, in_F, in_G, in_H;
		
		input wire [5:0] round_n;
		input wire [31:0] in_Wi;
		input wire mode, clk;
		
		output wire [31:0] out_A, out_B, out_C, 
			out_D, out_E, out_F, out_G, out_H;
			
		wire [31:0] A_m_wire, B_m_wire, C_m_wire, 
			D_m_wire, E_m_wire, F_m_wire, G_m_wire, 
			H_m_wire;
			
		wire [31:0] A_o_wire, B_o_wire, C_o_wire, 
            D_o_wire, E_o_wire, F_o_wire, G_o_wire, 
            H_o_wire;
			
		wire [31:0] A_loop, B_loop, C_loop, D_loop, 
			E_loop, F_loop, G_loop, H_loop;
		
		wire [31:0] k_wire;
			
		k_generator k_gen(.round_n(round_n), 
			.k_out(k_wire));
			
		// assign out_A = k_wire;
			
		memory_switch mem(.addr(mode), .clk(clk),
		.in_A_1(A_loop), .in_B_1(B_loop), 
		.in_C_1(C_loop), .in_D_1(D_loop), 
		.in_E_1(E_loop), .in_F_1(F_loop),
		.in_G_1(G_loop), .in_H_1(H_loop),
		
		.in_A_2(in_A), .in_B_2(in_B), .in_C_2(in_C),
        .in_D_2(in_D), .in_E_2(in_E), .in_F_2(in_F),
        .in_G_2(in_G), .in_H_2(in_H),
		
		.out_A(A_m_wire), .out_B(B_m_wire),
		.out_C(C_m_wire), .out_D(D_m_wire),
		.out_E(E_m_wire), .out_F(F_m_wire),
		.out_G(G_m_wire), .out_H(H_m_wire));
		
		logic_module logic_chip(.in_A(A_m_wire), .in_B(B_m_wire),
		.in_C(C_m_wire), .in_D(D_m_wire),
		.in_E(E_m_wire), .in_F(F_m_wire),
		.in_G(G_m_wire), .in_H(H_m_wire),
		
		.in_Ki(k_wire), .in_Wi(in_Wi),
		
		.out_A(A_loop), .out_B(B_loop),
        .out_C(C_loop), .out_D(D_loop),
        .out_E(E_loop), .out_F(F_loop),
        .out_G(G_loop), .out_H(H_loop));
		
		assign out_A = A_loop;
		assign out_B = B_loop;
		assign out_C = C_loop;
		assign out_D = D_loop;
		
		assign out_E = E_loop;
		assign out_F = F_loop;
		assign out_G = G_loop;
		assign out_H = H_loop;

endmodule

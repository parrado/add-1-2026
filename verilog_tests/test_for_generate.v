`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 18:27:13
// Design Name: 
// Module Name: test_for_generate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_for_generate #(integer N=3000)(
    input clk,rst,clr,en,
    input serial_in,
    output [N-1:0] parallel_out
    );
    
    wire [N:0] aux;
    genvar i;
    
    assign aux[0]=serial_in; 
    generate
		for (i = 0; i < N; i = i + 1) begin
             fullreg #(.N(1)) regi
            (
            .d(aux[i]),
            .q(aux[i+1]),
            .clk(clk),
            .en(en),
            .rst(rst),
            .clr(clr)
            );
            end 
	endgenerate
	
	assign parallel_out=aux[N:1];
    
endmodule

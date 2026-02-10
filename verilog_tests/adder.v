`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2025 14:15:13
// Design Name: 
// Module Name: mult
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


module adder
   #(integer N=16)
   (
    input  [N-1:0] x1,
    input  [N-1:0] x2,
    output  [N-1:0] y
    );
    
    assign y=$unsigned(x1)+$unsigned(x2);
    
    
    
    
endmodule

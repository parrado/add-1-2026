`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 09:05:27
// Design Name: 
// Module Name: comparer
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


module comparer
   #(integer N=16)
   (
    input  [N-1:0] x1,
    input  [N-1:0] x2,
    output   y
    );
    
     assign y=(x1==x2)?1'b1:1'b0;
endmodule

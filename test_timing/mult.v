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


module mult
   #(integer N=9)
   (
    input  [N-1:0] x1,
    input  [N-1:0] x2,
    output  [2*N-1:0] y
    );
    
    assign y=$signed(x1)*$signed(x2);
    
    
endmodule

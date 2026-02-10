`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 16:32:37
// Design Name: 
// Module Name: test_if
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


module test_incomplete_if(
    input [7:0] a,
    input [7:0] b,
    
    output reg eq

    );
    
    always @(a,b) begin
    if(a==b)
      eq=1'b1;
    end
   
endmodule

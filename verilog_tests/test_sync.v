`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 17:37:00
// Design Name: 
// Module Name: test_sync
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


module test_sync(
    input clk,
    input a,b,c,
    output reg y
    );
    
    reg s;
    always @(posedge clk) begin
    s=a & b;
    y=s | c;    
    end
endmodule

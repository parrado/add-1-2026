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


module test_case(
    input a,
    input b,
    input [1:0] c,
    output reg y

    );
    
    always @(a,b,c) begin
        case (c)
        2'b00:  
            y = a & b;
        2'b01: 
            y= a | b;
        2'b10: 
            y= a ^ b;
        default: 
            y= ~a;	
        endcase
    end
endmodule

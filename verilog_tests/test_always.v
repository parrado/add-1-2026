`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 16:12:40
// Design Name: 
// Module Name: test_always
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


module test_always(
    input a,
    input b,
    input c,
    output  y
    );
    
    reg y_aux;
    
    always @( a , b , c )
    begin
         y_aux = c | b;
         y_aux = a & b;
        
       
    end 
    
    assign y=y_aux;
endmodule

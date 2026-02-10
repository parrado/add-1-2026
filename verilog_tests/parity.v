`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2025 11:07:30
// Design Name: 
// Module Name: parity
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


module parity
     #(N=44)
    (
    input [N-1:0] x,
    output y
    );
    
    
    reg p;
        
    always @ (*) begin: pgen
        integer i; 
        p=x[0];
        for (i = 1; i < N; i = i + 1) begin
            p=p ^ x[i];
        end 
    end    
    assign y=p;
    
endmodule

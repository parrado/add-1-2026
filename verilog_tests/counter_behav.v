`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 15:24:44
// Design Name: 
// Module Name: counter
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


module counter_behav(
    input clk,
    input en,
    input rst,
    output reg   [7:0]count,
    output reg   ovf 
    );
     
 



 
always @(posedge clk,posedge rst) begin 
    if(rst==1) 
        count=0;
    else
    if(en==1)
        count=count+1; 
end

always @(*)begin
    if(count==255)
        ovf=1;
    else
        ovf=0;
end
 
 
endmodule

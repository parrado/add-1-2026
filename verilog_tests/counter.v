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


module counter(
    input clk,
    input en,
    input rst,
    output   [7:0]count,
    output          ovf 
    );
     
 
 wire [7:0] adder_out;
 reg [7:0] reg_out;


// Register implementation 
always @(posedge clk,posedge rst) begin
 
 if(rst==1) 
reg_out<=0;
else

if(en==1)
reg_out<=adder_out;
 
end;

assign adder_out = reg_out + 8'd1; 

assign count=reg_out;

assign ovf=(reg_out==8'd255)?1'b1:1'b0;
 
 
endmodule

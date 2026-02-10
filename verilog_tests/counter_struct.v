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


module counter_struct(
    input clk,
    input en,    
    input rst,
    output [7:0]count,
    output ovf 
    );
    
    wire [7:0]adder_out,reg_out;
    
    
    fullreg #(.N(8)) reg0
    (
    .d(adder_out),
    .q(reg_out),
    .clk(clk),
    .en(en),
    .rst(rst),
    .clr(1'b0)
    );
    
    adder #(.N(8)) adder0
    (
    .x1(reg_out),
    .x2(8'd1),
    .y(adder_out)    
    );
    
    assign ovf=(reg_out==8'd255)?1'b1:1'b0;
    
//     comparer #(.N(8)) comparer0
//    (
//    .x1(reg_out),
//    .x2(8'd255),
//    .y(ovf)    
//    );
    
    assign count=reg_out;

endmodule

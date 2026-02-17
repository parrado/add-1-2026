`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 15:21:34
// Design Name: 
// Module Name: mac
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


module mac(
    input [15:0] x1,
    input [15:0] x2,
    input clk,
    input rst,
    input en,
    output [39:0] y
    );
    
     wire [39:0]adder_out,reg_out,adder_x2;
     wire [31:0] mult_out;
     
      mult #(.N(16)) mult0
    (
    .x1(x1),
    .x2(x2),    
    .y(mult_out)
    );
    
    assign adder_x2={{8{mult_out[31]}},mult_out};
     adder #(.N(40)) adder0
    (
    .x1(reg_out),
    .x2(adder_x2),
    .y(adder_out)    
    );
    
    
     fullreg #(.N(40)) reg0
    (
    .d(adder_out),
    .q(reg_out),
    .clk(clk),
    .en(en),
    .rst(rst),
    .clr(1'b0)
    );
    
    assign y=reg_out;

endmodule

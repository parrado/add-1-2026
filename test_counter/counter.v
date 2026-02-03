`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2026 09:09:17
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
    output [7:0] count,
    output ovf
    );
    
    wire [7:0] adder_out;
    
    reg [7:0] reg_out;
    
       // Always block for register
       always @(posedge clk,posedge rst) begin
       if(rst==1)
            reg_out<=0;
       else    
        if(en)
            reg_out<=adder_out;
   end
    
    assign count=reg_out;
    
    // Comparer for ovf signal
    assign ovf=reg_out[7] & reg_out[6] & reg_out[5] & reg_out[4]& reg_out[3]& reg_out[2] & reg_out[1] & reg_out[0]; 
     //assign ovf=(reg_out==8'd255)?1'b1:1'b0;
    
    // Adder to increment the count
    //assign adder_out = reg_out+8'd1;
    assign adder_out = reg_out+8'b00000001;
    
 
    
    
endmodule

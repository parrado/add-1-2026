`timescale 1ns / 1ps


// Module for counter testbench
module tb_divider;

// Counter signals
reg clk,en,rst;
reg [15:0]x2;
wire[15:0] y ;
reg [31:0]x1;


// clk_period in timescale units
parameter clk_period=10;
// FPGA reset time for timing simulation
parameter rst_time=100;

// Unit under test
//counter uut
//counter_struct uut
divider uut
(
.x1(x1),
.x2(x2),
.y(y)

);

// Procedural block to generate input signals
initial begin
 x1=0;
 x2=0;
 en=0;
 #rst_time
 en=1;
 x1=126567892;
 x2=15789;
 #clk_period
  x1=256748369;
 x2=13891;
 #clk_period
 en=0;
end

// Procedural block to generate clock signal
initial begin
    clk = 1;
    forever begin        
        #(clk_period/2) clk = ~clk;
    end
end

// Procedural block to generate reset signal
initial begin
    rst = 1;
    #rst_time rst=0;
end


// Procedural block to generate enable signal
initial begin
    en = 0;
    #rst_time en=1;
end


endmodule

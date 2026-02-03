`timescale 1ns / 1ps


// Module for counter testbench
module tb_counter;

// Counter signals
reg clk,en,rst;
wire [7:0]count ;
wire ovf;

// clk_period in timescale units
parameter clk_period=10;
// FPGA reset time for timing simulation
parameter rst_time=100;

// Unit under test
counter uut(
.clk(clk),
.en(en),
.rst(rst),
.count(count),
.ovf(ovf)
);

// Procedural block to generate input signals
initial begin
  
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

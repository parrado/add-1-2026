`timescale 1ns / 1ps



module tb_mult;
localparam N=32;
// Counter signals
reg [N-1:0] x1,x2;
wire [2*N-1:0] y;

// clk_period in timescale units
localparam clk_period=10;


// Unit under test
mult #(.N(N)) uut
(
.x1(x1),
.x2(x2),
.y(y)
);

// Procedural block to generate input signals
initial begin
x1=-157224564;
x2=1156457878;
  
end




endmodule

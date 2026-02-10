`timescale 1ns / 1ps



module tb_comb_loop;

// Counter signals
reg en,d;
wire q;




// Unit under test
comb_loop uut
(
.d(d),
.en(en),
.q(q)
);

// Procedural block to generate input signals
initial begin
d=1;
en=0;
  
end




endmodule

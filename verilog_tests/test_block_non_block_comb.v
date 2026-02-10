`timescale 1ns / 1ps

module test_block_non_block_comb(
    
    input d1,d2,d3,
    output reg res1,res2
    );
    
    reg s1,s2;
    always @(*) begin
     s1=d1 & d2;
     res1=s1 ^d3;
    end  
 
    always @(*) begin
     s2<=d1 & d2;
     res2<=s2 ^~d3;
    end
    
    
endmodule

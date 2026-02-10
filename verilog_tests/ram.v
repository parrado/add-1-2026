module ram(
    output reg [15:0] data_out,
    input [15:0] address,
    input [15:0] data_in, 
    input write_enable,
    input clk
);
     (* ram_style = "block" *) reg [15:0] memory [0:65535];
  

    always @(posedge clk) begin
        if (write_enable) begin
            memory[address] = data_in;
        end
         data_out = memory[address];      
    end
    
   

endmodule
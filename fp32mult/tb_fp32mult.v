`timescale 1ns/1ps

module tb_fp32mult;

    reg  [31:0] x1;
    reg  [31:0] x2;
    reg         en;
    reg         rst;
    reg         clk;

    wire [31:0] y;
    wire        ready;

    // Instantiate DUT
    fp32mult dut (
        .x1(x1),
        .x2(x2),
        .en(en),
        .rst(rst),
        .clk(clk),
        .y(y),
        .ready(ready)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        en  = 0;
        x1  = 0;
        x2  = 0;

        #100;
        rst = 0;

        //--------------------------------------------------
        // Test 1: 1.5 * 2.0 = 3.0
        //--------------------------------------------------
        @(posedge clk);
        x1 = 32'h3FC00000; // 1.5
        x2 = 32'h40000000; // 2.0
        en = 1;

        @(posedge clk);
        en = 0;

        wait(ready);
        $display("1.5 * 2.0 = %h", y);

        //--------------------------------------------------
        // Test 2: 3.0 * 4.0 = 12.0
        //--------------------------------------------------
        @(posedge clk);
        x1 = 32'h40400000; // 3.0
        x2 = 32'h40800000; // 4.0
        en = 1;

        @(posedge clk);
        en = 0;

        wait(ready);
        $display("3.0 * 4.0 = %h", y);

        //--------------------------------------------------
        // Test 3: -2.5 * 1.5 = -3.75
        //--------------------------------------------------
        @(posedge clk);
        x1 = 32'hC0200000; // -2.5
        x2 = 32'h3FC00000; // 1.5
        en = 1;

        @(posedge clk);
        en = 0;

        wait(ready);
        $display("-2.5 * 1.5 = %h", y);

        //--------------------------------------------------
        // Test 4: 5.5 * -2.0 = -11.0
        //--------------------------------------------------
        @(posedge clk);
        x1 = 32'h40B00000; // 5.5
        x2 = 32'hC0000000; // -2.0
        en = 1;

        @(posedge clk);
        en = 0;

        wait(ready);
        $display("5.5 * -2.0 = %h", y);
        
        @(posedge clk);
        x1 = 32'h40490fdb; // pi
        x2 = 32'h402df854; // e
        en = 1;

        @(posedge clk);
        en = 0;

        wait(ready);
        $display("%f * %f = %h",x1,x2, y);

        //--------------------------------------------------
        #50;
        $finish;
    end

endmodule
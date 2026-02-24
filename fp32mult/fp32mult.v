module fp32mult (
    input  wire [31:0] x1,
    input  wire [31:0] x2,
    input  wire        en,
    input  wire        rst,
    input  wire        clk,
    output wire [31:0] y,
    output wire        ready
);

    //====================================================
    // Input Registers
    //====================================================

    wire [31:0] x1_reg;
    wire [31:0] x2_reg;

    fullreg #(32) reg_x1 (.clk(clk), .rst(rst), .en(en), .d(x1), .q(x1_reg));
    fullreg #(32) reg_x2 (.clk(clk), .rst(rst), .en(en), .d(x2), .q(x2_reg));

    //====================================================
    // Field Extraction
    //====================================================

    wire sign1 = x1_reg[31];
    wire sign2 = x2_reg[31];

    wire [7:0] exp1 = x1_reg[30:23];
    wire [7:0] exp2 = x2_reg[30:23];

    wire [23:0] mant1 = {1'b1, x1_reg[22:0]}; // hidden bit
    wire [23:0] mant2 = {1'b1, x2_reg[22:0]};

    //====================================================
    // Sign Calculation
    //====================================================

    wire sign_result = sign1 ^ sign2;

    //====================================================
    // Exponent Addition (with bias removal)
    //====================================================

    wire [7:0] exp_sum;
    
      wire en_d1;
    wire en_d2;

    exp_adder_bias exp_add_inst (
        .exp1(exp1),
        .exp2(exp2),
        .exp_out(exp_sum)
    );

    //====================================================
    // Mantissa Multiplication
    //====================================================

    wire [47:0] mant_product;

    mult24 mult_inst (
        .a(mant1),
        .b(mant2),
        .p(mant_product)
    );

    //====================================================
    // Exponent Normalization
    //====================================================

    wire [7:0] exp_norm;

    exp_normalizer exp_norm_inst (
        .msb_mult(mant_product[47]),
        .exp_in(exp_sum),
        .exp_out(exp_norm)
    );

    //====================================================
    // Mantissa Normalization
    //====================================================

    wire [23:0] mant_norm;

    mantissa_normalizer mant_norm_inst (
        .mult_out(mant_product),
        .mant_out(mant_norm)
    );

    //====================================================
    // Output Assembly
    //====================================================

    wire [31:0] result_comb;

    assign result_comb = {sign_result, exp_norm, mant_norm[22:0]};

    //====================================================
    // Output Register
    //====================================================

    fullreg #(32) reg_out (
        .clk(clk),
        .rst(rst),
        .en(en_d1),
        .d(result_comb),
        .q(y)
    );

    //====================================================
    // Enable Pipeline for Ready Signal (2-stage)
    //====================================================

  

    fullreg #(1) reg_en_stage1 (
        .clk(clk),
        .rst(rst),
        .en(1'b1),
        .d(en),
        .q(en_d1)
    );

    fullreg #(1) reg_en_stage2 (
        .clk(clk),
        .rst(rst),
        .en(1'b1),
        .d(en_d1),
        .q(en_d2)
    );

    assign ready = en_d2;

endmodule
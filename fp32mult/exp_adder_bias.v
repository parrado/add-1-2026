module exp_adder_bias (
    input  wire [7:0] exp1,   // First biased exponent
    input  wire [7:0] exp2,   // Second biased exponent
    output wire [7:0] exp_out // Resulting biased exponent
);

    // Internal signals
    wire [8:0] sum;           // 9-bit to capture overflow
    wire [8:0] sum_minus_bias;

    // Add exponents
    assign sum = exp1 + exp2;

    // Subtract IEEE-754 single precision bias (127)
    assign sum_minus_bias = sum - 9'd127;

    // Output lower 8 bits (overflow handled externally if needed)
    assign exp_out = sum_minus_bias[7:0];

endmodule
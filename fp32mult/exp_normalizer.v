module exp_normalizer (
    input  wire        msb_mult,   // Bit 47 of mantissa product
    input  wire [7:0]  exp_in,     // Exponent before normalization
    output wire [7:0]  exp_out     // Normalized exponent
);

    // If MSB of product is 1, increment exponent
    assign exp_out = msb_mult ? (exp_in + 8'd1) : exp_in;

endmodule
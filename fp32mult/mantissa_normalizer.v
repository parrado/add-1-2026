module mantissa_normalizer (
    input  wire [47:0] mult_out,   // 48-bit mantissa product
    output wire [23:0] mant_out    // 24-bit normalized mantissa
);

    // If MSB (bit 47) is 1, shift right by 1
    // Otherwise, take the upper 24 bits directly
    assign mant_out = mult_out[47] ? 
                      mult_out[47:24] : 
                      mult_out[46:23];

endmodule
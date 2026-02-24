module mult24 (
    input  wire [23:0] a,   // First 24-bit operand
    input  wire [23:0] b,   // Second 24-bit operand
    output wire [47:0] p    // 48-bit product
);

    // Combinational multiplication
    assign p = $unsigned(a) * $unsigned(b);

endmodule
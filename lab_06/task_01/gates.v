module or_gate(input A, B, output or_C, and_C, xor_C, C_not);

    assign C_and = A & B;
    assign C_or = A | B;
    assign C_xor = A ^ B;
    assign C_not = ~A;

endmodule
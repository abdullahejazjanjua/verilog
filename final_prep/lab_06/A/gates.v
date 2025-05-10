module gates(input A, B, output o_and, o_or, o_xor, o_not);

    assign o_and = A & B;
    assign o_or = A | B;
    assign o_xor = A ^ B;
    assign o_not = ~A;

endmodule
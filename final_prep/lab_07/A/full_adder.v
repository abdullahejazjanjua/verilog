module full_adder(input A, B, Cin, output sum, cout);

    wire and_out, xor_out, and_xor_out;
    
    xor(xor_out, A, B);
    xor(sum, xor_out, Cin);

    and(and_out, A, B);
    and(and_xor_out, xor_out, Cin);
    or(cout, and_out, and_xor_out);

endmodule

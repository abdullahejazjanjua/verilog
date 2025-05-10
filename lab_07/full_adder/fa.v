module full_a(input A, B, Cin, output S, Cout);
    
    wire xor_out;
    wire and_out_1;
    wire and_out_2;
    
    xor (xor_out, A, B);
    xor (S, xor_out, Cin);
    and (and_out_1, Cin, xor_out);
    and (and_out_2, A, B);
    or (Cout, and_out_2, and_out_1);

endmodule
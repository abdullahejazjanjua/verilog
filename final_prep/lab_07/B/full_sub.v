module full_sub(input A, B, Bin, output sub, Bout);
    
    wire xor_out, and_out, not_A, not_xor_out, or_not_xor_out;
    
    xor(xor_out, A, B);
    xor(sub, xor_out, Bin);

    not(not_A, A);
    and(and_out, not_A, B);
    not(not_xor_out, xor_out);
    and(or_not_xor_out, not_xor_out, Bin);
    or(Bout, and_out, or_not_xor_out);

    

endmodule

/*
    sub = A ^ B ^ Bin
    borrowout = (~A & B) | (~(A ^ B) & Bin)
*/
module full_adder(input A, B, Cin, output sum, cout);

    wire and_out, xor_out, and_xor_out;
    
    xor(xor_out, A, B);
    xor(sum, xor_out, Cin);

    and(and_out, A, B);
    and(and_xor_out, xor_out, Cin);
    or(cout, and_out, and_xor_out);

endmodule

module four_bit_fa(input [3:0] A, B, input Cin, output [3:0] sum, output Cout);

    wire cout_1, cout_2, cout_3;
    full_adder fa1(A[0], B[0], Cin, sum[0], cout_1);
    full_adder fa2(A[1], B[1], cout_1, sum[1], cout_2);
    full_adder fa3(A[2], B[2], cout_2, sum[2], cout_3);
    full_adder fa4(A[3], B[3], cout_3, sum[3], Cout);

endmodule
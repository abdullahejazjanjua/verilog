module full_adder(input A, B, Cin, output sum, cout);

    assign sum = (A ^ B ^ Cin);
    assign cout = (A & B) | ((A ^ B) & Cin);

endmodule
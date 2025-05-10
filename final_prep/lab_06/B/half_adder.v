module half_adder(input A, B, output cout, sum);

    assign sum = A ^ B;
    assign cout = A & B;

endmodule
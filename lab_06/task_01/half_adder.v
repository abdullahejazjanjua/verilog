module half_adder(input A, B, output C, carry);

    assign C = A ^ B;
    assign carry = A & B;


endmodule
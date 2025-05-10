module half_adder (input A, B, output cout, sum);

    assign {cout, sum} = A + B;

endmodule

module half_adder_dataflow (input A, B, output reg cout, sum);

    always @(*) begin
        sum = A ^ B;
        cout = A & B;
    end

endmodule
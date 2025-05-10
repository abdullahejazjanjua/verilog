`timescale 1ns/1ns
`include "four_bit_fa.v"

module tb;
    reg [3:0] A, B;
    reg Cin;

    wire [3:0] sum;
    wire Cout;

    four_bit_fa uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .sum(sum),
        .Cout(Cout)
    );

    initial begin

        $dumpfile("four_bit_fa.vcd");
        $dumpvars(0, tb);

        A = 0; B = 0; Cin = 0;
        #10; A = 4'd1; B = 4'd1; Cin = 0;
        #10; A = 4'd2; B = 4'd1; Cin = 0;
        #10; A = 4'd2; B = 4'd0; Cin = 1;
        #10; $finish;
            


    end

endmodule
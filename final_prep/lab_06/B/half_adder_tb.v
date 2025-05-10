`timescale 1ns/1ns
`include "half_adder.v"

module tb;
    reg A, B;
    wire sum, cout;
    half_adder uut (
        .A(A),
        .B(B),
        .cout(cout),
        .sum(sum)
    );

    initial begin

        $dumpfile("half_adder.vcd");
        $dumpvars(0, tb);

        A = 0; B = 0;
        #10; A = 0; B = 1;
        #10; A = 1; B = 0;
        #10; A = 1; B = 1;
        #10; $finish;
            


    end

endmodule
`timescale 1ns/1ns
`include "full_sub.v"

module tb;
    reg A, B, Bin;

    wire sub, Bout;

    full_sub uut (
        .A(A),
        .B(B),
        .Bin(Bin),
        .sub(sub),
        .Bout(Bout)
    );

    initial begin

        $dumpfile("full_sub.vcd");
        $dumpvars(0, tb);

         A = 0; B = 0; Bin = 0;
        #10; A = 0; B = 0; Bin = 1;
        #10; A = 0; B = 1; Bin = 0;
        #10; A = 0; B = 1; Bin = 1;
        #10; A = 1; B = 0; Bin = 0;
        #10; A = 1; B = 0; Bin = 1;
        #10; A = 1; B = 1; Bin = 0;
        #10; A = 1; B = 1; Bin = 1;
        #10; $finish;
            


    end

endmodule
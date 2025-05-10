`timescale 1ns/1ns
`include "gates.v"

module tb;
    reg A, B;
    wire o_and, o_not, o_or, o_xor;

    gates uut (
        .A(A),
        .B(B),
        .o_and(o_and),
        .o_or(o_or),
        .o_xor(o_xor),
        .o_not(o_not)
    );

    initial begin
        
        $dumpfile("gates.vcd");
        $dumpvars(0, tb);

        A = 0; B = 0;
        #10; A = 0; B = 1;
        #10; A = 1; B = 0;
        #10; A = 1; B = 1;
        #10; $finish;

    end

endmodule
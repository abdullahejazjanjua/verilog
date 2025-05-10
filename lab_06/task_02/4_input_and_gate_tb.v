`timescale 1ns / 1ns
`include "4_input_and_gate.v"
module tb;
    reg A, B, C, D;
    wire E;
    four_input_and_gate uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E)
    );
    initial begin
        $dumpfile("four_input_and_gates.vcd");
        $dumpvars(0, tb);
        A = 0; B = 0; C = 0; D = 0;
        #10; A = 1; B = 0; C = 0; D = 0;
        #10; A = 0; B = 0; C = 1; D = 0;
        #10; A = 1; B = 1; C = 1; D = 1;
        #10; $finish;
    end
endmodule
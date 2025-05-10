`timescale 1ns/1ns
`include "Mux8x1.v"

module tb;

    reg A, B, C, D, E, F, G, H;
    reg S0, S1, S2;
    wire out;

    Mux8x1 uut (
        .A(A), 
        .B(B), 
        .C(C), 
        .D(D),
        .E(E), 
        .F(F), 
        .G(G), 
        .H(H),
        .S0(S0), 
        .S1(S1), 
        .S2(S2),
        .out(out)
    );

    initial begin

        $dumpfile("Mux8x1.vcd");
        $dumpvars(0, tb);

        A = 1; B = 0; C = 1; D = 0;
        E = 1; F = 0; G = 1; H = 0;

        S2 = 0; S1 = 0; S0 = 0; #10;
        S2 = 0; S1 = 0; S0 = 1; #10;
        S2 = 0; S1 = 1; S0 = 0; #10;
        S2 = 0; S1 = 1; S0 = 1; #10;
        S2 = 1; S1 = 0; S0 = 0; #10;
        S2 = 1; S1 = 0; S0 = 1; #10;
        S2 = 1; S1 = 1; S0 = 0; #10;
        S2 = 1; S1 = 1; S0 = 1; #10;

        $finish;
    end

endmodule

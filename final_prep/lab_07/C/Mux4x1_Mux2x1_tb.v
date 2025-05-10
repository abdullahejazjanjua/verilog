`timescale 1ns / 1ns
`include "Mux4x1_Mux2x1.v"

module tb;
    reg A, B, C, D, S0, S1;

    wire out;

    Mux4x1_Mux2x1 uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .S0(S0),
        .S1(S1),
        .out(out)
    );

    initial begin

        $dumpfile("Mux4x1_Mux2x1.vcd");
        $dumpvars(0, tb);

         
        A = 0; B = 0; C = 0; D = 0; S0 = 0; S1 = 0;
        #10; A = 0; B = 0; C = 0; D = 0; S0 = 0; S1 = 0;
        #10; A = 0; B = 1; C = 0; D = 0; S0 = 1; S1 = 0;
        #10; A = 0; B = 0; C = 1; D = 0; S0 = 0; S1 = 1;
        #10; A = 1; B = 0; C = 1; D = 0; S0 = 0; S1 = 0;
        #10; A = 0; B = 0; C = 0; D = 0; S0 = 1; S1 = 1;

        #10; $finish;
            


    end

endmodule
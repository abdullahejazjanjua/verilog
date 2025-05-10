`timescale 1ns / 1ns
`include "4_mux.v"

module tb;

    reg S0, S1, A, B, C, D;
    wire ans;

    Mux4to1 uut (
        .S0(S0),
        .S1(S1),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .ans(ans)
    );


    initial begin

        $dumpfile("4_mux.vcd");
        $dumpvars(0, tb);
        #10; S0 = 0; S1 = 1; A = 1; B = 0; C = 1; D = 0;
        #10; S0 = 1; S1 = 1; A = 0; B = 1; C = 1; D = 0;
        #10; S0 = 1; S1 = 0; A = 1; B = 1; C = 0; D = 0;
        #10; $finish;
        
    end

endmodule
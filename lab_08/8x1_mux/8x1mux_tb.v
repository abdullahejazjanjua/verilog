`timescale 1ns / 1ns
`include "8x1mux.v"

module tb;

    reg A7, A6, A5, A4, A3, A2, A1, A0, S0, S1, S2;
    wire C;

    Mux8To2 uut (
        .A7(A7),
        .A6(A6),
        .A5(A5),
        .A4(A4),
        .A3(A3),
        .A2(A2),
        .A1(A1),
        .A0(A0),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .C(C)
    );


    initial begin

        $dumpfile("8x1mux.vcd");
        $dumpvars(0, tb);
        #10; A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0; A5 = 0; A6 = 0; A7 = 0; S0 = 0; S1 = 0; S2 = 0; 
        #10; A0 = 1; A1 = 1; A2 = 0; A3 = 1; A4 = 0; A5 = 1; A6 = 0; A7 = 0; S0 = 0; S1 = 0; S2 = 1; 
        #10; A0 = 1; A1 = 0; A2 = 0; A3 = 1; A4 = 0; A5 = 0; A6 = 0; A7 = 0; S0 = 1; S1 = 1; S2 = 0; 
        #10; $finish;
        
    end

endmodule
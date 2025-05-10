`timescale 1ns/1ns
`include "DeMux1x4.v"

module tb;
    reg A, S0, S1;
    wire O1, O2, O3, O4;

    DeMux1x4_behavioural uut (
        .A(A),
        .S0(S0),
        .S1(S1),
        .O1(O1),
        .O2(O2),
        .O3(O3),
        .O4(O4)
    );

    initial begin
        
        $dumpfile("DeMux1x4.vcd");
        $dumpvars(0, tb);

        A = 0; S0 = 0; S1 = 0;
        #10; A = 1; S0 = 1; S1 = 0;
        #10; A = 1; S0 = 1; S1 = 0;
        #10; A = 1; S0 = 0; S1 = 1;
        #10; A = 1; S0 = 1; S1 = 1;
        
    end
endmodule
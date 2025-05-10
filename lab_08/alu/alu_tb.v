`timescale 1ns / 1ns
`include "alu.v"

module tb;

    reg [3:0] ALUs;
    reg A, B;
    wire C, S, Zero;

    alu uut (
        .ALUs(ALUs),
        .A(A),
        .B(B),
        .C(C),
        .S(S),
        .Zero(Zero)
    );


    initial begin

        $dumpfile("alu.vcd");
        $dumpvars(0, tb);
        
        #10; A = 1; B = 0; ALUs = 0;
        #10; A = 1; B = 0; ALUs = 1;
        #10; A = 1; B = 0; ALUs = 2;
        #10; A = 1; B = 0; ALUs = 6;
        #10; A = 1; B = 0; ALUs = 7;
        #10; A = 1; B = 0; ALUs = 12;
        #10; $finish;
        
    end

endmodule
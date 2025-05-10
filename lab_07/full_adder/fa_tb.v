`timescale 1ns / 1ns
`include "fa.v"

module tb;

    reg A, B, Cin;
    wire Cout, S;

    full_a uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );


    initial begin

        $dumpfile("full_a.vcd");
        $dumpvars(0, tb);
        #10; A = 0; B = 0; Cin = 0; 
        #10; A = 0; B = 0; Cin = 1; 
        #10; A = 0; B = 1; Cin = 0; 
        #10; A = 0; B = 1; Cin = 1; 
        #10; A = 1; B = 0; Cin = 0; 
        #10; A = 1; B = 0; Cin = 1; 
        #10; A = 1; B = 1; Cin = 0; 
        #10; A = 1; B = 1; Cin = 1; 
        #10; $finish;
        
    end

endmodule
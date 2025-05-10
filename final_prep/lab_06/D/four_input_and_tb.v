`timescale 1ns/1ns
`include "four_input_and.v"

module tb;
    reg A, B, C, D;
    wire out_and;
    four_input_and uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .out_and(out_and)
    );

    initial begin

        $dumpfile("four_input_and.vcd");
        $dumpvars(0, tb);

        A = 0; B = 0; C = 0; D = 0;
        #10; A = 0; B = 0; C = 0; D = 1;
        #10; A = 0; B = 0; C = 1; D = 0;
        #10; A = 0; B = 0; C = 1; D = 1;
        #10; A = 0; B = 1; C = 0; D = 0;
        #10; A = 0; B = 1; C = 0; D = 1;
        #10; A = 0; B = 1; C = 1; D = 0;
        #10; A = 0; B = 1; C = 1; D = 1;
        #10; A = 1; B = 0; C = 0; D = 1;
        #10; A = 1; B = 0; C = 0; D = 1;
        #10; A = 1; B = 0; C = 1; D = 0;
        #10; A = 1; B = 0; C = 1; D = 1;
        #10; A = 1; B = 1; C = 0; D = 0;
        #10; A = 1; B = 1; C = 0; D = 1;
        #10; A = 1; B = 1; C = 1; D = 0;
        #10; A = 1; B = 1; C = 1; D = 1;
    
        #10; $finish;
            


    end

endmodule
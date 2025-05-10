`timescale 1ns / 1ns
`include "sr_ff.v"

module tb;

    reg S, R, CLK;
    wire Q, Q_bar;

    SR uut (
        .S(S),
        .R(R),
        .CLK(CLK),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    always #5 CLK = ~CLK;


    initial begin
        $dumpfile("sr_ff.vcd");
        $dumpvars(0, tb);
        CLK = 0;
        S = 0; R = 0;
        #10; S = 0; R = 1;
        #10; S = 1; R = 0;
        #10; S = 1; R = 1;
        #10; $finish;

    end


endmodule
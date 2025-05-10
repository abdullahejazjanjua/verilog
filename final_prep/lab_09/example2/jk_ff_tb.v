`timescale 1ns / 1ns
`include "jk_ff.v"

module tb;

    reg J, K, CLK;
    wire Q, Q_bar;

    jk_ff uut (
        .J(J),
        .K(K),
        .CLK(CLK),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    always #5 CLK = ~CLK;


    initial begin
        $dumpfile("jk_ff.vcd");
        $dumpvars(0, tb);

        CLK = 0;
        J = 0; K = 0;

        #10; J = 0; K = 1;
        #10; J = 1; K = 0;
        #10; J = 1; K = 1;

        #10; $finish;

    end


endmodule
`timescale 1ns / 1ns
`include "d_ff.v"

module tb;

    reg D, CLK;
    wire Q, Q_bar;

    d_ff uut (
        .D(D),
        .CLK(CLK),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    always #5 CLK = ~CLK;


    initial begin
        $dumpfile("d_ff.vcd");
        $dumpvars(0, tb);

        CLK = 0;
        D = 0;

        #10; D = 0;
        #10; D = 1;

        #10; $finish;

    end


endmodule
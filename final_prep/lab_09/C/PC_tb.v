`timescale 1ns / 1ns
`include "PC.v"

module tb;
    reg CLK, reset;
    wire [31:0] A;

    PC uut(
        .CLK(CLK),
        .reset(reset),
        .A(A)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpfile("PC.vcd");
        $dumpvars(0, tb);
        CLK = 0;
        reset = 1;

        #10; reset = 0;
        #100;
        #10; $finish; 
    end

endmodule
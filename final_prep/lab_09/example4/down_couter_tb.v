`timescale 1ns / 1ns
`include "down_couter.v"

module tb;
    reg CLK, reset;
    wire [3:0] O;

    down_counter uut(
        .CLK(CLK),
        .reset(reset),
        .O(O)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpfile("down_counter.vcd");
        $dumpvars(0, tb);
        CLK = 0;
        reset = 1;
        #10; reset = 0;
        #100; $finish; 
    end

endmodule
`timescale 1ns / 1ns
`include "up_down_counter.v"

module tb;
    reg CLK, reset, up;
    wire [3:0] O;

    up_down_counter uut(
        .CLK(CLK),
        .reset(reset),
        .up(up),
        .O(O)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpfile("up_down_counter.vcd");
        $dumpvars(0, tb);
        CLK = 0;
        reset = 1;
        up = 1;

        #10; reset = 0; up = 1;
        #10; 
        #10;
        #10; up = 0;
        #10; $finish; 
    end

endmodule
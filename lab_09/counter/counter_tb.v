`timescale 1ns / 1ns
`include "counter.v"

module tb;
    reg up, clk, reset;
    wire [31:0] B;

    count uut (
        .clk(clk),
        .up(up),
        .reset(reset),
        .B(B)
    );

    always #5 clk = ~clk;
    initial begin

        $dumpfile("counter.vcd");
        $dumpvars(0, tb);

        reset = 1;
        clk = 0;
        up = 1;
        
        #10; reset = 0; 
        #10; 
        #10; 
        #10; up = 0;
        #10; $finish;

    end

endmodule
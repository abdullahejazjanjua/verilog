`timescale 1ns / 1ns
`include "UpCounter4Bit.v"

module tb;
    reg CLK, reset, enable;
    wire [3:0] out;

    UpCounter4Bit uut(
        .CLK(CLK),
        .reset(reset),
        .enable(enable),
        .out(out)
    );

    always #5 CLK = ~CLK;

    initial begin
        
        $dumpfile("UpCounter4Bit.vcd");
        $dumpvars(0, tb);
        CLK = 0;
        reset = 1;
        enable = 0;

        #10; reset = 0; enable = 1;
        #100; enable = 0;
        #10; $finish; 
    end

endmodule
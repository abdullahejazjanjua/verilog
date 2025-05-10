`timescale 1ns/1ns
`include "reg_file.v"

module tb;

    reg [31:0] in;
    reg CLK, reset;
    wire [31:0] out;

    reg_file uut (
        .in(in),
        .CLK(CLK),
        .reset(reset),
        .out(out)
    );

    always #5 CLK = ~CLK;

    initial begin

        $dumpfile("reg.vcd");
        $dumpvars(0, tb);
        
        reset = 1;
        CLK = 0;
        #10; reset = 0; in = 0;
        #10; in = 1;
        #10; in = 32'd4;
        #10; $finish;
    end

endmodule
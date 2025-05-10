`timescale 1ns/1ns
`include "reg.v"

module tb;

    reg [31:0] datain;
    reg CLK, reset;
    wire [31:0] dataout;

    register uut (
        .datain(datain),
        .CLK(CLK),
        .reset(reset),
        .dataout(dataout)
    );

    always #5 CLK = ~CLK;

    initial begin

        $dumpfile("reg.vcd");
        $dumpvars(0, tb);
        
        reset = 1;
        CLK = 0;
        #10; reset = 0; datain = 0;
        #10; datain = 1;
        #10; datain = 32'd4;
        #10; $finish;
    end

endmodule
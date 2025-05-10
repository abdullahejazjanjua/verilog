`timescale 1ns / 1ns
`include "reg.v"

module tb;
    
    reg Datain, clk, reset;
    wire Dataout;

    register uut (
        .Datain(Datain),
        .clk(clk),
        .reset(reset),
        .Dataout(Dataout)
    );

    always #10 clk = ~clk;
    initial begin

        $dumpfile("reg.vcd");
        $dumpvars(0, tb);

        reset = 1;
        clk = 0;
        Datain = 0;
        
        #10; reset = 0; Datain = 1;
        #10; reset = 0; Datain = 0;
        #10; reset = 0; Datain = 1;
        #10; $finish;

    end

endmodule
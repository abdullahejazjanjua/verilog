`timescale 1ns / 1ns
`include "pc.v"

module tb;
    
    reg clk, reset;
    wire [31:0] out;

    pc_inc uut (
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    always #10 clk = ~clk;
    initial begin

        $dumpfile("pc_inc.vcd");
        $dumpvars(0, tb);

        reset = 1;
        clk = 0;
        
        #10; 
        #10; reset = 0; 
        #30; 
        #10; $finish;

    end

endmodule
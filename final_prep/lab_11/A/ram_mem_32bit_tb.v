`timescale 1ns/1ns
`include "ram_mem_32bit.v"

module tb;

    reg [4:0] address;
    reg CLK;
    wire [31:0] out;

    ram_mem_32bit uut (
        .address(address),
        .CLK(CLK),
        .out(out)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpfile("ram.vcd");
        $dumpvars(0, tb);
        
        CLK = 0;
        address = 5'd0;

        #10;
        address = 5'd1;
        #10;
        address = 5'd2;
        #10;
        address = 5'd3;
        #10;
        address = 5'd4;
        #10;
        address = 5'd5;
        #10;
        address = 5'd6;
        #10;
        address = 5'd7;
        #10;
        address = 5'd8;
        #10;
        address = 5'd9;
        #10;
        address = 5'd10;
        #10;

        $finish;
    end

endmodule

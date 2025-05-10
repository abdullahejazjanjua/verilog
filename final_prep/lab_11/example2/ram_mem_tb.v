`timescale 1ns/1ns
`include "ram_mem.v"

module tb;

    reg [3:0] in;
    reg [3:0] address;
    reg CLK, reset, read, write;
    wire [3:0] out;

    ram_mem uut (
        .in(in),
        .address(address),
        .CLK(CLK),
        .read(read),
        .write(write),
        .out(out)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpfile("reg_mem.vcd");
        $dumpvars(0, tb);
        
        reset = 1;
        CLK = 0;
        read = 0;
        write = 0;
        in = 32'd0;
        address = 4'd0;

        #10;
        reset = 0;

        #10;
        in = 32'd5; address = 4'd2; write = 1;
        #10;
        write = 0;

        #10;
        read = 1; address = 4'd2;
        #10;
        read = 0;

        #10;
        in = 32'd10; address = 4'd3; write = 1;
        #10;
        write = 0;

        #10;
        read = 1; address = 4'd3;
        #10;
        read = 0;

        #10;
        in = 32'd15; address = 4'd5; write = 1;
        #10;
        write = 0;

        #10;
        read = 1; address = 4'd5;
        #10;
        read = 0;

        #10;
        $finish;
    end

endmodule

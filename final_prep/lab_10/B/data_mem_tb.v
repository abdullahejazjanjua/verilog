`timescale 1ns/1ns
`include "data_mem.v"

module tb;

    reg [31:0] write_data, address;
    reg MemRead, MemWrite, CLK;
    wire [31:0] read_data;

    data_mem uut (
        .write_data(write_data),
        .address(address),
        .CLK(CLK),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .read_data(read_data)
    );

    always #5 CLK = ~CLK;

    initial begin

        $dumpfile("data_mem.vcd");
        $dumpvars(0, tb);

        CLK = 0;
        MemWrite = 0;
        MemWrite = 0;
        write_data = 0;
        
        #10; address = 32'd1; write_data = 1; MemWrite = 1;
        #10; address = 32'd2; write_data = 2;
        #10; address = 32'd3; write_data = 3;
        #10; address = 32'd1; MemRead = 1;
        #10; address = 32'd2;
        #10; address = 32'd3;
        #10; $finish;
    end

endmodule
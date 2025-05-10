`timescale 1ns/1ns
`include "reg_file.v"

module tb;

    reg [4:0] ReadReg1, ReadReg2, WriteReg;
    reg [31:0] write_data;
    reg reset, CLK, RegWrite;
    wire [31:0] read_data1, read_data2;

    reg_file_32bit uut (
        .ReadReg1(ReadReg1),
        .ReadReg2(ReadReg2),
        .WriteReg(WriteReg),
        .write_data(write_data),
        .reset(reset),
        .CLK(CLK),
        .RegWrite(RegWrite),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpfile("reg_file.vcd");
        $dumpvars(0, tb);
        
        CLK = 0;
        reset = 1;
        RegWrite = 0;
        WriteReg = 5'd0;
        write_data = 32'd0;
        ReadReg1 = 5'd0;
        ReadReg2 = 5'd0;

        #10;
        reset = 0;

        #10;
        WriteReg = 5'd1; write_data = 32'd100; RegWrite = 1;
        #10;
        RegWrite = 0;

        #10;
        ReadReg1 = 5'd1;
        #10;
        ReadReg2 = 5'd0;
        #10;

        #10;
        WriteReg = 5'd2; write_data = 32'd200; RegWrite = 1;
        #10;
        RegWrite = 0;

        #10;
        ReadReg1 = 5'd2;
        #10;
        ReadReg2 = 5'd1;
        #10;

        #10;
        $finish;
    end

endmodule

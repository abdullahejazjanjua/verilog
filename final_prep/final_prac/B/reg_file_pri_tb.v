`timescale 1ns/1ns
`include "reg_file_pri.v"

module tb;

    reg [4:0] ReadReg1, ReadReg2, WriteReg;
    reg [31:0] WriteData;
    reg priority_mode, CLK, reset, RegWrite;
    wire [31:0] ReadData1, ReadData2;

    reg_file_pri uut (
        .ReadReg1(ReadReg1),
        .ReadReg2(ReadReg2),
        .WriteReg(WriteReg),
        .WriteData(WriteData),
        .priority_mode(priority_mode),
        .CLK(CLK),
        .reset(reset),
        .RegWrite(RegWrite),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );

    always #5 CLK = ~CLK;

    initial begin
        
        $dumpfile("reg_file_pri.vcd");
        $dumpvars(0, tb);

        CLK = 0; reset = 1; RegWrite = 0; priority_mode = 0;
        WriteReg = 0; WriteData = 0; ReadReg1 = 0; ReadReg2 = 1;
        #10;

        reset = 0;

        RegWrite = 1; WriteReg = 5; WriteData = 32'd25;
        #10;

        WriteReg = 10; WriteData = 32'd100;
        #10;

        RegWrite = 0; ReadReg1 = 5; ReadReg2 = 10;
        #10;

        priority_mode = 1; RegWrite = 1;
        WriteReg = 15; WriteData = 32'd200;
        ReadReg1 = 5; ReadReg2 = 10;
        #10;

        RegWrite = 0;
        #10;

        $finish;
    end
endmodule

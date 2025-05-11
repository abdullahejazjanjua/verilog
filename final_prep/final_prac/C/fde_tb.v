`timescale 1ns/1ns
`include "fde.v"

module tb;

    reg [31:0] write_data;
    reg CLK, reset;
    wire [31:0] data_out;

    fetch_dec_exe uut (
        .write_data(write_data),
        .CLK(CLK),
        .reset(reset),
        .data_out(data_out)
    );

    always #5 CLK = ~CLK;

    initial begin
          $monitor("PC=%d, op_code=%d", uut.pc_out, uut.op_code);
        $dumpfile("fde.vcd");
        $dumpvars(0, tb);

        CLK = 0;
        reset = 1;
        write_data = 0;
        
        #10; reset = 0; write_data = 32'd100;
        #10; write_data = 32'd200;
        #10; write_data = 32'd300;
        #10; write_data = 32'd400;
        #10; write_data = 32'd500;
        #10; reset = 1;
        #10; reset = 0;
        #50;
        #10; $finish;
    end

endmodule

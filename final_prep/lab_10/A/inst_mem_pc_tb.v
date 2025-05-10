`timescale  1ns/1ns
`include "inst_mem_pc.v"

module tb;
    reg reset, CLK;
    wire [31:0] out, op_code;
    inst_mem_pc uut (
        .reset(reset),
        .CLK(CLK),
        .out(out),
        .op_code(op_code)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpfile("inst_mem_pc.vcd");
        $dumpvars(0, tb);
        reset = 1;
        CLK = 0;
        #10; reset = 0;
        #10;
        #10; $finish;
    end

endmodule
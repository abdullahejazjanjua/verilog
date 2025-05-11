`timescale  1ns/1ns
`include "dual_func_pc.v"

module tb;

    reg [31:0] datain;
    reg enable, mode, reset, CLK;
    wire [31:0] dataout;

    dual_func_pc uut (
        .datain(datain),
        .CLK(CLK),
        .mode(mode),
        .enable(enable),
        .reset(reset),
        .dataout(dataout)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpfile("dual_fn_pc.vcd");
        $dumpvars(0, tb);
        reset = 1;
        datain = 0;
        enable = 0;
        CLK = 0;
        
        #10; reset = 0; enable = 1;
        #10; datain = 32'd4; mode = 0; 
        #10; datain = 32'd3; mode = 1;
        #10; 
        #10; $finish;
    end
endmodule
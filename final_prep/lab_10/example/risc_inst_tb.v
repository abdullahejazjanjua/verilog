`timescale 1ns / 1ns
`include "risc_inst.v"

module tb_inst_mem;

    reg reset;
    reg [31:0] PC;

    wire [31:0] op_code;

    inst_mem uut (
        .reset(reset),
        .PC(PC),
        .op_code(op_code)
    );

    initial begin
        $dumpfile("inst_mem.vcd");
        $dumpvars(0, tb_inst_mem);

        reset = 0;
        PC = 0;

        #5 reset = 1;
        #5 reset = 0;

        #10 PC = 0;    
        #10 PC = 4;    
        #10 PC = 8;   
        #10 PC = 12;  
        #10 PC = 16;  
        #10 PC = 20;  
        #10 PC = 24;  
        #10 PC = 28;  

        #10 $finish;
    end
    
endmodule
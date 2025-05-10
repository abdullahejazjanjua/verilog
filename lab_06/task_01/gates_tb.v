`timescale 1ns / 1ns
`include "gates.v"

// iverilog -o out.vvp test_bench_name.v
// vvp out.vvp
// gtkwave

module tb;
    
    reg A, B;
    wire or_C, and_C, xor_C, C_not;

    or_gate uut (
        .A(A),
        .B(B),
        .or_C(or_C), 
        .and_C(and_C), 
        .xor_C(xor_C), 
        .C_not(C_not)
    );

    initial begin
    
        // For creating waveforms
        $dumpfile("tb.vcd"); 
        $dumpvars(0, tb); // module name


        A = 0; B = 0;
        #10; A = 0; B = 1;
        #10; A = 1; B = 0;
        #10; A = 1; B = 1;
        #10; $finish;


    end
endmodule
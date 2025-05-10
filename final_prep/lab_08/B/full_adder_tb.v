`timescale 1ns/1ns
`include "full_adder.v"

module tb;
    reg [1:0] A, B;
    reg Cin;
    wire [1:0] sum;
    wire cout;
    
    full_adder_proc uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin

        $dumpfile("full_adder.vcd");
        $dumpvars(0, tb);

        A = 2'd0; B = 2'd0; Cin = 0;
        #10; A = 2'd1; B = 2'd2; Cin = 0;
        #10; A = 2'd1; B = 2'd1; Cin = 0;
        
        #10; $finish;
            


    end

endmodule
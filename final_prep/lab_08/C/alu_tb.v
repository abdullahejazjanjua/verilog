`timescale 1ns/1ns
`include "alu.v"

module tb;

    reg [31:0] A, B;
    reg cin;
    reg [4:0] cont_sig;
    wire [31:0] alu_out;
    wire cout, zero;

    alu uut (
        .A(A), 
        .B(B), 
        .cin(cin),
        .cont_sig(cont_sig),
        .alu_out(alu_out),
        .cout(cout),
        .zero(zero)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, tb);


        A = 32'd1; B = 32'd1; cin = 0; cont_sig = 5'd0;
        #10;  A = 32'd1; B = 32'd1; cin = 0; cont_sig = 5'd1;
        #10;  A = 32'd10; B = 32'd0; cin = 0; cont_sig = 5'd2;
        #10;  A = 32'd10; B = 32'd10; cin = 0; cont_sig = 5'd6;
        #10;  A = 32'd10; B = 32'd11; cin = 0; cont_sig = 5'd7;
        #10;  A = 32'd1; B = 32'd1; cin = 0; cont_sig = 5'd12;


        #10; ;$finish;
    end

endmodule

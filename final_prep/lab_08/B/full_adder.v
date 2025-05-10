module full_adder(input [1:0] A, B, input Cin, output [1:0] sum, output cout);

    assign {cout, sum} = A + B + Cin;

endmodule

module full_adder_proc(input [1:0] A, B, input Cin, output reg [1:0] sum, output reg cout);

    always @(*) begin
        
        {cout, sum} = A + B + Cin;
    end

endmodule
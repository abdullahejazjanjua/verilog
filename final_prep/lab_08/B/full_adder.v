module full_adder(input [1:0] A, B, input Cin, output [1:0] sum, output cout);

    assign {cout, sum} = A + B + Cin;

endmodule

module full_adder_proc(input [1:0] A, B, input Cin, output reg [1:0] sum, output reg cout);

    always @(*) begin
        
        {cout, sum} = A + B + Cin;
    end

endmodule

module full_adder_behavioral(input A, B, cin, output reg sum, cout);

    always @(*) begin
        
        sum = (A ^ B ^ cin);
        cout = (A & B) | ((A ^ B) & cin);

    end

endmodule


module full_adder_2bit(input [1:0] A, B, input cin, output [1:0] sum, output cout);

    wire cout_1;
    full_adder_behavioral fa1(A[0], B[0], cin, sum[0], cout_1);
    full_adder_behavioral fa2(A[1], B[1], cout_1, sum[1], cout);
    
endmodule
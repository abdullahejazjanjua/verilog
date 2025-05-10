module Mux2x1 (input A, B, S, output out);
    wire not_S, not_A, out_1, out_2;

    not(not_S, S);
    not(not_A, A);
    and(out_1, not_S, not_A);
    and(out_2, S, A);

    or(out, out_1, out_2);

endmodule

module Mux2x1_behavioural (input A, B, S, output reg out);
    
    always @(*) begin
        if (S == 0) begin
            out <= A;
        end
        else begin
            out <= B;
        end
    end

endmodule

module Mux2x1_dataflow (input A, B, S, output out);
    
    
    wire not_A, not_S, out_1, out_2;
    assign not_A = ~A;
    assign not_S = ~S;

    assign out_1 = not_A & not_S;
    assign out_2 = A & S;
    assign out = out_1 | out_2;

endmodule



module Mux4x1_Mux2x1(input A, B, C, D, S0, S1,output out);

    wire out_1, out_2;
    Mux2x1_dataflow m1(A, B, S0, out_1);
    Mux2x1_dataflow m2(C, D, S0, out_2);
    Mux2x1_dataflow m3(out_1, out_2, S1, out);
    
endmodule
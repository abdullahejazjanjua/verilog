module Mux2to1 (input S, A, B, output C);

    wire S_not;
    wire out1, out2;
    not (S_not, S);
    and (out1, S_not, A);
    and (out2, S, B);
    or (C, out1, out2);

endmodule

module Mux4to1 (input S0, S1, A, B, C, D, output ans);

    wire mux_out_1, mux_out_2;

    Mux2to1 mux_1(S0, A, B, mux_out_1);
    Mux2to1 mux_2(S0, C, D, mux_out_2);
    Mux2to1 mux_3(S1, mux_out_1, mux_out_2, ans);

endmodule
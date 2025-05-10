module Mux4x1(input A, B, C, D, S0, S1, output out);

    wire S0_not, S1_not, out_1, out_2, out_3, out_4;
    
    not(S0_not, S0);
    not(S1_not, S1);

    and(out_1, S0_not, S1_not, A);
    and(out_2, S0, S1_not, B);
    and(out_3, S0_not, S1, C);
    and(out_4, S0, S1, D);

    or (out, out_1, out_2, out_3, out_4);

endmodule   
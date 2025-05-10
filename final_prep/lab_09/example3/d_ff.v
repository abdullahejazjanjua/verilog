module d_ff(input D, CLK, output Q, Q_bar);

    wire not_d, out_1, out_2;

    not(not_d, D);
    nand(out_1, D, CLK);
    nand(out_2, not_d, CLK);

    nand(Q, out_1, Q_bar);
    nand(Q_bar, out_2, Q);

endmodule
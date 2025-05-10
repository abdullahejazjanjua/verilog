module DeMux1x4(input A, S0, S1, output O1, O2, O3, O4);

    wire not_S0, not_S1;
    not(not_S0, S0);
    not(not_S1, S1);

    and(O1, A, not_S0, not_S1);
    and(O2, A, S0, not_S1);
    and(O3, A, not_S0, S1);
    and(O4, A, S0, S1);

endmodule

module DeMux1x4_behavioural(input A, S0, S1, output reg O1, O2, O3, O4);

    always @(*) begin
        if (S0 == 0 && S1 == 0) begin 
            O1 <= A;
            O2 <= 0;
            O3 <= 0;
            O4 <= 0;
        end
        else if (S0 == 1 && S1 == 0) begin 
            O2 <= A;
            O1 <= 0;
            O3 <= 0;
            O4 <= 0;
        end
        else if (S0 == 0 && S1 == 1) begin 
            O3 <= A;
            O1 <= 0;
            O2 <= 0;
            O4 <= 0;
        end
        else if (S0 == 1 && S1 == 1) begin 
            O4 <= A;
            O1 <= 0;
            O3 <= 0;
            O2 <= 0;
        end
    end

endmodule

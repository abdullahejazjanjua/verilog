module Mux4x1(input A, B, C, D, S0, S1, output reg out);

    always @(*) begin
        case ({S1, S0})

            2'd0 : out = A;
            2'd1 : out = B;
            2'd2 : out = C;
            2'd3 : out = D;
            default: out = 0;

        endcase
    end
endmodule
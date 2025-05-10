module Mux8x1(input A, B, C, D, E, F, G, H, S0, S1, S2, output reg out);

    always @(*) begin
        
        case ({S2, S1, S0})
            3'd0: out = A;
            3'd1: out = B;
            3'd2: out = C;
            3'd3: out = D;
            3'd4: out = E;
            3'd5: out = F;
            3'd6: out = G;
            3'd7: out = H;
        endcase
    end

endmodule
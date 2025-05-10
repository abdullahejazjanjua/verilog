module Mux8To2(input A7, A6, A5, A4, A3, A2, A1, A0, S0, S1, S2, output reg C);

    always @(*) begin

        case({S2, S1, S0})
            3'd0: C <= A0;
            3'd1: C <= A1;
            3'd2: C <= A2;
            3'd3: C <= A3;
            3'd4: C <= A4;
            3'd5: C <= A5;
            3'd6: C <= A6;
            3'd7: C <= A7;
            default: $display("Invalid Signal");
        endcase
    end 
endmodule
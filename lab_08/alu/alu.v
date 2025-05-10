module alu(input [3:0] ALUs, input A, B, output reg C, S, Zero);

    always @(*)
    begin
        case (ALUs)
            4'd0: C <= A & B;
            4'd1: C <= A | B;
            4'd2: {C, S} <= A + B; 
            4'd6: {C, S} <= A - B; 
            4'd7:  
                if (A < B) 
                    C <= 1;
                else
                    C <= 0;
            4'd12: C <= ~(A|B);
            default: C <= 0;

        endcase 

        if (C == 0)
            Zero <= 1;
        else
            Zero <= 0;
    end

endmodule
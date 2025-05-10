module alu(input [31:0] A, B, input cin, input [4:0] cont_sig, output reg [31:0] alu_out, output reg cout, zero);

    always @(*) begin
        
        case(cont_sig)
            5'd0: alu_out = A & B;
            5'd1: alu_out = A | B;
            5'd2: {cout, alu_out} = A + B + cin;
            5'd6: {cout, alu_out} = A - B - cin;
            5'd7: 
            begin
                if (A < B) begin
                    alu_out = 1;
                end
                else begin
                    alu_out = 0;
                end
            end
            5'd12: alu_out = ~(A | B);
        endcase

         if (alu_out == 0) begin
            zero = 1;
        end
        else begin
            zero = 0;
        end

    end

   
endmodule
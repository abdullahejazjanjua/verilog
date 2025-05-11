module SR(input S, R, CLK, output reg Q, Q_bar);

    always @(posedge CLK) begin
        
     //   if (S == 0 && R == 0) begin
     //        Q <= Q;
     //   end
     //   else if (S == 1 && R == 0) begin
     //        Q <= 1;
     //   end
     //   else if (S == 0 && R == 1) begin
     //        Q <= 0;
     //   end
     //   else begin
     //        $display("Invalid");
     //   end    
          case({S,R})
               2'd0: Q <= Q;
               2'd1: Q <= 0;
               2'd2: Q <= 1;
               default: $display("Invalid");
          endcase
    end
     always @(*) begin
          Q_bar = ~Q;
     end

endmodule
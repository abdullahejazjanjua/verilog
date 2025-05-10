module jk_ff(input J, K, CLK, output reg Q, Q_bar);

    always @(posedge CLK) begin
        if (J == 0 && K == 0) begin
            Q <= Q;
        end
        else if (J == 1 && K == 0) begin
            Q <= 1;
        end
        else if (J == 0 && K == 1) begin
            Q <= 0;
        end
        else if (J == 1 && K == 1) begin
            Q <= ~Q;
        end
    end

    always @(*) begin
        Q_bar <= ~Q;
    end
    
endmodule
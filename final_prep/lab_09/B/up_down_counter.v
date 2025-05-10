module up_down_counter(input CLK, reset, up, output reg [3:0] O);

    always @(posedge CLK, reset) begin
        if (reset) begin
            O <= 0;
        end
        else if (up) begin
            O <= O + 1;
        end
        else  begin
            O <= O - 1;
        end
        
    end

endmodule
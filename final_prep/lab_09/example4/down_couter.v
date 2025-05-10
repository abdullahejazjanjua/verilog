module down_counter(input CLK, reset, output reg [3:0] O);

    always @(posedge CLK, reset) begin
        if (reset) begin
            O <= 0;
        end
        else begin
            O <= O - 1;
        end
        
    end

endmodule
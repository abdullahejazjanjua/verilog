module register(input Datain, clk, reset, output reg Dataout);

    always @(posedge clk, reset) begin

        if (reset)
            Dataout <= 0;
        else
            Dataout <= Datain;
    end

endmodule
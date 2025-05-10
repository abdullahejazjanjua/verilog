module count(input clk, up, reset, output reg [31:0] B);

    always @(posedge clk, reset) begin

        if (reset)
            B <= 0;
        else if (up)
            B <= B + 1;
        else
            B <= B - 1;

    end 

endmodule
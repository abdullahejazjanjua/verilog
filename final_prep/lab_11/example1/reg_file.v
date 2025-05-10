module reg_file(input [31:0] in, input CLK, reset, output reg [31:0] out);

    always @(posedge CLK, reset) begin
        if (reset) begin
            out <= 0;
        end
        else begin
            out <= in;
        end
    end
endmodule
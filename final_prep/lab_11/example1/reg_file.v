module reg_file(input [31:0] in, input CLK, reset, en, output reg [31:0] out);

    always @(posedge CLK, reset) begin
        if (reset) begin
            out <= 0;
        end
        else if(en) begin
            out <= in;
        end
    end
endmodule
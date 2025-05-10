module register(input [31:0] datain, input CLK, reset, output reg [31:0] dataout);

    always @(posedge CLK, reset) begin
        
        if (reset) begin
            dataout <= 0;
        end
        else begin
            dataout <= datain;
        end

    end

endmodule
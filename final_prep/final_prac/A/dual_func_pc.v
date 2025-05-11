module dual_func_pc(input [31:0] datain, input CLK, mode, enable, reset, output reg [31:0] dataout);

    always @(posedge CLK) begin
        if (reset) begin
            dataout <= 0;
        end
        
        if (enable) begin
            if (mode == 0) begin
                dataout <= dataout + 1;
            end
            else if (mode == 1) begin
                dataout <= datain;
            end
        end
        else begin
            
        end
    end

endmodule
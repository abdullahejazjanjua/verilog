module ram_mem (input [3:0] in, address, input CLK, read, write, output reg [3:0] out);

    reg [3:0] ram [15:0];
    always @(posedge CLK, read, write) begin
        if (read) begin
            out <= ram[address];
        end
        else if (write) begin
            ram[address] <= in;
        end
    end

endmodule

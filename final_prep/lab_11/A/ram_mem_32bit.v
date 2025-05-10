module ram_mem_32bit(input [4:0] address, input CLK, output reg [31:0] out);
    integer i;
    reg [31:0] ram_32bit [31:0];


    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            ram_32bit[i] = i;
        end
    end

    always @(posedge CLK) begin
        
        out <= ram_32bit[address];

    end

endmodule
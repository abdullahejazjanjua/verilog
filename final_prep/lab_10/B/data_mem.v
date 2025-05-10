module data_mem(input [31:0] write_data, address, input CLK, MemRead, MemWrite, output reg [31:0] read_data);

    reg [31:0] mem [31:0];
    integer i;

    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            mem[i] <= 0;
        end
    end

    always @(posedge CLK) begin
        if (MemRead) begin
            read_data <= mem[address];
        end
        else if (MemWrite) begin
            mem[address] <= write_data;
        end
    end

endmodule
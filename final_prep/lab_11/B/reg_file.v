module reg_file_32bit(input [4:0] ReadReg1, ReadReg2, WriteReg, input [31:0] write_data, input reset, CLK, RegWrite,
output reg [31:0] read_data1, read_data2);

    reg [31:0] reg_file [31:0];
    integer i;

    always @(CLK, reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                reg_file[i] <= 0;
            end
        end
        else if (RegWrite) begin
            reg_file[WriteReg] <= write_data;
        end
        else begin
            read_data1 <= reg_file[ReadReg1];
            read_data2 <= reg_file[ReadReg2];
        end
    end

endmodule
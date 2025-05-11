module reg_file_pri(input [4:0] ReadReg1, ReadReg2, WriteReg, input [31:0] WriteData, input priority_mode, CLK, reset, RegWrite,
output reg [31:0] ReadData1, ReadData2);

    reg [31:0] mem [31:0];
    integer i;
    always @(posedge CLK, reset) begin
        
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                mem[i] <= 0;
            end
        end
        else if (priority_mode == 1) begin
            if (RegWrite) begin
                mem[WriteReg] <= WriteData;
            end
            else begin
                ReadData1 <= mem[ReadReg1];
                ReadData2 <= mem[ReadReg2];
            end
        end
        else if (priority_mode == 0) begin
            if (RegWrite) begin
                mem[WriteReg] <= WriteData;
            end
            ReadData1 <= mem[ReadReg1];
            ReadData2 <= mem[ReadReg2];
        end

    end

endmodule
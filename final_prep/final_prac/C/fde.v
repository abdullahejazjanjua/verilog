// I asked GPT for this task and it came up with this shit. I give up. Good Night, I am sleeping. 
// Lets hope my final goes well

module register(input [4:0] datain, input CLK, reset, output reg [4:0] dataout);

    always @(posedge CLK, posedge reset) begin
        
        if (reset) begin
            dataout <= 0;
        end
        else begin
            dataout <= datain;
        end

    end

endmodule

module inst_mem(input [4:0] PC, output [7:0] op_code);

    reg [7:0] mem [31:0];
    integer i;

    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            mem[i] = 2;
        end
        mem[0] = 2;
        mem[1] = 2;
        mem[2] = 2;
        mem[3] = 2;
        mem[4] = 2;
        mem[5] = 1;
        mem[6] = 1;
        mem[7] = 1;
        mem[8] = 1;
        mem[10] = 1;
    end
    
    assign op_code = mem[PC];  

endmodule

module data_mem(input [31:0] write_data, input [4:0] address, input CLK, MemRead, MemWrite, output reg [31:0] read_data);

    reg [31:0] mem [31:0];
    integer i;

    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            mem[i] = 0;
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

module adder(input [4:0] in, output [4:0] out);

    assign out = in + 1;

endmodule


module fetch_dec_exe(input CLK, reset, input [31:0] write_data, output [31:0] data_out);

    wire [4:0] pc_out, adder_out;
    reg MemRead, MemWrite;
    wire [7:0] op_code;
    
    register PC_(adder_out, CLK, reset, pc_out);
    inst_mem im(pc_out, op_code);

    
    always @(posedge CLK or posedge reset) begin
        if (reset) begin
            MemRead <= 0;
            MemWrite <= 0;
        end
        else begin
            MemRead <= 0;
            MemWrite <= 0;
            
            if (op_code == 8'd1) begin
                MemRead <= 1;
            end
            else if (op_code == 8'd2) begin
                MemWrite <= 1;
            end
        end
    
    end
    

    data_mem dm(write_data, pc_out, CLK, MemRead, MemWrite, data_out);
    adder inc(pc_out, adder_out);
    

endmodule
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

module adder(input [31:0] A, output [31:0] C);

    assign C = A + 4;
endmodule

module inst_mem_pc(input reset, CLK, output [31:0] out, output [31:0] op_code );
    reg [7:0] mem [31:0];
    initial begin
        mem[3] = 8'h00;
            mem[2] = 8'h94;
            mem[1] = 8'h03;
            mem[0] = 8'h33;

            // Setting 32-bit instruction: sub t2, s2, s3
            mem[7] = 8'h41;
            mem[6] = 8'h39;
            mem[5] = 8'h03;
            mem[4] = 8'hb3;

            // Setting 32-bit instruction: mul t0, s4, s5
            mem[11] = 8'h03;
            mem[10] = 8'h5a;
            mem[9] = 8'h02;
            mem[8] = 8'hb3;

            // Setting 32-bit instruction: xor t3, s6, s7
            mem[15] = 8'h01;
            mem[14] = 8'h7b;
            mem[13] = 8'h4e;
            mem[12] = 8'h33;

            // Setting 32-bit instruction: sll t4, s8, s9
            mem[19] = 8'h01;
            mem[18] = 8'h9c;
            mem[17] = 8'h1e;
            mem[16] = 8'hb3;

            // Setting 32-bit instruction: srl t5, s10, s11
            mem[23] = 8'h01;
            mem[22] = 8'hbd;
            mem[21] = 8'h5f;
            mem[20] = 8'h33;

            // Setting 32-bit instruction: and t6, a2, a3
            mem[27] = 8'h00;
            mem[26] = 8'hd6;
            mem[25] = 8'h7f;
            mem[24] = 8'hb3;

            // Setting 32-bit instruction: or a7, a4, a5
            mem[31] = 8'h00;
            mem[30] = 8'hf7;
            mem[29] = 8'h68;
            mem[28] = 8'hb3;
    end

    wire [31:0] out_1;
    register PC(out, CLK, reset, out_1);
    assign op_code = {mem[out_1+3], mem[out_1 + 2], mem[out_1 + 1], mem[out_1]};
    adder inc(out_1, out);

endmodule
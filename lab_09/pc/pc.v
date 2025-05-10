module pc32(input [31:0] Datain, input clk, reset, output reg [31:0] Dataout);

    always @(posedge clk, reset) begin

        if (reset)
            Dataout <= 0;
        else
            Dataout <= Datain;
    end

endmodule

module adder(input [31:0] A, B, output [31:0] C);
    assign C = A + B;
endmodule

module pc_inc(input clk, reset, output [31:0] out);
    wire [31:0] pc_out;
    wire [31:0] outin;

    pc32 PC(outin, clk, reset, pc_out);
    adder ad(pc_out, 32'd4, outin);

    assign out = outin;

endmodule
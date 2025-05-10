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

module adder(input [31:0] A, B, output [31:0] O);

    assign O = A + B;

endmodule

module PC(input CLK, reset, output [31:0] A);

    wire [31:0] out_1;
    
    register P_C(A, CLK, reset, out_1);
    adder ad(out_1, 4, A);


endmodule
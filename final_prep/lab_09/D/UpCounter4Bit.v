module register(input [3:0] datain, input CLK, reset, output reg [3:0] dataout);

    always @(posedge CLK, reset) begin
        
        if(reset) begin
            dataout <= 0;
        end
        else begin
            dataout <= datain;
        end

    end

endmodule

module adder(input [3:0] A, input enable, output [3:0] O);

    assign O = enable? A + 1 : A;

endmodule

module UpCounter4Bit(input CLK, reset, enable, output [3:0] out);
    
    wire [3:0] out_1;
    register REG(out, CLK, reset, out_1);
    adder inc(out_1, enable, out);

endmodule
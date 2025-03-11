module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] w;
    always @(posedge clk) begin
        w <= in;
        if(reset) out <= 0;
        else out <= out | (~in&w);
    end
endmodule
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] w;
    always @(posedge clk)
        w = in;
    always @(posedge clk)
        anyedge = (in & ~w) | (~in & w);
endmodule

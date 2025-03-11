module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
    integer i;
    reg [7:0] w;
    always @(posedge clk) begin
        w <=  in;
        pedge <= in & ~w;
    end
endmodule

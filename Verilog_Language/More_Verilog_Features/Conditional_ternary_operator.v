module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);
    wire [7:0] x1,x2;
    assign x1 = (a<b)?a:b;
    assign x2 = (c<d)?c:d;
    assign min = (x1<x2)?x1:x2;
endmodule

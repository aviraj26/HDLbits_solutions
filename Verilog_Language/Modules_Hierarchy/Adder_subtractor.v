module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0]t;
    assign t = {32{sub}} ^ b;
    wire [15:0] x,y,s1,s2;
    wire c1;
    add16 m1(.a(a[15:0]), .b(t[15:0]), .cin(sub), .cout(c1), .sum(s1));
    add16 m2(.a(a[31:16]), .b(t[31:16]), .cin(c1), .sum(x));
    assign sum = {x,s1};

endmodule
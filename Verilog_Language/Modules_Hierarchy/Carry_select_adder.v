module mux(
    input [15:0]a[1:0],
    input sel,
    output y
);
    assign y = a[sel];
endmodule
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] x,y,s1,s2;
    wire c1;
    add16 m1(.a(a[15:0]), .b(b[15:0]), .cin(2'b0), .cout(c1), .sum(s1));
    add16 m2(.a(a[31:16]), .b(b[31:16]), .cin(2'b0), .sum(x));
    add16 m3(.a(a[31:16]), .b(b[31:16]), .cin(2'b1), .sum(y));
    wire [15:0]v[1:0];
    assign v[0] = x;
    assign v[1] = y;
    assign s2 = v[c1];
    assign sum = {s2,s1};
    
endmodule
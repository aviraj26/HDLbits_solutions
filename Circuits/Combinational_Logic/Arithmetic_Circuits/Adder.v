module fulladder( 
    input a, b, cin,
    output cout, sum );
    assign sum = a^b^cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [2:0] c;
    fulladder m1(.a(x[0]), .b(y[0]), .cin(1'b0), .sum(sum[0]), .cout(c[0]));
    fulladder m2(.a(x[1]), .b(y[1]), .cin(c[0]), .sum(sum[1]), .cout(c[1]));
    fulladder m3(.a(x[2]), .b(y[2]), .cin(c[1]), .sum(sum[2]), .cout(c[2]));
    fulladder m4(.a(x[3]), .b(y[3]), .cin(c[2]), .sum(sum[3]), .cout(sum[4]));

endmodule

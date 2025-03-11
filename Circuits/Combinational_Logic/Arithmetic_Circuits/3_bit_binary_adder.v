module fulladder( 
    input a, b, cin,
    output cout, sum );
    assign sum = a^b^cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    fulladder m1(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout[0]));
    fulladder m2(.a(a[1]), .b(b[1]), .cin(cout[0]), .sum(sum[1]), .cout(cout[1]));
    fulladder m3(.a(a[2]), .b(b[2]), .cin(cout[1]), .sum(sum[2]), .cout(cout[2]));
endmodule

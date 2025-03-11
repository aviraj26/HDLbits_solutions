module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] x,y;
    wire c,n;
    add16 m1(a[15:0],b[15:0],1'b0,x,c);
    add16 m2(a[31:16],b[31:16],c,y,n);
    assign sum = {y,x};

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum = a^b^cin;
    assign cout = a&b | a&cin | b&cin;
endmodule
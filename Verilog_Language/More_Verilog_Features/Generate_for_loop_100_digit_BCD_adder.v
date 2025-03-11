module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [100:0]c;
    assign c[0] = cin;
    genvar i;
    generate for(i = 0; i< 100; i = i + 1)
        begin : hello
            bcd_fadd m1(.a(a[4 * i +:4]), .b(b[4*i+:4]), .cin(c[i]), .cout(c[i+1]), .sum(sum[4*i+:4]));
        end
    endgenerate
    assign cout = c[100];

endmodule

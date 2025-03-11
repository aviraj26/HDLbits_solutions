module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_or_bitwise = {a[2] | b[2], a[1] | b[1], a[0] | b[0]};
    assign out_not[0+:3] = ~a[0+:3];
    assign out_not[3+:3] = ~b[0+:3];
    assign out_or_logical = a || b;
endmodule
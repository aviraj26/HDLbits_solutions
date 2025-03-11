module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    and g1(out_and,in[0],in[1],in[2],in[3]);
    or g2(out_or,in[0],in[1],in[2],in[3]);
    xor g3(out_xor,in[0],in[1],in[2],in[3]);
endmodule

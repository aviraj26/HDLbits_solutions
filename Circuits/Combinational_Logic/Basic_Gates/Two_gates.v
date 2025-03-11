module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire x;
    xnor g1(x,in1,in2);
    xor g2(out,x,in3);
endmodule

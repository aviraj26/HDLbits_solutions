module top_module (
    input in1,
    input in2,
    output out);
    wire x,y,z;
    nand g1(x,in1,in1);
    nand g2(y,in2,in2);
    nand g3(z,x,y);
    nand g4(out,z,z);
endmodule

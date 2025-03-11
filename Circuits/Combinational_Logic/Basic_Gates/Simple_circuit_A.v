module top_module (input x, input y, output z);
    wire w;
    xor g1(w,x,y);
    and g2(z,x,w);
endmodule

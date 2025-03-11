module A(input x, input y, output z);
    wire w;
    xor g1(w,x,y);
    and g2(z,x,w);

endmodule
module B ( input x, input y, output z );
    xnor g(z,x,y);
endmodule
module top_module (input x, input y, output z);
    wire z1,z2,z3,z4;
    A m1(x, y ,z1);
    B m2(x, y ,z2);
    and g1(z3, z1, z2);
    or g2(z4, z1, z2);
    xor g3(z, z3, z4);
endmodule

module top_module( 
    input a, 
    input b, 
    output out );
    xnor g(out, a, b);
endmodule

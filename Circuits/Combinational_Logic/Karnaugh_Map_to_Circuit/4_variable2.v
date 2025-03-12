module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    wire x1,x2,y1,y2;
    xor (x1,a,b);
    xor (y1,c,d);
    xnor(x2,a,b);
    xnor(y2,c,d);
    assign out = (x1&y2)|(x2&y1);

endmodule

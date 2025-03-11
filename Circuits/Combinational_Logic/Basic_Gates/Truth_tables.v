module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    mux8 m1(.out(f),.in(8'b10101100),.sel({x3,x2,x1}));

endmodule
module mux8(
    input [7:0] in,
    input [2:0] sel,
    output out
);
    assign out = in[sel];
endmodule

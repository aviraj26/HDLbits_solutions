module top_module ( input [1:0] A, input [1:0] B, output z ); 
    mux16 m(.out(z),.in(16'b1000010000100001),.sel({A[1],A[0],B[1],B[0]}));
endmodule
module mux16(
    input [15:0] in,
    input [3:0] sel,
    output out
);
    assign out = in[sel];
endmodule

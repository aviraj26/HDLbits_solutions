module top_module (input a, input b, input c, output out);//
    wire g;
    andgate inst1(g, a, b, c, 1'b1, 1'b1);
    assign out = ~g;
endmodule

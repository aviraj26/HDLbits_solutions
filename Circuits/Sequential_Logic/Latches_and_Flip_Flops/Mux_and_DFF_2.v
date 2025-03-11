module mux(
    input sel,a,b,
    output out
);
    assign out = (~sel & a) | (sel & b);
endmodule

module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire d1,d;
    mux m1(E, Q, w, d1);
    mux m2(L, d1, R, d);
    always @(posedge clk) begin
        Q <= d;
    end

endmodule

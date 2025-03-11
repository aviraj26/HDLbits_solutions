module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    wire clk,E,L,w;
    assign {w,L,E,clk} = KEY;
    MUXDFF m1(.clk(clk), .w(w),       .R(SW[3]), .E(E), .L(L), .Q(LEDR[3]));
    MUXDFF m2(.clk(clk), .w(LEDR[3]), .R(SW[2]), .E(E), .L(L), .Q(LEDR[2]));
    MUXDFF m3(.clk(clk), .w(LEDR[2]), .R(SW[1]), .E(E), .L(L), .Q(LEDR[1]));
    MUXDFF m4(.clk(clk), .w(LEDR[1]), .R(SW[0]), .E(E), .L(L), .Q(LEDR[0]));
endmodule


module MUXDFF(
    input clk,
    input w, R, E, L,
    output Q
    );
    wire d1,d;
    assign d1 = E?w:Q;
    assign d = L?R:d1;
    always @(posedge clk) begin
         Q <= d;
    end
endmodule


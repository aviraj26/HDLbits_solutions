module top_module (
    input [3:1] y,
    input w,
    output Y2);
    assign Y2 = (~y[2] & y[1]) |
        		(y[3] & w) |
        		(y[2] & ~y[1] & w);

endmodule

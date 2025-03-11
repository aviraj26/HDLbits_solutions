module top_module (
    input clk,
    input d,
    output q
);
    reg a,b;
    always @(posedge clk)
        b <= d;
    always @(negedge clk)
        a <= d;
    assign q = clk?b:a;
endmodule

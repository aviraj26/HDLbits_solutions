module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    wire a,b,c;
    always @(posedge clk) begin
        if(~resetn) {out,c,b,a} <= 4'b0;
        else begin
            out <= c;
            c <= b;
            b <= a;
            a <= in;
        end
    end
endmodule

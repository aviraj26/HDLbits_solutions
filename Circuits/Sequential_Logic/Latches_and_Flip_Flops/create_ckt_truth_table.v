module top_module (
    input clk,
    input j,
    input k,
    output reg Q); 

    always @(posedge clk) begin
        Q <= (~Q & j) | (Q & ~k);
    end
endmodule

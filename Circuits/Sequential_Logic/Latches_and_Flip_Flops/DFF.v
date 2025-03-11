module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);
    always @(posedge clk or posedge ar) begin
        if(ar) q <= 0;
        else begin
            if(clk) q <= d;
            else q <= 0;
        end
    end
endmodule

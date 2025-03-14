module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    assign ena[1] = q[3] & ~q[2] & ~q[1] & q[0];
    assign ena[2] = q[7] & ~q[6] & ~q[5] & q[4] & ena[1];
    assign ena[3] = q[11] & ~q[10] & ~q[9] & q[8] & ena[2];
    always @(posedge clk) begin
        if(reset) q[3:0] <= 0;
        else if(q[3:0] == 4'b1001) q[3:0] <= 0;
        else q[3:0] <= q[3:0] + 1;
    end
    always @(posedge clk) begin
        if(reset) q[7:4] <= 0;
        else if(ena[1]) begin
            if(q[7:4] == 4'b1001) q[7:4] <= 0;
            else q[7:4] <= q[7:4] + 1;
        end
    end    
    always @(posedge clk) begin
        if(reset) q[11:8] <= 0;
        else if(ena[2]) begin
            if(q[11:8] == 4'b1001) q[11:8] <= 0;
            else q[11:8] <= q[11:8] + 1;
        end
    end
    always @(posedge clk) begin
        if(reset) q[15:12] <= 0;
        else if(ena[3]) begin
            if(q[15:12] == 4'b1001) q[15:12] <= 0;
            else q[15:12] <= q[15:12] + 1;
        end
    end
endmodule

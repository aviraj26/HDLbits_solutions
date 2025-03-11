module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    parameter rt = 2'b01, lt = 2'b10;
    always @(posedge clk) begin
        if(load) q <= data;
        else if(ena == rt) begin
            q <= {q[0], q[99:1]};
        end
        else if(ena == lt) begin
            q <= {q[98:0], q[99]};
        end
    end
endmodule

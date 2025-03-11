module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output reg [31:0] q
); 
    wire [2:0]tap;
    assign tap = {q[22], q[2], q[1]} ^ {3{q[0]}};
    always @(posedge clk) begin
        if(reset) q <= 32'h1;
        else q <= {q[0], q[31:23], tap[2], q[21:3], tap[1:0]};
    end
endmodule

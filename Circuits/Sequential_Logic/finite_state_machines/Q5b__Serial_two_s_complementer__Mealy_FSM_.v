module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A = 0, B = 1;
    wire [1:0] state, next_state;
    assign next_state[A] = ~x & state[A];
    assign next_state[B] = state[B] | (x & state[A]);
    always @(posedge clk, posedge areset) begin
        if(areset) state <= 2'b01;
        else state <= next_state;
    end
    assign z = state[B] ^ x;
endmodule

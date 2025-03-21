module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    wire [3:0] state, next_state;
    // State transition logic (combinational)
    assign next_state[0] = (~in[3] & (state[0] | state[3]));
    assign next_state[1] = (in[3] & state[0]) | (state[3] & in[3]);
    assign next_state[2] = state[1];
    assign next_state[3] = state[2];
    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset) state <= 1;
        else state <= next_state;
    end
    // Output logic
    assign done = state[3];
endmodule

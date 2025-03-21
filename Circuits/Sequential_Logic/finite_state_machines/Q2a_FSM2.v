module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter A = 0,
    		B = 1,
    		C = 2,
    		D = 3;
    wire [3:0] state, next_state;
    assign next_state[A] = (~r[1] & ~r[2] & ~r[3] & state[A]) |
        					(state[B] & ~r[1]) | 
        					(state[C] & ~r[2]) |
        					(state[D] & ~r[3]);
    assign next_state[B] = (state[A] | state[B]) & r[1];
    assign next_state[C] = ((state[A] & ~r[1])  | state[C]) & r[2];
    assign next_state[D] = ((state[A] & ~r[1] & ~r[2]) | state[D]) & r[3];
    always @(posedge clk) begin
        if(~resetn) state <= 1;
        else state <= next_state;
    end
    assign g = state[3:1];
endmodule

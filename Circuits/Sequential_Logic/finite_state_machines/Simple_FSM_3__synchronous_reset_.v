module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    parameter A = 0,
    			B = 1,
    			C = 2,
    			D = 3;
    reg [3:0] state;
    wire [3:0] next_state;
    // State transition logic
    assign next_state[A] = (state[A]&~in) | (state[C]&~in);
    assign next_state[B] = (state[A] | state[B] | state[D])&in;
    assign next_state[C] = (state[B]&~in) | (state[D]&~in);
    assign next_state[D] = (state[C]&in);

    // State flip-flops with synchronous reset
    always @(posedge clk) begin
        if(reset) state <= 4'b0001;
        else state <= next_state;
    end
    // Output logic
    assign out = state[D];
endmodule

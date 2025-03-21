module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
    wire start;
	wire [3:0] state, next_state;
    reg [7:0] byte1, byte2, byte3;
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
    assign start = ~state[0];
    assign done = state[3];
    // New: Datapath to store incoming bytes.
    always @(posedge clk) begin
            byte3 <= in;
            byte2 <= byte3;
            byte1 <= byte2;
    end
    assign out_bytes = done?{byte1, byte2, byte3}:24'b0;

endmodule

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
	parameter S0 = 4'b0, 
    		S1 = 4'b0001,
    		S2 = 4'b0010,
    		S3 = 4'b0011,
    		S4 = 4'b0100,
    		S5 = 4'b0101,
    		S6 = 4'b0110,
    		S7 = 4'b0111,
    		S8 = 4'b1000,
    		S9 = 4'b1001;
    reg [3:0] state, next_state;
    wire done_counting, shift_ena;
    always @(*) begin
        case(state)
            S0: next_state = data ? S1 : S0;
            S1: next_state = data ? S2 : S0;
            S2: next_state = data ? S2 : S3;
            S3: next_state = data ? S4 : S0;
            S4: next_state = S5;
            S5: next_state = S6;
            S6: next_state = S7;
            S7: next_state = S8;
            S8: next_state = done_counting ? S9 : S8;
            S9: next_state = ack ? S0 : S9;
        endcase
    end
    always @(posedge clk) begin
        if(reset) state <= S0;
        else state <= next_state;
    end
    assign shift_ena = (state == S4) | (state==S5) | (state==S6) | (state==S7);
    assign counting = (state == S8);
    assign done = (state == S9);
    wire [3:0] delay;
    shift s(clk, (reset|(state == S0)), shift_ena, (state == S8), data, count, done_counting);
endmodule

module shift(
    input clk, reset,
    input shift_ena,count_ena,
    input data,
    output [3:0] out,
    output done
	);
    reg [15:0]q;
    always @(posedge clk) begin
        if(shift_ena) begin out = {out[2:0], data}; q = (out + 1) * 1000; end
        else if(count_ena)begin q = q - 1; out = (q-1)/1000; end
        else q = q;
    end
    assign done = q==1;
endmodule
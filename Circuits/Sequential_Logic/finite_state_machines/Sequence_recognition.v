module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    parameter idle = 4'b000,
    		S1 = 4'b0001,
    		S2 = 4'b0010,
    		S3 = 4'b0011,
    		S4 = 4'b0100,
    		S5 = 4'b0101,
    		S6 = 4'b0110,
    		S7 = 4'b0111,
    		S8 = 4'b1000,
    		S9 = 4'b1001;
    reg [3:0] state,next_state;
    always @(*) begin
        case(state)
            idle: next_state = in ? S1 : idle;
            S1: next_state = in ? S2 : idle;
            S2: next_state = in ? S3 : idle;
            S3: next_state = in ? S4 : idle;
            S4: next_state = in ? S5 : idle;
            S5: next_state = in ? S6 : S9;
            S6: next_state = in ? S7 : S8;
            S7: next_state = in ? S7 : idle;
            S8: next_state = in ? S1 : idle;
            S9: next_state = in ? S1 : idle;
        endcase
    end
    always @(posedge clk) begin
        if(reset) state <= idle;
        else state <= next_state;
    end
    assign disc = (state == S9);
    assign flag = (state == S8);
    assign err = (state == S7);
endmodule

module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter S0 = 3'b000,
    		S1 = 3'b001,
    		S2 = 3'b010,
    		S3 = 3'b011,
    		S4 = 3'b100;
    reg [3:0] state, next_state;
    always @(*) begin
        case(state)
            S0: next_state = x ? S1 : S0;
            S1: next_state = x ? S4 : S1;
            S2: next_state = x ? S1 : S2;
            S3: next_state = x ? S2 : S1;
            S4: next_state = x ? S4 : S3;
        endcase
    end
    always @(posedge clk) begin
        if(reset) state <= 0;
        else state <= next_state;
    end
    assign z = (state == S3) | (state == S4);
endmodule

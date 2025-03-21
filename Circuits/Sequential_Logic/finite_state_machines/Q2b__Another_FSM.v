module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter S1 = 4'b0,
    		S2 = 4'b0001,
    		S3 = 4'b0010,
        	S4 = 4'b0011,
    		S5 = 4'b0100,
    		S6 = 4'b0101,
    		S7 = 4'b0110,
    		S8 = 4'b0111,
    		S9 = 4'b1000,
    		S10 = 4'b1001;
    reg [3:0] state, next_state;
    always @(*) begin
        case(state)
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = x ? S4 : S3;
            S4: next_state = x ? S4 : S5;
            S5: next_state = x ? S6 : S3;
            S6: next_state = S7;
            S7: next_state = y ? S8 : S9;
            S8: next_state = S8;
            S9: next_state = y ? S8 : S10;
            S10: next_state = S10;
        endcase
    end
    always @(posedge clk) begin
        if(~resetn) state <= S1;
        else state <= next_state;
    end
    assign f = (state == S2);
    assign g = (state == S7) | (state == S8) | (state == S6) ;
endmodule

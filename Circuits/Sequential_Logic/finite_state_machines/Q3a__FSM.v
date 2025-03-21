module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A = 4'b0000,
    		B  = 4'b0001,
        	S1 = 4'b0010,
    		S2 = 4'b0011,
    		S3 = 4'b0100,
    		S4 = 4'b0101,
    		S5 = 4'b0110,
    		S6 = 4'b0111,
    		S7 = 4'b1000;
    reg [3:0] state, next_state;
    always @(*) begin
        case(state)
            A:  next_state = s ? B  : A;
            B:  next_state = w ? S1 : S2; 
            S1: next_state = w ? S3 : S4; 
            S2: next_state = w ? S5 : S6; 
            S3: next_state = w ?  B : S7; 
            S4: next_state = w ? S7 : B; 
            S5: next_state = w ? S7 : B; 
            S6: next_state = B; 
            S7: next_state = w ? S1 : S2;
            default: next_state = A;
        endcase
    end
    always @(posedge clk) begin
        if(reset) state <= A;
        else state <= next_state;
    end
    assign z = (state == S7);
endmodule

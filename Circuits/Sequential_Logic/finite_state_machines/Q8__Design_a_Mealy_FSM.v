module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    parameter S1 = 2'b01,
    		S2 = 2'b10,
    		S3 = 2'b11;
    reg [1:0] state, next_state;
    always @(state) begin
        case(state)
            S1: next_state = x ? S2 : S1;
            S2: next_state = x ? S2 : S3;
            S3: next_state = x ? S2 : S1;
            default: next_state = S1;
        endcase
    end
    always @(posedge clk , negedge aresetn) begin
        if(~aresetn) state <= S1;
        else state <= next_state;
    end
    assign z = x & (state == S3);
endmodule

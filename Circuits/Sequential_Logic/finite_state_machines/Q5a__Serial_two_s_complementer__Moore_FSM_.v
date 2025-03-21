module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter A = 2'b00, B = 2'b01, C = 2'b10;
    reg [1:0] state, next_state;
    
    always @(posedge clk or posedge areset) begin
            if (areset) state <= A;
    		else state <= next_state;
    	end
    
    always @(*) begin
            case(state)
                A: next_state = x ? B : A;
                B: next_state = x ? C : B;
                C: next_state = x ? C : B;
                default: next_state <= A;
            endcase
        end
    
    assign z = (state == B);
        
endmodule
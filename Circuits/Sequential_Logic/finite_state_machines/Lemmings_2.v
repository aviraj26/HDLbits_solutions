module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah );
    parameter lt = 2'b00, rt = 2'b01, fl = 2'b10, fr = 2'b11;
    reg[1:0] state,next_state;
    always @(*) begin
        case(state)
            lt:begin
                if(~ground) next_state = fl;
                else if(bump_left) next_state = rt;
                else next_state = lt;
	            end
            rt:begin
                if(~ground) next_state = fr;
                else if(bump_right) next_state = lt;
                else next_state = rt;
            	end
            fl:begin
                if(ground) next_state = lt;
                else next_state = fl;
           		end
            fr: begin
                if(ground) next_state = rt;
                else next_state = fr;
           		end
        endcase
    end
    always @(posedge clk, posedge areset) begin
        if(areset) state <= lt;
        else state <= next_state;
    end
    assign walk_left = (state == lt);
    assign walk_right = (state == rt);
    assign aaah = (state == fr) | (state == fl);

endmodule

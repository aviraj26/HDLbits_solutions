module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

 //   parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        case({state,bump_left,bump_right})
            3'b010: next_state = 1'b1;
            3'b101: next_state = 1'b0;
            3'b011: next_state = ~state;
            3'b111: next_state = ~state;
            default: next_state = state;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state <= 0;
        else state <= next_state;
    end

    // Output logic
    // assign walk_left = (state == ...);
    // assign walk_right = (state == ...);
    assign walk_left = ~state;
    assign walk_right = state;

endmodule

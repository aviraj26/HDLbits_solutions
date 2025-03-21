module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output reg [1:0] state
);
    reg [1:0] st;
    always @(*) begin
        case({train_valid, train_taken})
            2'b00: st = state;
            2'b01: st = state;
            2'b10: begin if(state>0) st = state - 1;
                	else st = 0; end
            2'b11: begin if(state<3) st = state + 1;
                else st = 3; end
        endcase
    end
    always @(posedge clk, posedge areset) begin
        if(areset) state <= 2'b01;
        else state <= st;
    end
endmodule

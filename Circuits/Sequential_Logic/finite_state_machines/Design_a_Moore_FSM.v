module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    // A == 1,2,3,d
    // B == 1,2,3 A and B can be combined
    // C == 1,2,d
    // D == 1,2
    // E == 1,d
    // F == 1
    // G ==
    parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6;
    reg [6:0]state;
    wire [6:0] next_state;
    //state transition logic
    assign next_state[A] = (s==3'b000)&(~state[A] & ~state[B]);
    assign next_state[B] = (s==3'b000)&( state[A] |  state[B]);
    assign next_state[C] = (s==3'b001)&( state[G] |  state[F] | state[E] | state[C]);
    assign next_state[D] = (s==3'b001)&( state[A] |  state[B] | state[D]);
    assign next_state[E] = (s==3'b011)&( state[G] | state[E]);
    assign next_state[F] = (s==3'b011)&(~state[G]);
    assign next_state[G] = (s==3'b111);
    always @(posedge clk) begin
        if(reset) state <= 7'h1;
        else state <= next_state;
    end
    assign fr3 = state[A] | state[B];
    assign fr2 = state[A] | state[B] | state[C] | state[D];
    assign fr1 = state[A] | state[B] | state[C] | state[D] | state[E] | state[F];
    assign dfr = state[E] | state[C] | state[A] | state[B] ;

endmodule

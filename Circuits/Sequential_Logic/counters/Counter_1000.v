module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire clk1;
    wire [3:0]c1, c2, c3;
    bcdcount counter0 (clk, reset, c_enable[0], c1);
    bcdcount counter1 (clk, reset, c_enable[1], c2);
    bcdcount counter2 (clk, reset, c_enable[2], c3);
    assign c_enable[0] = ~reset;
    assign c_enable[1] =  (c1[3] & ~c1[2] & ~c1[1] & c1[0]);
    assign c_enable[2] =  (c2[3] & ~c2[2] & ~c2[1] & c2[0]) & (c1[3] & ~c1[2] & ~c1[1] & c1[0]);
    assign OneHertz    =  (c3[3] & ~c3[2] & ~c3[1] & c3[0]) & 
        				  (c2[3] & ~c2[2] & ~c2[1] & c2[0]) & 
        				  (c1[3] & ~c1[2] & ~c1[1] & c1[0]);
endmodule

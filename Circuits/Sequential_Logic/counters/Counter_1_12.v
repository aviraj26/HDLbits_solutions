module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    assign c_enable = enable;
    assign c_load = ((Q == 4'b1100)&enable) | (reset);
    assign c_d = 4'b1;   
    count4 the_counter (clk, c_enable, c_load, c_d, Q);
endmodule

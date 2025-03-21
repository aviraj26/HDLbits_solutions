module top_module ();
    reg clk, reset, t;
    wire q;
    tff dut(clk, reset, t, q);
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
        	t = 1;
    end
endmodule

module top_module (
    input clk,
    input x,
    output z
); 
    wire d1,d2,d3;
    reg q1,q2,q3;
    xor g1(d1,x,q1);
    assign d2 = (~q2) & x;
    assign d3 = (~q3) | x;
    always @(posedge clk) begin 
        q1 <= d1;
        q2 <= d2;
        q3 <= d3;
    end
	assign z = ~(q1 | q2 | q3);
endmodule

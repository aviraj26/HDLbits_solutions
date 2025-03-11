module top_module( 
    input [254:0] in,
    output [7:0] out );
    integer i;
    integer x;
    always @(*) begin
        x = 0;
        for(i=0;i<255;i = i + 1) begin
            if(in[i] == 1'b1) x = x+1;
        end
    end
    assign out = x;
endmodule

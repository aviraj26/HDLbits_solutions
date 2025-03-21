module top_module();
    wire out;
    reg [1:0]in;
    andgate m1(in,out);
    initial begin
        in[0] = 0;in[1] =0;
        #10 in[0] = 1;in[1] =0;
        #10 in[0] = 0; in[1] = 1;
        #10 in[0] = 1; in[1] = 1;
    end
    
endmodule

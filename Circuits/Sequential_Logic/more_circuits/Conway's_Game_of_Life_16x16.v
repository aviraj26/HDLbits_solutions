module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    reg [255:0] next;
    integer i;
    reg [3:0] sum [255:0];
    always @(*) begin
        for(i=0;i<256;i=i+1)begin
            if(i==0) sum[i] = q[255] + q[15] + q[240] + q[241] + q[1] + q[31] + q[16] + q[17];
            else if(i==15) sum[i] = q[255] + q[0] + q[240] + q[254] + q[14] + q[31] + q[16] + q[30];
            else if(i==240) sum[i] = q[255] + q[15] + q[0] + q[241] + q[1] + q[224] + q[225] + q[239];
            else if(i==255) sum[i] = q[254] + q[15] + q[14] + q[0] + q[240] + q[224] + q[239] + q[238];
            else if(i<16) sum[i] = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i+17] + q[i+239] + q[i+241] + q[i+240];
            else if(i>240) sum[i] = q[i-1] + q[i+1] + q[i-240] + q[i-239] + q[i-241] +q[i-15] + q[i-16] + q[i-17];
            else if(i%16 == 0) sum[i] = q[i-16] + q[i+1] + q[i-15] + q[i+16] + q[i+17] + q[i-1] + q[i+15] + q[i+31];
            else if((i+1)%16 == 0) sum[i] = q[i-1] + q[i-16] + q[i+16] + q[i-17] + q[i+15] + q[i-15] + q[i-31] + q[i+1];
            else sum[i] = q[i+1] + q[i-1] + q[i+16] + q[i+15] + q[i+17] + q[i-16] + q[i-15] + q[i-17];
            case(sum[i])
                4'h2:next[i] = q[i];
                4'h3:next[i] = 1;
                default:next[i] = 0;
            endcase
        end
    end
    always @(posedge clk) begin
        if(load) q <= data;
        else q <= next;
    end
        
endmodule
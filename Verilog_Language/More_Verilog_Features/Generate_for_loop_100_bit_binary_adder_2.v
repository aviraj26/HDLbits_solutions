module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    wire [100:0]c;
    assign c[0] = cin;
    generate for(i = 0; i < 100; i = i + 1)
        begin : ca_f
            wire t1,t2,t3;
            xor g1(sum[i],a[i],b[i],c[i]);
            and g2(t1,a[i],b[i]);
            and g3(t2,a[i],c[i]);
            and g4(t3,c[i],b[i]);
            or g5(c[i+1],t1,t2,t3);
        end
	endgenerate
    assign cout = c[100:1];
endmodule

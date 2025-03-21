module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter idle = 4'b0, 
    		start = 4'b0001, 
    		data0 = 4'b0010,
        	data1 = 4'b0011,
    		data2 = 4'b0100,
    		data3 = 4'b0101,
    		data4 = 4'b0110,
    		data5 = 4'b0111,
    		data6 = 4'b1000,
    		data7 = 4'b1001,
    		waite = 4'b1010,
    		stop = 4'b1011,
    		que = 4'b1100;
    reg [3:0] state, next_state;
    always @(*) begin
        case(state)
            idle:  next_state = in?idle:start;
            start: next_state = data0;
            data0: next_state = data1;
            data1: next_state = data2;
            data2: next_state = data3;
            data3: next_state = data4;
            data4: next_state = data5;
            data5: next_state = data6;
            data6: next_state = data7;
            data7: next_state = in?stop:waite;
            waite: next_state = in?que:waite;
            que  : next_state = in?idle:start; //for condition if stop bit does not appear when expected
            stop : next_state = in?idle:start;
        endcase
    end
    always @(posedge clk) begin
        if(reset) state <= idle;
        else state <= next_state;
    end
    assign done = (state == stop);
endmodule

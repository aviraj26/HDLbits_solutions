module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
 	parameter lt = 3'b000, rt = 3'b001, fl = 3'b010, fr = 3'b011,dl = 3'b100, dr = 3'b101,dd = 3'b110;
    reg[2:0] state,next_state;
    //counter
    reg[4:0] count;
    always @(posedge clk) begin
        if ((state != fl)&(state != fr)) // reset counter when not falling
            count <= 0;
        else if (count == 20) // saturate at 21
            count <= 20;
        else
            count <= count + 1; // increment if falling
    end


    always @(*) begin
        case(state)
            lt:begin
                if(~ground) next_state = fl;
                else if(dig) next_state = dl;
                else if(bump_left) next_state = rt;
                else next_state = lt;
	            end
            rt:begin
                if(~ground) next_state = fr;
                else if(dig) next_state = dr;
                else if(bump_right) next_state = lt;
                else next_state = rt;
            	end
            fl:begin
                if((count == 20) & ground) next_state = dd;
                else if(ground) next_state = lt;
                else next_state = fl;
           		end
            fr: begin
                if((count == 20) & ground) next_state = dd;
                else if(ground) next_state = rt;
                else next_state = fr;
           		end
            dl: begin
                if(~ground) next_state = fl;
                else next_state = dl;
            end
            dr:begin
                if(~ground) next_state = fr;
                else next_state = dr;
            end
            dd:begin
                next_state = dd;
            end
        endcase
    end
    always @(posedge clk, posedge areset) begin
        if(areset) state <= lt;
        else state <= next_state;
    end
    assign walk_left = (state == lt);
    assign walk_right = (state == rt);
    assign aaah = ((state == fr) | (state == fl));
    assign digging =((state == dr)|(state == dl));
endmodule

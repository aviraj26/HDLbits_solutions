module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 
    wire ena_s, ena_m1, ena_m2, ena_h1, ena_h2, pm_ena;
    assign ena_s = ss[3] & ~ss[2] & ~ss[1] & ss[0];
    assign ena_m1 = ~ss[7] & ss[6] & ~ss[5] & ss[4] & ena_s;
    assign ena_m2 = mm[3] & ~mm[2] & ~mm[1] & mm[0] & ena_m1;
    assign ena_h1 = ~mm[7] & mm[6] & ~mm[5] & mm[4] & ena_m2;
    assign ena_h2 = (hh[3] & ~hh[2] & ~hh[1] & hh[0] | (hh == 8'b00010010)) & ena_h1;
    assign pm_ena = ena_h1 & (hh == 8'b00010001);
    always @(posedge clk) begin
        if(reset) ss[3:0] <= 0;
        else if(ena) begin
            if(ss[3:0] == 4'b1001) ss[3:0] <= 0;
            else ss[3:0] <= ss[3:0] + 1;
        end
    end
    always @(posedge clk) begin
        if(reset) ss[7:4] <= 0;
        else if(ena) begin
            if(ss == 8'b01011001) ss[7:4] <= 0;
            else if(ena_s) ss[7:4] <= ss[7:4] + 1;
        end
    end
    always @(posedge clk) begin
        if(reset) mm[3:0] <= 0;
        else if(ena & ena_m1) begin
            if(mm[3:0] == 4'b1001) mm[3:0] <= 0;
            else mm[3:0] <= mm[3:0] + 1;
        end
    end
    always @(posedge clk) begin
        if(reset) mm[7:4] <= 0;
        else if(ena & ena_m2) begin
            if(mm == 8'b01011001) mm[7:4] <= 0;
            else mm[7:4] <= mm[7:4] + 1;
        end
    end    
    always @(posedge clk) begin
        if(reset) hh[3:0] <= 4'b0010;
        else if(ena & ena_h1) begin
            if(hh == 8'b00010010) hh[3:0] <= 4'b0001;
            else if(hh[3:0] == 4'b1001) hh[3:0] <= 0;
            else hh[3:0] <= hh[3:0] + 1;
        end
    end
    always @(posedge clk) begin
        if(reset) hh[7:4] <= 4'b0001;
        else if(ena & ena_h2) begin
            if(hh == 8'b00010010) hh[7:4] <= 0;
            else hh[7:4] <= hh[7:4] + 1;
        end
    end
    always @(posedge clk) begin
        if(reset) pm <= 0;
        else if(pm_ena) pm = ~pm;
    end
endmodule

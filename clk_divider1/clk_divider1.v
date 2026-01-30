// 20 MHz with 20% Duty and 20 MHz with 40% duty using 100 MHz clock

module clk_divider1(src_clk,rstn,clk20_20,clk20_40);

input src_clk;
input rstn;
output reg clk20_20,clk20_40;

reg [2:0] cnt20_20, cnt20_40; // using MOD5 counters

always@(posedge src_clk or negedge rstn)
begin
    if(!rstn)
    begin
        cnt20_20 <= 3'b0;
        cnt20_40 <= 3'b0;
    end
    else
    begin
        // 20 MHz with 20% duty - MOD5 Counter
        if(cnt20_20 == 3'd4)
          cnt20_20 <= 3'd0;
        else
          cnt20_20 <= cnt20_20 + 1'b1;
    
        // 20 MHz with 40% duty - MOD5 Counter
        if(cnt20_40 == 3'd4)
          cnt20_40 <= 3'd0;
        else
          cnt20_40 <= cnt20_40 + 1'b1;
    end
end

always@(posedge src_clk or negedge rstn)
begin
    if(!rstn)
    begin
        clk20_20 <= 1'b0;
        clk20_40 <= 1'b0;
    end
    else
    begin
        // 20 MHz with 20% duty
        if(cnt20_20 == 3'd0)
          clk20_20 <= 1'b1;
        else
          clk20_20 <= 1'b0;

        // 20 MHz with 40% duty
        if(cnt20_40 < 3'd2)
          clk20_40 <= 1'b1;
        else
          clk20_40 <= 1'b0;
    end
end

endmodule

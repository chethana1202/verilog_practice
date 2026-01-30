// 20 MHz clk with 20% duty and 20 MHz clk with 40% duty - Approach 2(Using 5 bit ring counter)

module clk_divider_rc(clk,pre,clr,q,clk20_20,clk20_40);

input clk;
input [4:0] pre,clr;

output wire [4:0] q;
output reg clk20_20,clk20_40;

dff d4(.clk(clk),.pre(pre[4]),.clr(clr[4]),.d(q[0]),.q(q[4]));
dff d3(.clk(clk),.pre(pre[3]),.clr(clr[3]),.d(q[4]),.q(q[3]));
dff d2(.clk(clk),.pre(pre[2]),.clr(clr[2]),.d(q[3]),.q(q[2]));
dff d1(.clk(clk),.pre(pre[1]),.clr(clr[1]),.d(q[2]),.q(q[1]));
dff d0(.clk(clk),.pre(pre[0]),.clr(clr[0]),.d(q[1]),.q(q[0]));

always@(*)
begin
    clk20_20 <= q[4];
    clk20_40 <= q[4] | q[3];
end
        
endmodule

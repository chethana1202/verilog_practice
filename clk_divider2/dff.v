// D flip flop with active high asynchronous preset and clear inputs

module dff(clk,pre,clr,d,q);

input clk;
input pre,clr;
input d;
output reg q;

always@(posedge clk or posedge pre or posedge clr)
begin
    if(pre)
      q <= 1'b1;
    else if(clr)
      q <= 1'b0;
    else
      q <= d;
end

endmodule

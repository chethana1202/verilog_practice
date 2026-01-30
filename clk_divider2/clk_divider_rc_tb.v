// 20 MHz clk with 20% duty and 20 MHz clk with 40% duty - Approach 2(Using 5 bit ring counter)

module clk_divider_rc_tb();

reg clk;
reg [4:0] pre,clr;

wire [4:0] q;
wire clk20_20,clk20_40;

clk_divider_rc dut(.clk(clk),.pre(pre),.clr(clr),.q(q),.clk20_20(clk20_20),.clk20_40(clk20_40));

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

task initialize();
begin
    pre = 5'b0;
    clr = 5'b11111;
end
endtask

task stimulus();
begin
    #15;
    pre = 5'b10000;
    clr = 5'b01111;
end
endtask

initial
begin
    initialize();
    stimulus();
    #10;
    pre = 5'b0;
    clr = 5'b0;
    #100 $finish;
end

endmodule

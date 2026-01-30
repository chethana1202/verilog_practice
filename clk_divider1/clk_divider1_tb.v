// 20 MHz with 20% Duty and 20 MHz with 40% duty using 100 MHz clock

`timescale 1ns/1ns

module clk_divider1_tb();

reg src_clk;
reg rstn;

wire clk20_20,clk20_40;

clk_divider1 dut(.src_clk(src_clk),.rstn(rstn),.clk20_20(clk20_20),.clk20_40(clk20_40));

initial
begin
    src_clk = 1'b0;
    forever #5 src_clk = ~src_clk; // 100 MHz source clock
end

task initialize();
begin
    rstn = 1'b0;
end
endtask

task reset();
begin
    rstn = 1'b0;
    #10 rstn = 1'b1;
end
endtask

initial
begin
    initialize();
    reset();
    #500 $finish;
end

endmodule

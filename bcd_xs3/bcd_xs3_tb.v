module bcd_xs3_tb();

reg [3:0] B;
wire [3:0] E;

integer i;

bcd_xs3 dut(.B(B),.E(E));

initial
begin
    B = 4'd0;
    for(i=0;i<16;i=i+1)
    begin
        B = i;
        #10;
    end
    #100 $finish;
end

endmodule

module odd_parity_gen_tb();

reg clk,rstn;
reg w;

wire z;

odd_parity_gen dut(.clk(clk),.rstn(rstn),.w(w),.z(z));

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

task initialize();
begin
    rstn = 1'b0;
    w = 1'b0;
end
endtask

task reset();
begin
    rstn = 1'b0;    
    #10 rstn = 1'b1;
end
endtask

task stimulus(input m);
begin
    @(negedge clk);
    w = m;
end
endtask

initial
begin
    initialize();
    reset();
    stimulus(0); //S0
    stimulus(0); //S00
    stimulus(1); //S001,z=1
    #10;
    initialize();
    reset(); // IDLE
    stimulus(1); //S1
    stimulus(0); //S10
    stimulus(1); //S01,z=0
    #10;
    initialize();
    reset(); // IDLE
    stimulus(1); //S1
    stimulus(1); //S11
    stimulus(1); //S111,z=1
    #10;
    initialize();
    reset(); // IDLE
    stimulus(0); //S0
    stimulus(1); //S01
    stimulus(1); //S11,z=0
    #300 $finish;
end

endmodule

module bcd_xs3(B,E);

input [3:0] B;
output reg [3:0] E;

wire [9:0] Y;

decoder4_10 dut(.D(B),.Y(Y));

always@(*)
begin
    E[3] = Y[5] | Y[6] | Y[7] | Y[8] | Y[9];
    E[2] = Y[1] | Y[2] | Y[3] | Y[4] | Y[9];
    E[1] = Y[0] | Y[3] | Y[4] | Y[7] | Y[8];
    E[0] = Y[0] | Y[2] | Y[4] | Y[6] | Y[8];
end

endmodule          

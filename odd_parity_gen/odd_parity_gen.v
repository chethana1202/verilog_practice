module odd_parity_gen(clk,rstn,w,z);

input clk,rstn;
input w;
output reg z;

parameter IDLE = 4'b0000,
          S0 = 4'b0001,
          S1 = 4'b0010,
          S00 = 4'b0011,
          S01 = 4'b0100,
          S10 = 4'b0101,
          S11 = 4'b0110,
          S001 = 4'b0111,
          S010 = 4'b1000,
          S100 = 4'b1001,
          S111 = 4'b1010;

reg [3:0] PRESENT, NEXT;

// Present state logic - Sequential block
always@(posedge clk or negedge rstn)
begin
    if(!rstn)
      PRESENT <= IDLE;
    else
      PRESENT <= NEXT;
end

// Next state logic - Combinational block
always@(*)
begin
    case(PRESENT)
    IDLE: if(w)
            NEXT = S1;
          else
            NEXT = S0;
    S0:   if(w)
            NEXT = S01;
          else
            NEXT = S00;
    S1:   if(w)
            NEXT = S11;
          else
            NEXT = S10;
    S00:  if(w)
            NEXT = S001;
          else
            NEXT = S00;
    S01:  if(w)
            NEXT = S11;
          else
            NEXT = S010;
    S10:  if(w)
            NEXT = S01;
          else
            NEXT = S100;
    S11:  if(w)
            NEXT = S111;
          else
            NEXT = S10;
    S001: if(w)
            NEXT = S11;
          else
            NEXT = S010;
    S010: if(w)
            NEXT = S01;
          else
            NEXT = S100;
    S100: if(w)
            NEXT = S001;
          else
            NEXT = S00;
    S111: if(w)
            NEXT = S111;
          else
            NEXT = S10;
    default: NEXT = IDLE;
    endcase
end

// Output logic - Combinational block
always@(*)
begin
    z = ((PRESENT == S001) || (PRESENT == S010) || (PRESENT == S100) || (PRESENT == S111));
end

endmodule

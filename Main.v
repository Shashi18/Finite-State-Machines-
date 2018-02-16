module FSM(a,q,clk);
input [15:0]a;                         //THIS IS INPUT
output reg q;                     //THIS IS OUTPUT
input clk;                         //CLOCK
reg [1:0] state;                 //STATE
reg [15:0] c;
integer flag = 0;
initial begin
q = 0;
state = 2'b00; //initially at state A-00
end
always @(posedge clk)begin
if(flag==0)
c <= a;
flag = flag + 1;
end
always @(posedge clk)begin
$display("State = %d Bit = %b Q = %b",state,c[15],q);
if(state==2'b00 && c[15]==0)begin
  state <=2'b00;              // state A-00
  q <= 0;
end
else if(state==2'b00 && c[15]==1) begin
  state <=2'b01;           // state B-01
  q <= 0;
end
else if(state==2'b01 && c[15]==0)begin
  state <=2'b00;            //state A-00
  q <= 0;
end
else if(state==2'b01 && c[15]==1) begin
  state <=2'b10;             //state C-10
  q <= 0;
end

else if(state==2'b10 && c[15]==0) begin
  state <= 2'b11;           //state D-11
  q <= 0;
end
else if(state==2'b10 && c[15]==1) begin
  state=2'b10;              //state C-10
  q <= 0;
end
else if(state==2'b11 && c[15]==0) begin
  state=2'b00;                  //state A-00
  q <= 0;
end
else if(state==2'b11 && c[15]==1) begin
  state=2'b01 ;
  q <= 1;
end
c = c<<1;   //to get the MSB of 16bit input which has to be checked with MSB of 1101
end
endmodule


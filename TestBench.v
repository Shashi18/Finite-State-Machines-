module FSM_Mealey();
reg a;
reg clk;
wire q;
integer i;
reg [15:0] inp;
FSM finite(inp,q,clk);
initial begin
clk = 0;
inp <= 16'b1101_0010_1101_0000;            //input sequence
end
always
#2 clk = !clk;
endmodule

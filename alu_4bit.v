module alu(a,b,OP,RESULT);
parameter N4= 4;
input  [N4-1:0] a,b;
input [1:0] OP;
output reg [N4-1:0] RESULT;
wire [N4-1:0] S;

adder #(.N(N4)) HA1(.A(a),.B(b),.C(S)); 


always @(*) begin
	case(OP)
	2'b00 : RESULT= S;
	2'b10 : RESULT= a - b;
	2'b01 : RESULT= a | b;
	2'b11 : RESULT= a ^ b;
	endcase
end 
endmodule
module mux1(A,B,C,sel,D,out,out_bar);
input A,B,C,sel;
input [2:0] D;
output reg out,out_bar;

always @(*) begin
	if (sel == 0)begin
		out= (D[0] & D[1]) | D[2];
		out_bar= ~out;
	end
	else begin
		out= ~(A ^ B ^ C);
		out_bar= ~out;
	end
end
endmodule
module segment(A,B,OP2,EN,out);
parameter N7= 4;
input [N7-1:0] A, B;
 input [1:0] OP2;
input EN;
output reg [6:0] out;

wire [N7-1:0] S;

alu #(.N4(N7)) FA(.a(A),.b(B),.OP(OP2),.RESULT(S));

always @(*) begin
	if(EN == 1)begin
		case(S)
		4'b0000: out= 7'b1111110;
		4'b0001: out= 7'b0110000;
		4'b0010: out= 7'b1101101;
		4'b0011: out= 7'b1111001;
		4'b0100: out= 7'b0110011;
		4'b0101: out= 7'b1011011;
		4'b0110: out= 7'b1011111;
		4'b0111: out= 7'b1110000;
		4'b1000: out= 7'b1111111;
		4'b1001: out= 7'b1111011;
		4'b1010: out= 7'b1110111;
		4'b1011: out= 7'b0011111;
		4'b1100: out= 7'b1001110;
		4'b1101: out= 7'b0111101;
		4'b1110: out= 7'b1001111;
		4'b1111: out= 7'b1000111;
		endcase
	end
	else begin
		out=7'b0;
		
	end
end
endmodule
module gray(A,USE_GRAY,B);
input [2:0] A;
input USE_GRAY;
output reg[6:0] B;

always @(*)begin
	if(USE_GRAY == 1)begin
	case(A)
	3'h0: B=3'h0;
	3'h1: B=3'h1;
	3'h2: B=3'h3;
	3'h3: B=3'h2;
	3'h4: B=3'h6;
	3'h5: B=3'h7;
	3'h6: B=3'h5;
	3'h7: B=3'h4;
	endcase
	end
	else begin
	case(A)
	3'b000: B= 7'b0000000;
	3'b001: B= 7'b0000001;
	3'b010: B= 7'b0000010;
	3'b011: B= 7'b0000100;
	3'b100: B= 7'b0001000;
	3'b101: B= 7'b0010000;
	3'b110: B= 7'b0100000;
	3'b111: B= 7'b1000000;
	endcase
	end 
end
endmodule

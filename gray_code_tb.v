module gray_tb();

reg [2:0] A_tb ;
reg use_gray_tb;
reg [6:0] B_expect;
wire [6:0] B_dut;

gray DUT(A_tb,use_gray_tb,B_dut);

integer i;
initial begin
	for(i=0 ; i< 99 ; i = i +1)begin
		A_tb= $random;
		use_gray_tb= $random;
		if(use_gray_tb == 1)begin
			case(A_tb)
				3'h0: B_expect=3'h0;
				3'h1: B_expect=3'h1;
				3'h2: B_expect=3'h3;
				3'h3: B_expect=3'h2;
				3'h4: B_expect=3'h6;
				3'h5: B_expect=3'h7;
				3'h6: B_expect=3'h5;
				3'h7: B_expect=3'h4;
			endcase
		end
		else begin
			case(A_tb)
				3'b000: B_expect= 7'b0000000;
				3'b001: B_expect= 7'b0000001;
				3'b010: B_expect= 7'b0000010;
				3'b011: B_expect= 7'b0000100;
				3'b100: B_expect= 7'b0001000;
				3'b101: B_expect= 7'b0010000;
				3'b110: B_expect= 7'b0100000;
				3'b111: B_expect= 7'b1000000;
			endcase
		end
		#10
		if(B_expect != B_dut)begin
			$display("error- encoding out is incorrect");
			$stop;
		end
	end 
	$stop; 
end
initial begin
$monitor("A=%b , use_gray=%b , B_expect=%b , B_dut=%b",A_tb,use_gray_tb,B_expect,B_dut);
end
endmodule
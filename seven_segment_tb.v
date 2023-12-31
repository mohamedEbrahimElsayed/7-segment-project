module segment_tb();
parameter N7_tb= 4;
reg  [N7_tb-1:0] A_tb, B_tb, result_expect;
reg [6:0] out_expect;
reg [1:0] OP2_tb;
reg EN_tb;

wire [6:0] out_dut;

segment #(N7_tb) DUT(A_tb,B_tb,OP2_tb,EN_tb,out_dut);

integer i;
initial begin
	for(i= 0 ; i < 99 ; i = i + 1)begin
		A_tb=$random;
		B_tb=$random;
		OP2_tb=$random;
		EN_tb= $random;
		case(OP2_tb)
			2'b00 : result_expect= A_tb + B_tb;
			2'b10 : result_expect= A_tb - B_tb;
			2'b01 : result_expect= A_tb | B_tb;
			2'b11 : result_expect= A_tb ^ B_tb;
		endcase
		if(EN_tb == 1)begin
			case(result_expect)
			4'b0000: out_expect= 7'b1111110;
			4'b0001: out_expect= 7'b0110000;
			4'b0010: out_expect= 7'b1101101;
			4'b0011: out_expect= 7'b1111001;
			4'b0100: out_expect= 7'b0110011;
			4'b0101: out_expect= 7'b1011011;
			4'b0110: out_expect= 7'b1011111;
			4'b0111: out_expect= 7'b1110000;
			4'b1000: out_expect= 7'b1111111;
			4'b1001: out_expect= 7'b1111011;
			4'b1010: out_expect= 7'b1110111;
			4'b1011: out_expect= 7'b0011111;
			4'b1100: out_expect= 7'b1001110;
			4'b1101: out_expect= 7'b0111101;
			4'b1110: out_expect= 7'b1001111;
			4'b1111: out_expect= 7'b1000111;
			endcase
		end 
		else 
		out_expect= 0;
		#10
		if(out_expect != out_dut)begin
		$display("error- 7 segment out is incorrect");
		$stop;
		end
	end
	$stop;
end
initial begin
$monitor("a=%b, b=%b , op=%b, EN=%b, result=%b, out_dut=%b,out_expect=%b",A_tb,B_tb,OP2_tb,EN_tb,result_expect,out_dut,out_expect);
end 
endmodule
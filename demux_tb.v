module demux_tb();
reg D_tb;
reg [1:0] S_tb;
reg [3:0] Y_expect;
wire [3:0] Y_dut;

demux DUT(D_tb,S_tb,Y_dut);

integer i;
initial begin
	for(i=0 ; i < 99 ; i= i+1)begin
		D_tb=$random;
		S_tb=$random;
		Y_expect=0;
		case(S_tb)
			2'b00: Y_expect[0]= D_tb;
			2'b01: Y_expect[1]= D_tb;
			2'b10: Y_expect[2]= D_tb;
			2'b11: Y_expect[3]= D_tb;
		endcase
		#10
		if(Y_expect != Y_dut)begin
			$display("Error- demux out is incorrect");
			$stop;
		end 
	end
	$stop;
end
initial begin
	$monitor("D=%b, S=%b , Y_expect=%b , Y_dut=%b",D_tb,S_tb,Y_expect,Y_dut);
end
endmodule
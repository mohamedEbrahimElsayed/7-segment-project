module bcd_tb();
reg [10:0] d_tb;
reg [3:0] y_expect;
wire [3:0] y_dut;

bcd DUT(d_tb,y_dut);

initial begin
	#0 d_tb= 10'b0000000001; y_expect= 0;
	#10 d_tb= 10'b0000000010; y_expect= 1;
	#10 d_tb= 10'b0000000100; y_expect= 2;
	#10 d_tb= 10'b0000001000; y_expect= 3;
	#10 d_tb= 10'b0000010000; y_expect= 4;
	#10 d_tb= 10'b0000100000; y_expect= 5;
	#10 d_tb= 10'b0001000000; y_expect= 6;
	#10 d_tb= 10'b0010000000; y_expect= 7;
	#10 d_tb= 10'b0100000000; y_expect= 8;
	#10 d_tb= 10'b1000000000; y_expect= 9;
	#10
	if(y_dut != y_expect)begin
	$display("error-encoder output is incorrect");
	$stop;
	end
	$stop;
end
initial begin
$monitor("D=%b,y_expect=%b,y_dut=%b",d_tb ,y_expect ,y_dut );
end
endmodule
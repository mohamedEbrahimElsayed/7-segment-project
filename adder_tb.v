module adder_tb();
parameter N_tb= 1;
reg  [N_tb-1:0] a_tb, b_tb, c_expect;
wire[N_tb-1:0] c_dut;

adder #(1) DUT(a_tb,b_tb,c_dut);

integer i;
initial begin
	for(i=0; i < 99 ; i = i + 1)begin
		a_tb = $random;
		b_tb = $random;
		c_expect= a_tb + b_tb;
		#10
		if(c_dut != c_expect)begin
		$display("error-adder output is incorrect");
		$stop;
		end
	end
	$stop;
end
initial begin
$monitor("a=%d, b=%d , c=%d",a_tb,b_tb,c_expect);
end 
endmodule
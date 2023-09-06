module mux1_tb();

reg a_tb, b_tb, c_tb, sel_tb, out_expect;
reg  [2:0] d_tb;
wire out_dut;

mux1 DUT(a_tb, b_tb, c_tb, sel_tb, d_tb , out_dut);

integer i;
initial begin
	for(i=0 ; i < 99 ; i= i + 1)begin
		a_tb= $random;
		b_tb= $random;
		c_tb= $random;
		sel_tb= $random;
		d_tb= $random;
		if (sel_tb == 0)begin
		 out_expect= (d_tb[0] & d_tb[1]) | d_tb[2];
		end
		else begin
		 out_expect= ~(a_tb ^ b_tb ^ c_tb);

		end
		#10
		if(out_expect != out_dut)begin
		$display("error_mux1 output is incorrect");
		$stop;
		end
	end
	$stop;
end
initial begin
$monitor("a= %b , b= %b , c= %b , d= %b ,sel= %b ,out_expect= %b",a_tb,b_tb,c_tb,d_tb,sel_tb,out_expect);
end
endmodule
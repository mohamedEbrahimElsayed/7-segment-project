module encoder_tb();
reg [3:0] x_tb;
reg [1:0] y_expect;
wire [1:0] y_dut;

encoder DUT(x_tb,y_dut);

initial begin
	
	#0 x_tb[3] = 1; y_expect= 3;
	#10 x_tb[3]= 0; x_tb[2]= 1; y_expect=2;
	#10 x_tb[3]= 0; x_tb[2]= 0; x_tb[1]= 1; y_expect= 1;
	#10 x_tb[3]= 0; x_tb[2]= 0; x_tb[1]= 0; y_expect= 0;
	#10
	if(y_dut != y_expect)begin
	$display("error-encoder output is incorrect");
	$stop;
	end
	$stop; 	
end
initial begin
$monitor("x[0]=%b,x[1]=%b,x[2]=%b,x[3]=%b,y=%b",x_tb[0] ,x_tb[1] ,x_tb[2] ,x_tb[3] ,y_expect);
end
endmodule
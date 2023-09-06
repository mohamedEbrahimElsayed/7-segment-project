module alu_tb();
parameter N4_tb= 4;
reg [N4_tb-1:0] a_tb,b_tb,result_expect;
reg [1:0] op_tb;
wire [N4_tb - 1:0] result_dut;

alu #(N4_tb) DUT(a_tb,b_tb,op_tb,result_dut);

integer i;
initial begin
	for(i=0; i < 99; i= i + 1)begin
		a_tb=$random;
		b_tb=$random;
		op_tb=$random;
	case(op_tb)
	2'b00 : result_expect= a_tb + b_tb;
	2'b10 : result_expect= a_tb - b_tb;
	2'b01 : result_expect= a_tb | b_tb;
	2'b11 : result_expect= a_tb ^ b_tb;
	endcase
	#10
	if(result_expect != result_dut)begin
	$display("error-alu out is incorrect");
	$stop;
	end
	end
	$stop;
end
initial begin
$monitor("a=%b, b=%b , op=%b, result_dut=%b,result_expect=%b",a_tb,b_tb,op_tb, result_dut,result_expect);
end 
endmodule

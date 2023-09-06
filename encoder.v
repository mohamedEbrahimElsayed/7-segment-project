module encoder(x,y);
input [3:0] x;
output reg [1:0] y;

always @(*)begin
	if(x[3] == 1)
	y= 2'b11;
	else if({x[3],x[2]} == 2'b01)
	y= 2'b10;
	else if({x[3],x[2],x[1]} == 3'b001)
	y= 2'b01;
	else 
	y= 2'b00;

end
endmodule
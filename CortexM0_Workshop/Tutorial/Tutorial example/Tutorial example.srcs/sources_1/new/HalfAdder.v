`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 12:10:50
// Design Name: 
// Module Name: HalfAdder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module HalfAdder( input input1,input input2, output sum, output carry);
assign sum = input1^input2;
assign carry =input1&input2;
endmodule

module HalfAdder_testBench();
wire sum,carry;
reg input1,input2;
HalfAdder halfAdder(input1,input2,sum,carry);
initial 
begin
#100 input1 =0; input2 =0;
#100 input1 =0; input2 =1;
#100 input1 =1; input2 =1;
#100 input1 =1; input2 =0;

end
endmodule
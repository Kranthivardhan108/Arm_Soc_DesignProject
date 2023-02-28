`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2023 11:18:15
// Design Name: 
// Module Name: Verilog Design Experiment - LE01
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


module LogicGates(
    input a,
    input b,
    output AND,
    output OR,
    output NOT,
    output NAND,
    output NOR,
    output XOR,
    output XNOR
    );
    assign AND = a&b;
    assign OR = a|b;
    assign NOT = ~a;
    assign NAND = ~(a&b);
    assign NOR = ~(a+b);
    assign XOR = a&(~b) + (~a)&b;
    always @(a,b)
    begin
     
    end
endmodule

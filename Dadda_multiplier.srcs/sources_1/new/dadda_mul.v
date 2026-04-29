`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2026 21:57:22
// Design Name: 
// Module Name: dadda_mul
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

module dadda_mul (
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] P
);

wire p00, p01, p02, p03;
wire p10, p11, p12, p13;
wire p20, p21, p22, p23;
wire p30, p31, p32, p33;

assign p00 = A[0] & B[0];
assign p01 = A[1] & B[0];
assign p02 = A[2] & B[0];
assign p03 = A[3] & B[0];

assign p10 = A[0] & B[1];
assign p11 = A[1] & B[1];
assign p12 = A[2] & B[1];
assign p13 = A[3] & B[1];

assign p20 = A[0] & B[2];
assign p21 = A[1] & B[2];
assign p22 = A[2] & B[2];
assign p23 = A[3] & B[2];

assign p30 = A[0] & B[3];
assign p31 = A[1] & B[3];
assign p32 = A[2] & B[3];
assign p33 = A[3] & B[3];

wire s1_1, c1_1;
assign s1_1 = p01 ^ p10;
assign c1_1 = p01 & p10;

wire s1_2, c1_2;
assign s1_2 = p02 ^ p11 ^ p20;
assign c1_2 = (p02 & p11) | (p11 & p20) | (p02 & p20);

wire s2_1, c2_1;
assign s2_1 = s1_2 ^ c1_1 ^ p03;
assign c2_1 = (s1_2 & c1_1) | (c1_1 & p03) | (s1_2 & p03);

assign P[0] = p00;
assign P[1] = s1_1;

wire [5:0] sum;
assign sum = {p33,p32,p31,p30} + {c2_1,c1_2,s2_1,p12,p21,p13};

assign P[7:2] = sum;

endmodule

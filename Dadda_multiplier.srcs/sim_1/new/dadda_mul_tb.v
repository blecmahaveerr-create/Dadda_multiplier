`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2026 22:01:42
// Design Name: 
// Module Name: dadda_mul_tb
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
module dadda_mul_tb;

    reg  [3:0] A;
    reg  [3:0] B;
    wire [7:0] P;

    reg  [7:0] expected;

    integer i;

    dadda_mul dut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin

        A = 0; B = 0; #10;
        check_result();

        A = 1; B = 1; #10;
        check_result();

        A = 4'hF; B = 0; #10;
        check_result();

        A = 0; B = 4'hF; #10;
        check_result();

        A = 4'hF; B = 4'hF; #10;
        check_result();

        A = 4'd9; B = 4'd7; #10;
        check_result();

        for (i = 0; i < 20; i = i + 1) begin
            A = $random;
            B = $random;
            #10;
            check_result();
        end

        #10 $finish;
    end

    task check_result;
    begin
        expected = A * B;

        if (P === expected)
            $display("PASS: A=%0d B=%0d | P=%0d", A, B, P);
        else
            $display("FAIL: A=%0d B=%0d | P=%0d Expected=%0d", 
                      A, B, P, expected);
    end
    endtask

endmodule


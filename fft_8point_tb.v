`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2025 13:46:04
// Design Name: 
// Module Name: fft_8point_tb
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



 module fft_8point_tb;

    // Inputs
    reg clk;
    reg reset;
    reg start;
    reg signed [7:0] in0_real, in1_real, in2_real, in3_real, in4_real, in5_real, in6_real, in7_real;
    reg signed [7:0] in0_imag, in1_imag, in2_imag, in3_imag, in4_imag, in5_imag, in6_imag, in7_imag;

    // Outputs
    wire signed [7:0] out0_real, out1_real, out2_real, out3_real, out4_real, out5_real, out6_real, out7_real;
    wire signed [7:0] out0_imag, out1_imag, out2_imag, out3_imag, out4_imag, out5_imag, out6_imag, out7_imag;
    wire ready;

    // Instantiate the Unit Under Test (UUT)
    FFT_8point uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .in0_real(in0_real), .in1_real(in1_real), .in2_real(in2_real), .in3_real(in3_real),
        .in4_real(in4_real), .in5_real(in5_real), .in6_real(in6_real), .in7_real(in7_real),
        .in0_imag(in0_imag), .in1_imag(in1_imag), .in2_imag(in2_imag), .in3_imag(in3_imag),
        .in4_imag(in4_imag), .in5_imag(in5_imag), .in6_imag(in6_imag), .in7_imag(in7_imag),
        .out0_real(out0_real), .out1_real(out1_real), .out2_real(out2_real), .out3_real(out3_real),
        .out4_real(out4_real), .out5_real(out5_real), .out6_real(out6_real), .out7_real(out7_real),
        .out0_imag(out0_imag), .out1_imag(out1_imag), .out2_imag(out2_imag), .out3_imag(out3_imag),
        .out4_imag(out4_imag), .out5_imag(out5_imag), .out6_imag(out6_imag), .out7_imag(out7_imag),
        .ready(ready)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        reset = 1;
        start = 0;
        in0_real = 8'd0; in1_real = 8'd0; in2_real = 8'd0; in3_real = 8'd0;
        in4_real = 8'd0; in5_real = 8'd0; in6_real = 8'd0; in7_real = 8'd0;
        in0_imag = 8'd0; in1_imag = 8'd0; in2_imag = 8'd0; in3_imag = 8'd0;
        in4_imag = 8'd0; in5_imag = 8'd0; in6_imag = 8'd0; in7_imag = 8'd0;

        // Apply reset
        #20;
        reset = 0;

        // Test case 1: Impulse input (real only)
        #10;
        in0_real = 8'd127; // Impulse at first sample
        start = 1;
        #10;
        start = 0;
        #50; // Wait for pipeline
        $display("Test 1 Outputs: Out0=(%d,%d), Out1=(%d,%d), Out2=(%d,%d), Out3=(%d,%d), Out4=(%d,%d), Out5=(%d,%d), Out6=(%d,%d), Out7=(%d,%d)",
                 out0_real, out0_imag, out1_real, out1_imag, out2_real, out2_imag, out3_real, out3_imag,
                 out4_real, out4_imag, out5_real, out5_imag, out6_real, out6_imag, out7_real, out7_imag);

        // Test case 2: Sinusoidal input (real only)
        #20;
        reset = 1;
        #10;
        reset = 0;
        #10;
        // Approximate a sine wave in Q1.7 format
        in0_real = 8'd0;   in1_real = 8'd90;  in2_real = 8'd127; in3_real = 8'd90;
        in4_real = 8'd0;   in5_real = -8'd90; in6_real = -8'd127; in7_real = -8'd90;
        start = 1;
        #10;
        start = 0;
        #50; // Wait for pipeline
        $display("Test 2 Outputs: Out0=(%d,%d), Out1=(%d,%d), Out2=(%d,%d), Out3=(%d,%d), Out4=(%d,%d), Out5=(%d,%d), Out6=(%d,%d), Out7=(%d,%d)",
                 out0_real, out0_imag, out1_real, out1_imag, out2_real, out2_imag, out3_real, out3_imag,
                 out4_real, out4_imag, out5_real, out5_imag, out6_real, out6_imag, out7_real, out7_imag);

        // End simulation
        #50;
        $finish;
    end

endmodule

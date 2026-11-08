`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Brandon Ayton
// 
// Create Date: 11/08/2026 01:58:14 PM
// Module Name: sseg_x4_top_tb
//////////////////////////////////////////////////////////////////////////////////

module sseg_x4_top_tb();
    reg clk;
    reg btnC;
    reg [15:0] sw;
    wire [6:0] seg;
    wire [3:0] an;
    wire dp;
    wire [4:0] JA;
    wire clkd;
    wire [3:0] data;
    wire [1:0] state;
    
    assign clkd = DUT.clkd;
    assign data = DUT.data;
    assign state = DUT.U1.current_state;

    sseg_x4_top DUT (
        .clk(clk), .btnC(btnC), .sw(sw), 
        .seg(seg), .an(an), .dp(dp), .JA(JA)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; 
        btnC = 1; 
        sw = 16'hABCD; //setting the switches to ABCD
        
        #10 btnC = 0;
        
        #10000000 $finish; 
    end
endmodule

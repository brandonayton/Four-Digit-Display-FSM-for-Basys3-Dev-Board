timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Brandon Ayton
// 
// Create Date: 11/08/2026 01:33:58 P
// Module Name: sseg_x4_top
//////////////////////////////////////////////////////////////////////////////////


module sseg_x4_top(
    input wire clk,
    input wire btnC,
    input wire [15:0] sw,
    output wire [6:0] seg,
    output wire [3:0] an,
    output wire dp,
    output wire [4:0] JA
);

    wire clkd;
    wire [3:0] digit_sel;
    wire [3:0] data;


    clk_gen U0 (
        .clk(clk), 
        .rst(btnC), 
        .clk_div(clkd)
    );


    digit_and_data_selector U1 (
        .clk(clkd), 
        .rst(btnC),
        .sw(sw),
        .digit_sel(digit_sel),
        .data(data)
    );


    sseg_display U2 (
        .seg(seg),
        .dp(dp),
        .sw(data)  
    );


    assign an = digit_sel;     
    assign JA = {clkd, digit_sel};
    assign dp = 1'b1;            

endmodule

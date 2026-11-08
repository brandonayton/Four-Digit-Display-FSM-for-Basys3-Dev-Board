`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Brandon Ayton
// 
// Create Date: 11/08/2026 02:21:14 PM
// Module Name: sseg_display
//////////////////////////////////////////////////////////////////////////////////


module sseg_display(
    input [3:0] sw,
    output reg [6:0] seg,
    output [3:0] an,
    output dp
    );
    
    assign dp = 1'b1;   
    assign an = 4'b1110;
    
    always@(sw)begin
    case(sw)
        4'h0 : seg = 7'b100_0000 ;
        4'h1 : seg = 7'b111_1001 ;
        4'h2 : seg = 7'b010_0100 ;
        4'h3 : seg = 7'b011_0000 ;
        4'h4 : seg = 7'b001_1001 ;
        4'h5 : seg = 7'b001_0010 ;
        4'h6 : seg = 7'b000_0010 ;
        4'h7 : seg = 7'b111_1000 ;
        4'h8 : seg = 7'b000_0000 ;
        4'h9 : seg = 7'b001_1000 ;
        4'hA : seg = 7'b000_1000 ;
        4'hB : seg = 7'b000_0011 ;
        4'hC : seg = 7'b010_0111 ;
        4'hD : seg = 7'b010_0001 ;
        4'hE : seg = 7'b000_0110 ;
        default : seg = 7'b000_1110 ;
     endcase
     end
 endmodule

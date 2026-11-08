`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Brandon Ayton
// 
// Create Date: 11/08/2026 01:45:32 PM
// Module Name: clk_gen
//////////////////////////////////////////////////////////////////////////////////


module clk_gen(
    input wire clk,
    input wire rst,
    output wire clk_div
    );
    
    reg [25:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 26'd0;
        end 
        else begin
            counter <= counter + 1;
        end
    end

    
    assign clk_div = counter[19];    
    
endmodule

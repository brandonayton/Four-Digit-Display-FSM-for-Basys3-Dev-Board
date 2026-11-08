`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Brandon Ayton
// 
// Create Date: 11/08/2026 02:06:21 PM
// Module Name: digit_and_data_selector
//////////////////////////////////////////////////////////////////////////////////


module digit_and_data_selector(
    input  wire clk, 
    input  wire rst,
    input  wire [15:0] sw, 
    output reg  [3:0] digit_sel, 
    output reg  [3:0] data       
);


    parameter DIGIT0 = 2'b00, 
              DIGIT1 = 2'b01, 
              DIGIT2 = 2'b10, 
              DIGIT3 = 2'b11;
    
    reg [1:0] current_state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst) 
            current_state <= DIGIT0;
        else     
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            DIGIT0: next_state = DIGIT1;
            DIGIT1: next_state = DIGIT2;
            DIGIT2: next_state = DIGIT3;
            DIGIT3: next_state = DIGIT0;
            default: next_state = DIGIT0;
        endcase
    end

    always @(*) begin
        digit_sel = 4'b1111; 
        data = 4'b0000;
        
        case (current_state)
            DIGIT0: begin
                digit_sel = 4'b1110; 
                data = sw[3:0]; 
            end
            DIGIT1: begin
                digit_sel = 4'b1101; 
                data = sw[7:4]; 
            end
            DIGIT2: begin
                digit_sel = 4'b1011; 
                data = sw[11:8]; 
            end
            DIGIT3: begin
                digit_sel = 4'b0111; 
                data = sw[15:12]; 
            end
        endcase
    end

endmodule

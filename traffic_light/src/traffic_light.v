`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 03:35:51 PM
// Design Name: 
// Module Name: traffic_light
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


module traffic_light(
    
    input clk,
    input reset_n,
    input T_A,
    input T_B,
    output  [1:0] L_A,
    output  [1:0] L_B

    );
    
    reg [1:0] L_A_reg, L_B_reg;
    reg [1:0] current_state, next_state; 
    
    
    
    
    // traffic lights
    localparam green = 2'b00;
    localparam yellow = 2'b01;
    localparam red = 2'b11;
    
    
    // states
    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;
    localparam S3 = 2'b11;
    
    
    
    always @(posedge clk, negedge reset_n) begin
    
        if(!reset_n) begin
        
            current_state <= S0;
        
        end    
        
            current_state <= next_state; 
        
    end 
    
    
    always @(*) begin
    
        case(current_state)
        
            S0: begin
                L_A_reg = green;
                L_B_reg = red;
                
                if(T_A) 
                    next_state = S0;
                else 
                    next_state = S1;   
            end
                       
            S1: begin
                L_A_reg = yellow;
                L_B_reg = red;
                
                next_state = S2;
                
            end            
            
            S2: begin
                L_A_reg = red;
                L_B_reg = green;
                
                if(T_B)
                    next_state = S2;
                else 
                    next_state = S3;      
            end
                       
            S3: begin
                L_A_reg = red;
                L_B_reg = yellow;                
                next_state = S0;
            end
              
        endcase

    end
    
    assign  L_A = L_A_reg;
    assign  L_B = L_B_reg; 

endmodule

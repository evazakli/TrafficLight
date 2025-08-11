`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 04:15:57 PM
// Design Name: 
// Module Name: traffic_light_tb
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


module traffic_light_tb;
    
    reg clk;
    reg reset_n;
    reg T_A;
    reg T_B;
    wire [1:0] L_A;
    wire [1:0] L_B;
    
    
    traffic_light_mba tb(
    
        .clk(clk),
        .reset_n(reset_n),
        .T_A(T_A),
        .T_B(T_B),
        .L_A(L_A),
        .L_B(L_B)

    );
    
    
    always begin
    
        clk = 1'b0;
        #5;
        clk = 1'b1;
        #5;
      
    end
    

    initial begin
        
        T_A = 1'b0;
        T_B = 1'b1;     
        reset_n = 1'b1;
        #1;
        reset_n = 1'b0;
        #1;
        reset_n = 1'b1;
        #3;
        T_B = 1'b0;
        #5;
        T_A = 1'b1;
        #4; 
        T_B = 1'b0;
        #5;
        T_A = 1'b0;
        #25;
        T_B = 1'b1;
        #15;
        T_B = 1'b0;
        #5;
        T_A = 1'b1;
        T_B = 1'b1;
        #20;
        T_A = 1'b0;
        #10;
        T_B = 1'b0;
         
        
    end
    
  
endmodule

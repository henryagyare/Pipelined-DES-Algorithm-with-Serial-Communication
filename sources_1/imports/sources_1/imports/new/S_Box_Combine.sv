`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 10:40:50 PM
// Design Name: 
// Module Name: S_Box_Combine
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


module S_Box_Combine(
    input logic [47:0] sboxInput,
    output logic [31:0] sboxOutput
    );
    logic [5:0] sbox1Input, sbox2Input, sbox3Input, sbox4Input, sbox5Input, sbox6Input, sbox7Input, sbox8Input; 
    logic [3:0] sbox1Output, sbox2Output, sbox3Output, sbox4Output, sbox5Output, sbox6Output, sbox7Output, sbox8Output;

    assign {sbox1Input, sbox2Input, sbox3Input, sbox4Input, sbox5Input, sbox6Input, sbox7Input, sbox8Input} = sboxInput;

    sbox1 sbox1 (
        .X(sbox1Input),
        .s_box1(sbox1Output)
    );

    sbox2 sbox2 (
        .X(sbox2Input),
        .s_box2(sbox2Output)
    );
    
    sbox3 sbox3 (
        .S_in(sbox3Input),
        .S_out(sbox3Output)
    );

    sbox4 sbox4 (
        .S_in(sbox4Input),
        .S_out(sbox4Output)
    );

    sbox5 sbox5 (
        .X(sbox5Input),
        .Y(sbox5Output)
    );

    sbox6 sbox6 (
        .X(sbox6Input),
        .Y(sbox6Output)
    );

    sbox7 sbox7 (
        .X(sbox7Input),
        .Y(sbox7Output)
    );

    sbox8 sbox8 (
        .X(sbox8Input),
        .Y(sbox8Output)
    );

    assign sboxOutput = {sbox1Output, sbox2Output, sbox3Output, sbox4Output, sbox5Output, sbox6Output, sbox7Output, sbox8Output};


endmodule

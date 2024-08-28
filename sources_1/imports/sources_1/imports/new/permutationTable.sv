`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 10:26:10 PM
// Design Name: 
// Module Name: permutationTable
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


module permutationTable(
    input logic [31:0] p_table_input,
    output logic [31:0] p_table_output
    );

assign p_table_output[31] = p_table_input[32- 16];
assign p_table_output[30] = p_table_input[32 - 7];
assign p_table_output[29] = p_table_input[32 - 20];
assign p_table_output[28] = p_table_input[32 - 21];
assign p_table_output[27] = p_table_input[32 - 29];
assign p_table_output[26] = p_table_input[32 - 12];
assign p_table_output[25] = p_table_input[32 - 28];
assign p_table_output[24] = p_table_input[32 - 17] ;

assign p_table_output[23] = p_table_input[32 - 1];
assign p_table_output[22] = p_table_input[32 - 15];
assign p_table_output[21] = p_table_input[32 - 23];
assign p_table_output[20] = p_table_input[32 - 26];
assign p_table_output[19] = p_table_input[32 - 5];
assign p_table_output[18] = p_table_input[32 - 18];
assign p_table_output[17] = p_table_input[32 - 31];
assign p_table_output[16] = p_table_input[32 - 10] ;

assign p_table_output[15] = p_table_input[32 - 2];
assign p_table_output[14] = p_table_input[32 - 8];
assign p_table_output[13] = p_table_input[32 - 24];
assign p_table_output[12] = p_table_input[32 - 14];
assign p_table_output[11] = p_table_input[32 - 32];
assign p_table_output[10] = p_table_input[32 - 27];
assign p_table_output[9] =  p_table_input[32 - 3];
assign p_table_output[8] =  p_table_input[32 - 9] ;

assign p_table_output[7] =  p_table_input[32 - 19];
assign p_table_output[6] =  p_table_input[32 - 13];
assign p_table_output[5] =  p_table_input[32 - 30];
assign p_table_output[4] =  p_table_input[32 - 6];
assign p_table_output[3] =  p_table_input[32 - 22];
assign p_table_output[2] =  p_table_input[32 - 11];
assign p_table_output[1] =  p_table_input[32 - 4];
assign p_table_output[0] =  p_table_input[32 - 25] ;

endmodule

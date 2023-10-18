`timescale 1ns/1ps
`define DELAY 10
// fpga4student.com FPGA projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for multiplier using carry-look-ahead adders
module cpu_wb_cla_multiplier (multicand, multiplier, product);
parameter MULTICAND_WID = 32;
parameter MULTIPLIER_WID = 32;

input [MULTICAND_WID-1:0] multicand;
input [MULTIPLIER_WID-1:0] multiplier;
output [(MULTICAND_WID + MULTIPLIER_WID - 1):0] product;

wire [MULTICAND_WID - 1:0] multicand_tmp [MULTIPLIER_WID-1:0];
wire [MULTICAND_WID - 1:0] product_tmp [MULTIPLIER_WID-1:0];
wire [MULTIPLIER_WID -1:0] carry_tmp;
// fpga4student.com FPGA projects, Verilog projects, VHDL projects
  genvar i, j;
generate 
 //initialize values
 for(j = 0; j < MULTIPLIER_WID; j = j + 1) begin: for_loop_j
 assign multicand_tmp[j] =  multicand & {MULTICAND_WID{multiplier[j]}};
 end
 
 assign product_tmp[0] = multicand_tmp[0];
 assign carry_tmp[0] = 1'b0;
 assign product[0] = product_tmp[0][0];
 // fpga4student.com FPGA projects, Verilog projects, VHDL projects
 for(i = 1; i < MULTIPLIER_WID; i = i + 1) begin: for_loop_i
 cpu_wb_cla_adder #(.DATA_WID(MULTIPLIER_WID)) add1 (
     // Outputs
     .sum(product_tmp[i]),
     .carry_out(carry_tmp[i]),
     // Inputs
   .carry_in(1'b0),
     .in1(multicand_tmp[i]),
     .in2({carry_tmp[i-1],product_tmp[i-1][31-:31]}));
 assign product[i] = product_tmp[i][0];
 end //end for loop
 assign product[(MULTIPLIER_WID+MULTIPLIER_WID-1):MULTIPLIER_WID] = {carry_tmp[MULTIPLIER_WID-1],product_tmp[MULTIPLIER_WID-1][31-:31]};
endgenerate
endmodule

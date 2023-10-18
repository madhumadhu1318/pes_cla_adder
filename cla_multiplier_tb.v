// Verilog project: Verilog code for multiplier using carry look ahead adder
// fpga4student.com FPGA projects, Verilog projects, VHDL projects  
module cla_multiplier_tb();
 parameter MULTICAND_WID = 32;
 parameter MULTIPLIER_WID = 32;
// fpga4student.com FPGA projects, Verilog projects, VHDL projects // /*AUTOREGINPUT*/
 // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
 reg [MULTICAND_WID-1:0] multicand; // To mul1 of cla_multiplier.v
 reg [MULTIPLIER_WID-1:0]multiplier; // To mul1 of cla_multiplier.v
 // End of automatics

 /*AUTOWIRE*/
 // Beginning of automatic wires (for undeclared instantiated-module outputs)
 wire [(MULTICAND_WID+MULTIPLIER_WID-1):0]product;// From mul1 of cla_multiplier.v
 // End of automatics

 cpu_wb_cla_multiplier mul1(/*AUTOINST*/
     // // Outputs
      .product (product[(MULTICAND_WID+MULTIPLIER_WID-1):0]),
     // // Inputs
      .multicand (multicand[MULTICAND_WID-1:0]),
     .multiplier (multiplier[MULTIPLIER_WID-1:0]));

 //initial begin
 // multicand = 16'd0;
 // multiplier = 8'd0;
 // end 
// fpga4student.com FPGA projects, Verilog projects, VHDL projects  
 integer i;
 initial begin
 for (i = 0; i < 30; i = i + 1) begin: W
  #(`DELAY) multicand = multicand + 1; multiplier = multiplier + 1;
   end
 
  #(`DELAY) //correct
  multicand = 32'h00007FFF;
  multiplier = 32'h0000007F;
 
  #(`DELAY) //correct
  multicand = 32'h00008000;
  multiplier = 32'h000000F0;
 
  #(`DELAY) //faila
  multicand = 32'h00008FF0;
  multiplier = 32'h000000F0;
 
  #(`DELAY) //correct
  multicand = 32'h00007FF0;
  multiplier = 32'h000000F7;
 
  #(`DELAY) //correct
  multicand = 32'h0000FFFF;
  multiplier = 32'h000000FF;
 end

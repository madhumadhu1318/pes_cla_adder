module cla_adder_tb();
parameter DATA_WID = 16;
// fpga4student.com FPGA projects, Verilog projects, VHDL projects 
// Verilog testbench code for carry look ahead adder
 reg carry_in; // To cla1 of cla_adder.v
 reg [DATA_WID-1:0] in1; // To cla1 of cla_adder.v
 reg [DATA_WID-1:0] in2; // To cla1 of cla_adder.v

// fpga4student.com FPGA projects, Verilog projects, VHDL projects // /*AUTOWIRE*/
 wire carry_out; // From cla1 of cla_adder.v
 wire [DATA_WID-1:0] sum; // From cla1 of cla_adder.v

// fpga4student.com FPGA projects, Verilog projects, VHDL projects // 
cla_adder cla1(/*AUTOINST*/
        //  Outputs
         .sum (sum[DATA_WID-1:0]),
         .carry_out (carry_out),
        // // Inputs
         .in1 (in1[DATA_WID-1:0]),
         .in2 (in2[DATA_WID-1:0]),
         .carry_in (carry_in));

 initial begin
  in1 = 16'd0;
  in2 = 16'd0;
  carry_in = 1'b0;
  end 
 // fpga4student.com FPGA projects, Verilog projects, VHDL projects
 initial begin
  #(`DELAY) 
  #(`DELAY)  in1 = 16'd10;
  #(`DELAY)  in1 = 16'd20;
  #(`DELAY)  in2 = 16'd10;
  #(`DELAY)  in2 = 16'd20;
  #(`DELAY)  in2 = 16'd0;
  #(`DELAY*3)  in1 = 16'hFFFF; in2 = 16'hFFFF;
  #(`DELAY*3)  in1 = 16'h7FFF; in2 = 16'hFFFF;
  #(`DELAY*3)  in1 = 16'hBFFF; in2 = 16'hFFFF;
  end 
 endmodule

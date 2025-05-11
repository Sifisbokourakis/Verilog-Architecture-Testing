module example1tb();
  
  //input registers to our instaniated module
  reg tb_a;
  reg tb_b;
  reg tb_c;
  
  //bus for writing date to the inputs
  wire [2:0] tb_dut_inputs;
  
  //this is the instantiated module example1
  //the name of the instance is dut
  example1 dut(tb_a, tb_b, tb_c);
  
  //now we create the bus that consists of three input register values
  assign tb_dut_inputs={tb_a, tb_b, tb_c};
  
  //this block is running only at the beginning of the simulation
  initial begin
    {tb_a, tb_b, tb_c}=3'b000;
    
    //the following line runs forever every 5 time units
    forever #5 {tb_a, tb_b, tb_c}=tb_dut_inputs+1;
  end // initial design

endmodule

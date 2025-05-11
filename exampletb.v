module example1tb();
  
  //input registers to our instantiated module
  reg tb_a;
  reg tb_b;
  reg tb_c;
  
  //bus for writing data to the inputs 
  wire [2:0] tb_dut_inputs;
  
  //wire for reading the output of the instatiated module
  wire tb_d;
  
  //this is the instatiated module example1.
  example1 dut(tb_a, tb_b, tb_c, tb_d);
  
  //now we create the bus that consists of three input registers values
  assign tb_dut_inputs={tb_a, tb_b, tb_c};
    
  //this block is running only at the beginning of the simulation
  initial begin
    {tb_a, tb_b, tb_c}=3'b000;
    
    //the following line runs forever every 5 time units
    forever #5 {tb_a, tb_b, tb_c}=tb_dut_inputs+1;
  end
  
endmodule

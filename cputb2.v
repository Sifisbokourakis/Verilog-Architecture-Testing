module MCPUtb();


reg reset, clk;


MCPU cpuinst (clk, reset);


initial begin
  reset=1;
  #10  reset=0;
end

always begin
  #5 clk=0; 
  #5 clk=1; 
end


/********OUR ASSEMBLER*****/

integer file, i;
reg[cpuinst.WORD_SIZE-1:0] memi;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R0  = 0; //4'b0000
parameter  [cpuinst.OPERAND_SIZE-1:0]  R1  = 1; //4'b0001
parameter  [cpuinst.OPERAND_SIZE-1:0]  R2  = 2; //4'b0010
parameter  [cpuinst.OPERAND_SIZE-1:0]  R3  = 3; //4'b0011
parameter  [cpuinst.OPERAND_SIZE-1:0]  R4  = 4; //4'b0000
parameter  [cpuinst.OPERAND_SIZE-1:0]  R5  = 5; //4'b0001
parameter  [cpuinst.OPERAND_SIZE-1:0]  R6  = 6; //4'b0010
parameter  [cpuinst.OPERAND_SIZE-1:0]  R7  = 7; //4'b0011
parameter  [cpuinst.OPERAND_SIZE-1:0]  R8  = 8; //4'b0000
parameter  [cpuinst.OPERAND_SIZE-1:0]  R9  = 9; //4'b0001
parameter  [cpuinst.OPERAND_SIZE-1:0]  R10  = 10; //4'b0010
parameter  [cpuinst.OPERAND_SIZE-1:0]  R11  = 11; //4'b0011
parameter  [cpuinst.OPERAND_SIZE-1:0]  R12  = 12; //4'b0000
parameter  [cpuinst.OPERAND_SIZE-1:0]  R13  = 13; //4'b0001
parameter  [cpuinst.OPERAND_SIZE-1:0]  R14  = 14; //4'b0010
parameter  [cpuinst.OPERAND_SIZE-1:0]  R15  = 15; //4'b0011

initial
begin

    for(i=0;i<256;i=i+1)
    begin
      cpuinst.raminst.mem[i]=0;
    end
    for(i=0l i<256; i=i+1)
    begin
      cpuinst.regfileinst.R[i]=0;    
    end 

    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R14, 8'00101100};   //2: R14=44;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R15, 8'00100111};   //2: R15=39;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R14, 8'00000100};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R15, 8'00000101};  
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LOAD_FROM_MEM, R1, 8'00000100}; 
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LOAD_FROM_MEM, R2, 8'00000101};                                                                       //do{
    
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R3, R1, R2};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_XOR, R4, R1, R2};


    
    
    file = $fopen("program.list","w");
    for(i=0;i<cpuinst.raminst.RAM_SIZE;i=i+1)
    begin
      memi=cpuinst.raminst.mem[i];
      
      $fwrite(file, "%b_%b_%b_%b\n", 
        memi[cpuinst.INSTRUCTION_SIZE-1:cpuinst.INSTRUCTION_SIZE-cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*3-1:2*cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*2-1:cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE-1:0]);
    end
    $fclose(file);
end

endmodule
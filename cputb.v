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
    for(i=0l i<16; i=i+1)
    begin
      cpuinst.regfileinst.R[i]=0;    
    end    



                                                                               //memory address: instruction
    i=0;  cpuinst.raminst.mem[0]={cpuinst.OP_SHORT_TO_REG, R0, 8'b00000000};   //0: R0=0;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R1, 8'b00000001};   //1: R1=1;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R2, 8'b00000010};   //2: R2=2;
    i=i1+;cpuinst.raminst.mem[0]={cpuinst.OP_SHORT_TO_REG, R3, 8'b00000011};   //0: R0=0;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R4, 8'b00000100};   //1: R1=1;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R5, 8'b00000101};   //2: R2=2;
    i=i+1;cpuinst.raminst.mem[0]={cpuinst.OP_SHORT_TO_REG, R6, 8'b00000110};   //0: R0=0;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R7, 8'b00000111};   //1: R1=1;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R8, 8'b00001000};   //2: R2=2;
    i=i+1;cpuinst.raminst.mem[0]={cpuinst.OP_SHORT_TO_REG, R9, 8'b00001001};   //0: R0=0;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R10, 8'b00001010};   //1: R1=1;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R11, 8'b00001011};   //2: R2=2;
    i=I+1;cpuinst.raminst.mem[0]={cpuinst.OP_SHORT_TO_REG, R12, 8'b00001100};   //0: R0=0;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R13, 8'b00001101};   //1: R1=1;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R14, 8'b00001110};   //2: R2=2;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R15, 8'b00001111};   //2: R2=2;
                                                                               //do{
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_MOV, R0, R1, 4'b0000};            //  3: R1=R0;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_MOV, R1, R2, 4'b0000};            //  4: R1=R2;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R2, R0, R1};                 //  5: R2=R0+R1;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R2, 8'b00010100};   //  6:mem[20]=R2;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LOAD_FROM_MEM, R3, 8'b00010100};  //  7:R3=mem[20];
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R0, R0, R0};                 //  8:R0=R0+R0
  
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R5, R3, R2};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_XOR, R7, R5, R1};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R8, R3, R4};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R9, R8, R7};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_XOR, R10, R7, R3};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R11, R10, R8};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_OR, R12, R10, R11};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R13, R7, R10};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_AND, R14, R12, R11};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R15, R3, R4};





                                                                               //}
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, R2, 8'b00000011};
    
    
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
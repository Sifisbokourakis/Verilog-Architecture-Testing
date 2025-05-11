module MCPU_RAMControllertb();

parameter WORD_SIZE=8;
parameter ADDR_WIDTH=8;
parameter RAM_SIZE=1<<ADDR_WIDTH;

integer i;

reg [WORD_SIZE-1:0] datawr;
reg [WORD_SIZE-1:0] addr;
reg [WORD_SIZE-1:0] instraddr;

reg we;
reg re;

wire [WORD_SIZE-1:0] datard;
wire [WORD_SIZE-1:0] instrrd;
wire [WORD_SIZE-1:0] instructionRead;
reg [WORD_SIZE-1:0] memi[RAM_SIZE-1:0];

MCPU_RAMController #(.WORD_SIZE(WORD_SIZE), .ADDR_WIDTH(ADDR_WIDTH), .RAM_SIZE(RAM_SIZE)) raminst (we, datawr, re, addr, datard, instraddr);
initial begin
    we = 1;
    re = 0;
end

always begin 
    #2 we =1;
    #2 we =0;
end
always begin
    #2 re=0;
    #2 re=1;
end
always begin 
    #2
    for (i=0; i<WORD_SIZE; i=i+1) begin
        datawr[i] = $random;
    end
    #2
    for(i=0; i<WORD_SIZE; i=i+1) begin 
        addr[i] = $random;
    end
    #2
    memi[addr] = datawr;
end

always begin 
    for (i=0; i<WORD_SIZE; i=i+1) begin 
        instraddr[i] = $random;
    end
end


endmodule

    
module MCPU_Alutb3();

parameter CMD_SIZE=2;
parameter WORD_SIZE=8;

reg [CMD_SIZE-1:0] opcode;
reg [WORD_SIZE-1:0] r1;
reg [WORD_SIZE-1:0] r2;
reg iscorrect;
wire [WORD_SIZE-1:0] out;
wire OVERFLOW;
MCPU_Alu #(.CMD_SIZE(CMD_SIZE), .WORD_SIZE(WORD_SIZE)) aluinst (opcode, r1, r2, out, OVERFLOW);

// Testbench code goes here
always begin
    #2 r1 = 4;
    #2 r1 = 4;
    #2 r1 = 3;
    #2 r1 = 9; 
end
always begin 
    #2 r2 = 4;
    #2 r2 = 4;
    #2 r2 = 3;
    #2 r2 = 9;
end

always #2 opcode[0] = $random;
always #2 opcode[1] = $random;

initial begin
  $display("@%0dns default is selected, opcode %b",$time,opcode);
end
always @ (r1 or r2) begin
    if(opcode == 2'b00) begin 
        if(r1 == 8'b00000100 && out == 8'b00000100) begin
            iscorrect = 1;
        end else if(r1 == 8'b00000011 && out == 8'b00000011) begin
            iscorrect = 1;
        end else if(r1 == 8'b00001001 && out == 8'b00001001) begin
            iscorrect = 1;
        end else begin 
            iscorrect = 0;
        end
    end else if (opcode == 2'b01) begin
        if(r1 == 8'b00000100 && out == 8'b00000100) begin
            iscorrect = 1;
        end else if(r1 == 8'b00000011 && out == 8'b00000011) begin
            iscorrect = 1;
        end else if(r1 == 8'b00001001 && out == 8'b00001001) begin
            iscorrect = 1;
        end else begin 
            iscorrect = 0;
        end
    end else if (opcode == 2'b10) begin
        if(r1 == 8'b00000100 && out == 8'b00000000) begin
            iscorrect = 1;
        end else if(r1 == 8'b00000011 && out == 8'b00000000) begin
            iscorrect = 1;
        end else if(r1 == 8'b00001001 && out == 8'b00000000) begin
            iscorrect = 1;
        end else begin 
            iscorrect = 0;
        end
    end else begin 
        if(r1 == 8'b00000100 && out == 8'b00001000) begin
            iscorrect = 1;
        end else if(r1 == 8'b00000011 && out == 8'b00000110) begin
            iscorrect = 1;
        end else if(r1 == 8'b00001001 && out == 8'b00010010) begin
            iscorrect = 1;
        end else begin 
            iscorrect = 0;
        end
    end
end


endmodule
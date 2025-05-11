module MCPU_Alutb2();

parameter CMD_SIZE=2;
parameter WORD_SIZE=2;

reg [CMD_SIZE-1:0] opcode;
reg [WORD_SIZE-1:0] r1;
reg [WORD_SIZE-1:0] r2;
reg iscorrect;
wire [WORD_SIZE-1:0] out;
wire OVERFLOW;
MCPU_Alu #(.CMD_SIZE(CMD_SIZE), .WORD_SIZE(WORD_SIZE)) aluinst (opcode, r1, r2, out, OVERFLOW);

// Testbench code goes here
always #2 r1[0] = $random;
always #2 r2[0] = $random;
always #2 r1[1] = $random;
always #2 r2[1] = $random;

always #2 opcode[0] = $random;
always #2 opcode[1] = $random;

initial begin
  $display("@%0dns default is selected, opcode %b",$time,opcode);
end
always @ (r1 or r2) // I have to chang the always block to refresh each time something happens (maybe the inputs) (maybe the inputs and output) and i have to modify the check proccess to some extend
    begin
        if ( opcode == 2'b00) begin 
                if (r1 == 2'b11 && r2 == 2'b11 && out == 2'b11)  begin
                    iscorrect = 1;
                end else if (((r1 == 2'b10 && r2 == 2'b10) || (r1 == 2'b10 && r2 == 2'b11) || (r1 == 2'b11 && r2 == 2'b10) ) && out == 2'b10) begin
                    iscorrect = 1;
                end else if (((r1 == 2'b01 && r2 == 2'b01) || (r1 == 2'b01 && r2 == 2'b11) || (r1 == 2'b11 && r2 == 2'b01)) && out == 2'b01) begin 
                    iscorrect = 1;
                end else if (((r1 == 2'b00 && r2 == 2'b00) || (r1 == 2'b00 && r2 == 2'b01) || (r1 == 2'b00 && r2 == 2'b10) || (r1 == 2'b00 && r2 == 2'b11) || (r1 == 2'b01 && r2 == 2'b00) || (r1 == 2'b01 && r2 == 2'b10) || (r1 == 2'b10 && r2 == 2'b00) || (r1 == 2'b10 && r2 == 2'b01) || (r1 == 2'b11 && r2 == 2'b00)) && out == 2'b00) begin
                    iscorrect = 1;
                end else begin
                    iscorrect = 0;
                end
        end else if ( opcode == 2'b01) begin 
                if (r1 == 2'b00 && r2 == 2'b00 && out == 2'b00) begin
                    iscorrect = 1;
                end else if (((r1 == 2'b00 && r2 == 2'b01) || (r1 == 2'b01 && r2 == 2'b00) || (r1 == 2'b01 && r2 == 2'b01)) && out == 2'b01) begin
                    iscorrect = 1;
                end else if(((r1 == 2'b00 && r2 == 2'b10) || (r1 == 2'b10 && r2 == 2'b00) || (r1 == 2'b10 && r2 == 2'b10) ) && out == 10) begin 
                    iscorrect = 1;
                end else if((r1 == 2'b11 || r2 == 2'b11 || (r1 == 2'b01 && r2 == 2'b10) || (r1 == 2'b10 && r2 == 2'b01)) && out == 2'b11) begin 
                    iscorrect = 1;
                end else begin
                    iscorrect = 0;
                end 
        end else if (opcode == 2'b10) begin
                if (r1 == r2 && out == 2'b00) begin 
                    iscorrect = 1;
                end else if (((r1 == 2'b00 && r2 == 2'b01) || (r1 == 2'b01 && r2 == 2'b00) || (r1 == 2'b10 && r2 == 2'b11) || (r1 == 2'b11 && r2 == 2'b10)) && out == 2'b01) begin
                    iscorrect = 1;
                end else if (((r1 == 2'b00 && r2 == 2'b10) || (r1 == 2'b01 && r2 == 2'b11) || (r1 == 2'b10 && r2 == 2'b00) || (r1 == 2'b11 && r2 == 2'b01)) && out == 2'b10) begin
                    iscorrect = 1;
                end else if (((r1 == 2'b00 && r2 == 2'b11) || (r1 == 2'b01 && r2 == 2'b10) || (r1 == 2'b10 && r2 == 2'b01) || (r1 == 2'b11 && r2 == 2'b00)) && out == 2'b11) begin
                    iscorrect = 1;
                end else begin 
                    iscorrect = 0;
                end
        end else begin 
                if (((r1 == 2'b00 && 2'b00) || (r1 == 2'b01 && r2 == 2'b11) || (r1 == 2'b10 && r2 == 2'b10) || (r1 == 2'b11 && r2 == 2'b01)) && out == 2'b00) begin
                    iscorrect = 1;
                end else if (((r1 == 2'b00 && r2 == 2'b01) || (r1 == 2'b01 && r2 == 2'b00) || (r1 == 2'b10 && r2 == 2'b11) || (r1 == 2'b11 && r2 == 2'b10)) && out == 2'b01) begin 
                    iscorrect = 1;
                end else if (((r1 == 2'b00 && r2 == 2'b10) || (r1 == 2'b01 && r2 == 2'b01) || (r1 == 2'b10 && r2 == 2'b00) || (r1 == 2'b11 && r2 == 2'b11)) && out == 2'b10) begin
                    iscorrect = 1;
                end else if (((r1 == 2'b00 && r2 == 2'b11) || (r1 == 2'b01 && r2 == 2'b10) || (r1 == 2'b10 && r2 == 2'b01) || (r1 == 2'b11 && r2 == 2'b00)) && out == 2'b11) begin 
                    iscorrect = 1;
                end else begin 
                    iscorrect = 0;
                end 
        end  
    end
                    

endmodule


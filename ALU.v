`timescale 1ns / 1ps

module ALU(
    input [7:0] a,
    input [7:0] b,
    input [2:0] opcode,
    output reg [7:0] result,
    output wire zero//zero-flag
    );
    
    always @(*) begin
    case(opcode)
    3'b000: result= a+b;
    3'b001: result= a-b;
    3'b010: result= a&b;
    3'b011:result=a|b;
    3'b100:result= a^b;
    3'b101: result=a<<b;
    3'b110: result=a>>b;
    3'b111: result=(a<b) ? 8'd1: 8'd0;
    default: result=8'd0;
    endcase
        //implement zero flag logic
       end    
         assign zero = (result==8'd0) ? 1'b1:1'b0;
endmodule

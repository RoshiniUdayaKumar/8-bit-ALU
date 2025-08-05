`timescale 1ns / 1ps
module ALU_tb;
  
logic [7:0] a;
logic [7:0] b;
logic [2:0] opcode;
logic [7:0] result;
logic zero; 
  
 //module instantiation
  ALU DUT(a,b,opcode,result,zero);
  
//functional coverage 
 covergroup cg;     
 option.per_instance=1;
    coverpoint a{
      bins a0={[0:50]};
      bins a1={[51:100]};
      bins a2={[101:150]};
      bins a3={[151:200]};
      bins a4={[201:255]}
    ;}  
       
   coverpoint b{
     bins b0={[0:50]};
     bins b1={[52:100]};
     bins b2={[101:150]};
     bins b3={[151:200]};
     bins b4={[201:255]} 
    ;}
    
   coverpoint zero{
    bins z0={1};
    bins z1={0};
   }
 
   endgroup
    cg cg_inst=new;
  
    initial begin
      //covergroup instantiation
     
    //applying stimulus
    a=8'd10; 
    b=8'd10; 
    opcode=3'b000;  //ADD operation
    cg_inst.sample();


    #10;
    a=8'd210;
    b=8'd89; 
    opcode=3'b001;//SUB operation
   cg_inst.sample();

    #10;
    a=8'd100; 
    b=8'd50; 
    opcode=3'b010;  //AND operation
  cg_inst.sample();

    #10;
    a=8'd69; 
    b=8'd180; 
    opcode=3'b011;  //OR operation
   cg_inst.sample();

    #10;
    a=8'd10; 
    b=8'd15; 
    opcode=3'b100;  //XOR operation
   cg_inst.sample();

    #10;
    a=8'd200; 
    b=8'd2; 
    opcode=3'b101;  //SLL operation
   cg_inst.sample();

    #10;
    a=8'd2; 
    b=8'd100; 
    opcode=3'b110;  //SRL operation
    cg_inst.sample();

    #10;
   a=8'd10; 
    b=8'd69; 
    opcode=3'b111;  //SLT operation
   cg_inst.sample();

    end
  
  //print the waveforms
 /*initial begin
  $dumpfile("dump.vcd");
  $dumpvars;    
  end*/
  
endmodule

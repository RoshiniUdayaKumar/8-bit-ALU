`timescale 1ns / 1ps

class sample;
rand logic [7:0] a;
rand logic [7:0] b;
rand logic [2:0] opcode;
endclass

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
   
   coverpoint opcode{
     bins o0={3'b000,3'b001}; //arithemtic op
     bins o1={3'b010, 3'b011, 3'b100};
     bins o2={3'b101, 3'b110, 3'b111};  
   }
    
   coverpoint zero{
    bins z0={1};
    bins z1={0};
   } 
   
   //cross coverage
   endgroup
  

    cg cg_inst=new; //covergroup instantiation
     
  
    initial begin
     //class instantiation 
sample obj=new;

      repeat(10) begin
        obj.randomize(); //class variables are randomized
        a=obj.a;  //connecting DUT to class variables 
        b=obj.b;
        opcode=obj.opcode;
        #1; //give time to update the output

      cg_inst.sample();
 
        $display("Random values of a:%0d, b:%0d, opcode:%0b, zero:%0d", a,b,opcode,zero);  

      end
    end
  
  //print the waveforms
 initial begin
  $dumpfile("dump.vcd");
  $dumpvars;    
  end
  
endmodule

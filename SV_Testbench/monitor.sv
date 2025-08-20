class monitor;
  //virtual interface
    virtual intf v_intf;
  
  //create a mailbox btw monitor and sb
  mailbox mon2sb;
  
  //create transaction instance 
 alu_transaction txn;
  
//functional coverage 
 covergroup cg;     
 option.per_instance=1;
    coverpoint txn.a{
      bins a0={[0:50]};
      bins a1={[51:100]};
      bins a2={[101:150]};
      bins a3={[151:200]};
      bins a4={[201:255]}
    ;}  
       
   coverpoint txn.b{
     bins b0={[0:100]};
     bins b1={[101:200]};
     bins b2={[201:255]} 
    ;}
    
   coverpoint txn.zero{
    bins z0={1};
    bins z1={0};
   }
   
     coverpoint txn.opcode{
     bins o0={3'b000,3'b001}; //arithemtic op
     bins o1={3'b010, 3'b011, 3'b100};
     bins o2={3'b101, 3'b110, 3'b111};  
   }
   
   //cross coverage 
  //cross txn.a, txn.b, txn.opcode;
 
   endgroup
  
     
  //constructor 
  function new(virtual intf v_intf, mailbox mon2sb);
    this.v_intf=v_intf;
    this.mon2sb=mon2sb;
    //create covergroup instance
    cg=new();
  endfunction 
  
  task run();
    repeat(10) begin

    txn=new();
      #20;  //allow DUT to process values
    
      //take values from virtual interface to actual interface 
     txn.a=v_intf.a;
     txn.b= v_intf.b;
    txn.opcode =v_intf.opcode;
     txn.result=v_intf.result;
     txn.zero=v_intf.zero;
      
      //trigger the coverage 
      cg.sample();
      
      $display("Monitored values for a:%0d, b:%0d, opcode:%0b, zero:%0b, result:%0d", txn.a, txn.b, txn.opcode,txn.zero,txn.result);
      
      //put the data to scoreboard 
      mon2sb.put(txn);
      
    end
  endtask
  
endclass

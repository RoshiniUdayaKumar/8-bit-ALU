class driver;

  //virtual interface 
  virtual intf v_intf;
  
 //transaction instance 
  alu_transaction txn;
  
  
  //mailbox creation 
  mailbox gen2drv;
  
  //constructor 
  function new( virtual intf v_intf,mailbox gen2drv);
    this.v_intf=v_intf;
    this.gen2drv=gen2drv;
  endfunction
    
    task run();
      txn=new();
      repeat(10) begin
        gen2drv.get(txn);  //get the values from mailbox to driver 
      
      //connecting virtual interface to interface 
      v_intf.a= txn.a;
      v_intf.b=txn.b;
      v_intf.opcode=txn.opcode;
        
        $display("Driving values for a:%0d, b:%0d, opcode:%0b", txn.a, txn.b, txn.opcode);
        #20;
      end   
    endtask
  
endclass
    
    

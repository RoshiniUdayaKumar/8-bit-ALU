class generator;
  
  //create transaction instance
  alu_transaction txn;
  
  //create a mailbox-->we use the same mailbox throughout
  mailbox gen2drv;
  
  //constructor 
  function new(mailbox gen2drv);
    this.gen2drv=gen2drv;   
  endfunction
  
  task run();
      repeat(10) begin 
        txn=new();
      txn.randomize();
      $display("Generated random values of a:%0d, b:%0d, opcode:%0b", txn.a,txn.b,txn.opcode);
      gen2drv.put(txn);  //put to mailbox
    end
   endtask
endclass
  

//include all the components 

`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"

class environment;

  //create instance for components
  generator gen;
  driver drv;
  monitor mon;
  
  //mailbox handles 
  mailbox gen2drv;
  mailbox mon2sb;
  
  //virtual interface
  virtual intf v_intf;
  
  //constructor
function new( virtual intf v_intf);
    this.v_intf=v_intf;
  
  //creating mailboxes  
  gen2drv=new();
  mon2sb=new();
  
  //component instantiation
  gen =new(gen2drv);
  drv=new(v_intf,gen2drv);
  mon=new(v_intf, mon2sb);  
  endfunction
  
  //run tasks
  task test();
    fork  //will parallely run all the components 
    gen.run();
    drv.run();
    mon.run();
    join
  endtask
  
  
endclass

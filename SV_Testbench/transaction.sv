class alu_transaction; 
  //declare rand for inputs 
randc logic [7:0] a;
randc logic [7:0] b;
randc logic [2:0] opcode;
  
  //output
logic [7:0] result;
logic zero;
  
  //adding constraint 
  constraint cons_name {opcode inside {[3'b000:3'b111]};}
  
  function void post_randomize();
    $display("Random transaction values of a:%0d, b:%0d, opcode:%0b", a,b,opcode);
  endfunction
  
endclass

`include "interface.sv"
`include "environment.sv"
`timescale 1ns/1ps

module ALU_tb();
  
  //interface instance
  intf alu_intf();
  
  //environment instantiation 
  environment env;
  
  //DUT instance, interface signals are connected to the DUT ports
  ALU DUT (
    .a(alu_intf.a),
    .b(alu_intf.b),
    .opcode(alu_intf.opcode),
    .result(alu_intf. result),
    .zero(alu_intf.zero)
   );
  
  //print waveforms
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars; 
  end
    
  //test execution
  initial begin 
    env=new(alu_intf);
    env.test();
    
    #200;
    $finish();
  end
endmodule

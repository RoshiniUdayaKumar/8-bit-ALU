<h2> Design and Verification of a 8-bit-ALU </h2>

ALU, abbreviated as arithmetic and logical unit. It used to perform operations on operands. 
It is an essential component of the CPU. 

<h3>Signal list</h3>
- 2 8-bit inputs (a,b)
-3-bit pcode (to select the operation)
-8-bit result (to store the result of the operation)
-1-bit zero flag(useful for conditional brnaching in CPU)

<h3>ALU Operations</h3>
ADD- addition
SUB- subtraction
OR- bitwise OR
AND- bitwise AND
XOR- bitwise XOR
SLL- shift left logical
SRL- shift right logical
SLT- set less than

Why dint i include -->MUL and DIV
Multiplication and division are more complex to integrate into a basic ALU. They are usually present on a separate unit called an MDU (multiplier-division unit). They take more than 1 clock cycle to execute. So our goal is just to design a basic 8-bit, 3-bit opcode ALU. 

<h3>OPERATION ENCODING</h3> 
3'b000-->ADD
3'b001-->SUB
3'b010-->AND
3'b011-->OR
3'b100-->XOR
3'b101-->SLL
3'b110-->SRL
3'b111-->SLT

PROCEDURE:
Design file (Alu.v)-->DONE
TB file (include all TB components)
Coverage 
Assertions 
Simulation 
Synthesis 
Calculating set-up and hold time

TOOLS USED: Xilinx Vivado

VERILOG CODING
Follow-up questions-
1. what is the purpose of zero flag?
Zero-flag is used to indicate a result 0. It is helpful in conditional branching. (WKT when result=0, it takes a branch in CPU architecture, this flag helps in that)

VERIFICATION 
First Approach- Linear testbench
Step 1:Checking dedicated values for a and b with all opcode values. 
Step 2:Adding coverage

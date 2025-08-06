
## Design and Verification of an 8-bit ALU

### 🧠 Overview

The Arithmetic Logic Unit (ALU) is a fundamental building block of the CPU, responsible for executing arithmetic and logic operations. 

### 📶 Signal Description

* **`a`, `b`**: 8-bit input operands
* **`opcode`**: 3-bit control signal to select the operation
* **`result`**: 8-bit output for the result
* **`zero`**: 1-bit flag set when the result is zero (useful for conditional branching in CPU architecture)


### 🔢 Supported ALU Operations

| Opcode | Operation | Description         |
| ------ | --------- | ------------------- |
| 000    | ADD       | Addition            |
| 001    | SUB       | Subtraction         |
| 010    | AND       | Bitwise AND         |
| 011    | OR        | Bitwise OR          |
| 100    | XOR       | Bitwise XOR         |
| 101    | SLL       | Shift Left Logical  |
| 110    | SRL       | Shift Right Logical |
| 111    | SLT       | Set if Less Than    |

> **Why MUL and DIV are not included:**
> Multiplication and division operations are computationally more intensive and usually require multiple clock cycles. These operations are often implemented separately in a **Multiply-Divide Unit (MDU)** and not part of a basic ALU design.

### 🧰 Tools Used

* **Design & Simulation:** Xilinx Vivado, EDA Playground (Simulator- Aldec Rivera Pro)
* **Language:** Verilog and SystemVerilog

### 🧪 Verification Strategy

The verification approach is quite straightforward. 

<h3>1. Linear Testbench </h3>
Initially, I used hardcoded values for inputs (a,b, and opcode) and ran functional coverage. 

Limitations: This method does not cover corner cases, and covering all combinations of input values manually is time-consuming. Thus, leading to an inefficient testbench.

> Coverage achieved = 80%

<h3>2. Constarint Random Testbench</h3>
For this approach, I used SystemVerilog random keyword (rand/randc) and the .randomize() method to generate random values for inputs. 

Advantages: Corner cases were covered, and boundary values were reached.  

> Coverage achieved 95%

<h3>3. System Verilog Testbench Environment</h3>
I developed all the TB components of SystemVerilog - Generator, Driver, Monitor, and scoreboard. This method proves to be the most robust verification approach. 

Files included -

interface.sv (module) -->bundles all the signals.

transaction.sv (class) --> declares all the signals that have to be randomized. Can include constraints in a transaction block.

generator.sv (class) -->takes transaction items, randomizes them, creates a mailbox, and puts the random values into the mailbox using mailbox put method.

driver.sv (class) -->takes random values from mailbox and drives them to DUT via the interface. Need to create a virtual interface handle so that it can communicate with all TB components.

monitor.sv (class) -->monitors the output from the DUT passively without disturbing the functionality of the DUT. Puts these output values to mailbox. 

scoreboard.sv (class) -->takes output of DUT from mailbox and compares it with expected output values.

environment.sv (class) -->encapsulates all TB components such as transaction, generator, driver, monitor and scoreboard

testbench.sv(class) --> top most file, that includes environment and interface. 

> Coverage achieved =100%

### 🚀 Scope for Improvement 

1. Adding assertions - to validate the behaviour of the design.

2. Adding comparison logic to the scoreboard. 



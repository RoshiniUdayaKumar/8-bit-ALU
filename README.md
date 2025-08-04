
## 🔧 Design and Verification of an 8-bit ALU

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

**Initial Approach: Linear Testbench**

* **Step 1:** Apply hard-coded values to inputs `a` and `b`, and verify functionality across all opcodes.
* **Step 2:** Add functional coverage to ensure all ALU operations and see why this method isnt best one to approach verification. 




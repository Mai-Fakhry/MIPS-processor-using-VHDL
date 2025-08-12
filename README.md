# ⚙️ MIPS Processor Using VHDL

This repository contains the VHDL implementation of a **MIPS (Microprocessor without Interlocked Pipeline Stages)** processor, developed as part of the **Logic Design and Computer Organization** course at the Faculty of Engineering – Ain Shams University (CSE221, UG2023).

The project implements a fully functional MIPS processor capable of executing a variety of instructions — from arithmetic and logic to memory access and control flow — using a modular design for the datapath, control unit, and memory interface.

---

## 🛠️ Processor Components

### 1. **Control Unit**

* **ALU Decoder (ALUdec)** – decodes function and opcode fields to generate ALU operation signals.
* **Main Control Decoder** – interprets opcodes to control register writes, ALU source selection, and memory operations.

### 2. **Datapath**

* Multiplexers for selecting data sources.
* Adders for computing branch and jump targets.
* Shift-left and sign extension units.
* ALU for arithmetic/logical operations.
* Register file for operand storage and result writing.

### 3. **MIPS Module**

* Connects the datapath and control unit.
* Bridges instruction decoding and execution stages.

### 4. **Top Module**

* Integrates MIPS module with instruction memory and data memory.
* Provides ports for testbench connection.

---

## 🧪 Testing

A **VHDL Test Bench** was used to validate functionality:

* Loads instructions from `memfile.dat` into instruction memory.
* Simulates clock and reset signals.
* Checks correct execution by monitoring `memwrite`, `dataadr`, and `writedata`.
* Expected outcome: store the value `7` at memory address `0x54` (decimal 84).

Example testbench process:

```vhdl
if (clk'Event and clk = '0' and memwrite = '1') then  
    if (dataadr = x"00000054" and writedata = x"00000007") then 
        report "Test Successful"; 
    end if; 
end if; 
```

---

## 📂 Project Structure

```
MIPS-processor-using-VHDL/
├── control_unit/           # ALU Decoder & Main Control Decoder
├── datapath/               # ALU, Register File, MUXes, Adders, etc.
├── mips/                   # MIPS module
├── top/                    # Top-level integration
├── testbench/              # Test Bench and memfile.dat
└── README.md
```

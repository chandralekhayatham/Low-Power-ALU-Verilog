# Low-Power-ALU-Verilog
Low-Power Arithmetic Logic Unit (ALU) Design using Verilog HDL featuring arithmetic, logical, shift, and compare operations with operand isolation, enable-based low-power control, flag generation, RTL verification, and synthesis-ready implementation.
# ⚡ Low-Power ALU Design using Verilog HDL

## 📌 Overview

This project implements a Low-Power Arithmetic Logic Unit (ALU) using Verilog HDL. The ALU performs arithmetic, logical, shift, increment, decrement, and comparison operations while incorporating low-power design concepts such as operand isolation and enable-based control.

The project demonstrates important VLSI concepts including RTL Design, Digital Logic Design, FPGA Design Flow, Verification, and Low-Power Techniques.

---

## 🎯 Project Objective

To design and verify a low-power ALU capable of:

- Arithmetic Operations
- Logical Operations
- Shift Operations
- Comparison Operations
- Flag Generation
- Operand Isolation
- Low-Power Control Logic

---

## 🏗 Architecture

```text
Operand A
Operand B
Opcode
Enable
Low-Power Mode
      │
      ▼
 ┌──────────────┐
 │ Low-Power    │
 │ ALU Control  │
 └──────────────┘
      │
      ▼
Arithmetic Unit
Logic Unit
Shift Unit
Compare Unit
      │
      ▼
Result Output
      │
      ▼
Flags
(Z,C,V,N)
```

---

## ⚙️ ALU Operations

| Opcode | Operation |
|----------|-----------|
| 0000 | ADD |
| 0001 | SUB |
| 0010 | AND |
| 0011 | OR |
| 0100 | XOR |
| 0101 | NOT |
| 0110 | Shift Left |
| 0111 | Shift Right |
| 1000 | Increment |
| 1001 | Decrement |
| 1010 | Compare |

---

## 🚩 Flags

| Flag | Description |
|--------|------------|
| Zero (Z) | Result equals zero |
| Carry (C) | Carry generated |
| Overflow (V) | Arithmetic overflow |
| Negative (N) | MSB is 1 |

---

## 🔋 Low-Power Features

### Operand Isolation

When enable signal is OFF:

```text
A = 0
B = 0
```

This prevents unnecessary switching activity.

### Enable-Based Control

The ALU computes only when:

```text
enable = 1
```

This reduces dynamic power consumption.

---

## 📂 Project Structure

```text
Low-Power-ALU-Verilog/

├── rtl/
│   ├── alu.v
│   └── adder.v

├── tb/
│   └── alu_tb.v

├── constraints/
│   └── alu.xdc

├── simulation/

├── waveforms/

├── reports/

├── images/

├── docs/

├── scripts/
│   └── synth.ys

├── README.md

└── .gitignore
```

---

## 🛠 Tools Used

- Verilog HDL
- ModelSim
- Vivado
- GTKWave
- Yosys

---

## ▶️ Simulation Steps

### Icarus Verilog

Compile:

```bash
iverilog -o alu_sim rtl/adder.v rtl/alu.v tb/alu_tb.v
```

Run:

```bash
vvp alu_sim
```

Open Waveform:

```bash
gtkwave waves.vcd
```

---

### ModelSim

Compile:

```bash
vlog rtl/adder.v
vlog rtl/alu.v
vlog tb/alu_tb.v
```

Run:

```bash
vsim alu_tb
run -all
```

---

## 📊 Expected Results

| Opcode | Result |
|----------|---------|
| ADD | A + B |
| SUB | A - B |
| AND | A & B |
| OR | A \| B |
| XOR | A ^ B |
| NOT | ~A |
| SHL | A << 1 |
| SHR | A >> 1 |
| INC | A + 1 |
| DEC | A - 1 |
| COMPARE | 1 / 0 / 255 |

---

## 📸 Screenshots Checklist

- RTL Code
- Testbench Code
- Opcode Table
- Simulation Run
- Waveform Output
- Flag Verification
- Synthesis Report
- Utilization Report
- Power Report
- GitHub Repository

---

## 🌍 Applications

- CPUs
- Microcontrollers
- DSP Processors
- Embedded Systems
- IoT Devices
- AI Accelerators

---

## 🚀 Future Enhancements

- 16-bit / 32-bit ALU
- Clock Gating
- Carry Look-Ahead Adder
- Pipelined ALU
- FPGA Hardware Testing
- Power Analysis using Vivado

---

## 🎓 Learning Outcomes

- Verilog HDL
- RTL Design
- Low-Power VLSI Concepts
- FPGA Design Flow
- Verification & Debuggig

B.Tech Computer Science and Engineering

VLSI Design Project

---

⭐ If you found this project useful, please star the repository.

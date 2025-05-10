# Verilog Lab Practice

This repository contains Verilog modules and testbenches developed for digital design lab practice. The goal is to reinforce concepts like register files, RAMs, and simulation workflows using Verilog HDL.

## 🛠 Tools

- **Verilog HDL**
- **Icarus Verilog** – for compiling and simulating
- **GTKWave** – for waveform viewing

## ▶️ How to Run

### 1. Compile the Testbench

```bash
iverilog -o out.vvp tb_name.v
````

### 2. Run the Simulation

```bash
vvp out.vvp
```

### 3. Add VCD Dump to Testbench

Add the following inside the `initial` block of your testbench:

```verilog
$dumpfile("name.vcd");
$dumpvars(0, tb);
```

### 4. View the Waveform

```bash
gtkwave name.vcd
```

## 📚 Purpose

This code was written as part of lab final preparation, focusing on practicing core Verilog concepts through hands-on implementation and simulation.

# Verilog Lab Practice

This repository contains Verilog modules and testbenches developed for digital design lab practice. The goal is to reinforce concepts like register files, RAMs, and simulation workflows using Verilog HDL.

## 🧪 Modules

- `reg_file_32bit.v`: 32-bit register file with two read ports and one write port.
- `ram_mem_32bit.v`: 32-location, 32-bit wide synchronous RAM.
- `tb.v`: Testbenches for verifying functionality of the above modules.

## 🛠 Tools

- **Verilog HDL**
- **Icarus Verilog** – for compiling and simulating
- **GTKWave** – for waveform viewing

## ▶️ How to Run

1. **Compile the testbench:**
   ```bash
   iverilog -o tb.vvp tb.v
````

2. **Run the simulation:**

   ```bash
   vvp tb.vvp
   ```

3. **View waveform:**

   ```bash
   gtkwave reg_file.vcd
   ```

## 📚 Purpose

This code was written as part of lab final preparation, focusing on practicing core Verilog concepts through hands-on implementation and simulation.

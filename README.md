# FSM-Based Vending Machine Controller on FPGA

*A structural hardware design utilizing a partitioned Datapath and Finite State Machine, implemented in Verilog.*

##  Project Overview
This repository contains the Register Transfer Level (RTL) design, testbench simulation, and physical hardware mapping for a digital vending machine controller. The system is designed for the **Altera DE2 FPGA board (Cyclone II)** using Intel Quartus II.

To ensure a robust and scalable architecture, the design strictly separates the arithmetic logic from the control logic using a **Partitioned Datapath and Control Unit** methodology.

##  System Architecture

### 1. The Datapath Unit (`datapath.v`)
Handles all arithmetic operations, data routing, and memory storage.
* **Coin Multiplexer:** Decodes physical switch inputs into 8-bit binary values (5¢, 10¢, 25¢).
* **Accumulator Register:** Stores the running total of inserted funds, updating strictly on the positive edge of the 50MHz clock.
* **Price Comparator:** Continuously compares the current total against the target price (45¢) and flags the Control Unit when the threshold is met.

### 2. The FSM Control Unit (`fsm_controller.v`)
A standard Moore/Mealy Finite State Machine that acts as the decision-making brain of the system.
* **COUNTING State:** Waits for user inputs. Transitions when the Datapath signals `total_reached`.
* **DISPENSE State:** Asserts the `dispense` output, triggers the change calculator, and resets the Datapath accumulator to 0 before returning to the COUNTING state.

### 3. Top-Level Integration (`vending_top.v`)
Wires the Datapath and FSM together and includes a combinational subtraction block to dynamically calculate exact change out.

---

##  Hardware Implementation (Altera DE2)
The design is mapped to physical components on the Altera DE2 board via the `vending_machine.qsf` file.

| I/O Port | Board Component | Description |
| :--- | :--- | :--- |
| `clk` | 50MHz Oscillator | Main system clock (PIN_N2) |
| `rst` | KEY[0] | Asynchronous active-high reset |
| `coin_5c` | SW[0] | Insert 5¢ (Toggle Switch) |
| `coin_10c` | SW[1] | Insert 10¢ (Toggle Switch) |
| `coin_25c` | SW[2] | Insert 25¢ (Toggle Switch) |
| `dispense`| LEDG[0] | Green LED indicating product drop |
| `change` | LEDR[7:0] | Red LEDs displaying binary change value |

---

##  Repository Structure
```text
fpga-vending-machine/
├── docs/                   # Block diagrams and simulation waveforms (Add your images here!)
├── rtl/                    # Synthesizable Verilog source code
│   ├── datapath.v
│   ├── fsm_controller.v
│   └── vending_top.v
├── sim/                    # Testbenches for ModelSim verification
│   └── tb_vending_top.v
└── quartus/                # Quartus II project and pin assignment files
    ├── vending_machine.qpf
    └── vending_machine.qsf

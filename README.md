# FPGA Vending Machine Controller

## Overview

This project implements a vending machine controller on FPGA using Verilog HDL. The design follows a partitioned architecture consisting of a Datapath Unit and an FSM-based Control Unit, demonstrating core digital design concepts including finite state machines, combinational logic, sequential logic, module integration, simulation, and FPGA implementation.

The vending machine accepts 5-cent, 10-cent, and 25-cent coin inputs. Once the accumulated amount reaches or exceeds 45 cents, the controller dispenses the product and returns any remaining change.

---

## Features

* FSM-based transaction control
* Datapath and Control Unit partitioning
* Coin denomination decoding
* Coin accumulation and balance tracking
* Threshold comparison logic
* Automatic product dispensing
* Change calculation
* Coin insertion counting
* RTL simulation and waveform verification
* FPGA synthesis and implementation using Intel Quartus

---

## System Architecture

```text
                +----------------+
Coin Inputs --->|    coin_mux    |
                +----------------+
                         |
                         v
                +----------------+
                |    datapath    |
                +----------------+
                         |
                         v
                +----------------+
                |   comparator   |
                +----------------+
                         |
                         v
                +----------------+
                | fsm_controller |
                +----------------+
                         |
                         v
                     Dispense

Coin Inputs -------------------->
                +----------------+
                | coin_counter   |
                +----------------+
```

---

## RTL Modules

### datapath.v

Responsible for:

* Coin value accumulation
* Current balance storage
* Integration with comparator logic

### fsm_controller.v

Implements the vending machine finite state machine.

States:

* COUNTING
* DISPENSE

Responsibilities:

* Transaction sequencing
* Dispense control
* Datapath reset control

### coin_mux.v

Decodes coin inputs into corresponding monetary values.

### comparator.v

Determines whether the accumulated balance has reached the product price threshold.

### coin_counter.v

Counts the number of inserted coins during operation.

### vending_top.v

Top-level integration module connecting datapath and control subsystems.

---

## FSM State Diagram

```text
                total_reached
      +----------------------------+
      |                            |
      v                            |
+-------------+            +-------------+
|  COUNTING   |----------->|  DISPENSE   |
+-------------+            +-------------+
                                  |
                                  |
                                  +----> COUNTING
```

### COUNTING

* Accepts coin inputs
* Updates accumulated balance
* Monitors purchase threshold

### DISPENSE

* Dispenses product
* Calculates change
* Clears accumulator
* Returns to COUNTING state

---

## Simulation

Simulation verifies:

* Coin insertion handling
* Balance accumulation
* Threshold detection
* FSM state transitions
* Dispensing behavior
* Change calculation

Example purchase sequence:

```text
Insert 25c
Insert 10c
Insert 10c

Total = 45c

→ Dispense product
→ Change = 0c
```

---

## FPGA Implementation

Target Platform:

* Altera DE2 Development Board

Toolchain:

* Intel Quartus Prime

Implementation Flow:

1. RTL Design
2. Functional Simulation
3. Synthesis
4. Fitting
5. Timing Analysis
6. FPGA Programming
7. Hardware Verification

---

## Repository Structure

```text
fpga-vending-machine/
│
├── rtl/
│   ├── vending_top.v
│   ├── datapath.v
│   ├── fsm_controller.v
│   ├── coin_mux.v
│   ├── comparator.v
│   └── coin_counter.v
│
├── tb/
│   └── vending_machine_tb.v
│
├── docs/
│   ├── waveform.png
│   
│   
│
└── README.md
```

---

## Learning Objectives

This project was developed to explore:

* Finite State Machine (FSM) design
* Datapath and control partitioning
* RTL development in Verilog
* FPGA synthesis and implementation flows
* Digital system integration and verification
* Hardware-oriented design methodologies

```
```

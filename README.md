# Synchronous FIFO – Verilog RTL Design

## Overview
This project implements an 8-bit Synchronous FIFO (First-In First-Out) using Verilog HDL. The FIFO supports simultaneous read and write operations, uses a common clock for both operations, and includes status flags to monitor its occupancy.

The design is intended as a starting point for exploring FIFO architecture, RTL design, functional verification, and ASIC implementation.

## Design Specifications

| Parameter | Specification |
|---|---|
| FIFO Type | Synchronous FIFO |
| Data Width | 8 bits |
| FIFO Depth | 4 locations |
| Clock | Single clock |
| Read Operation | Synchronous |
| Write Operation | Synchronous |
| Memory | 4 × 8-bit register array |

## Features
- Independent read and write control signals.
- 8-bit input and output data.
- Separate read and write pointers.
- Occupancy tracking using a counter.
- Full and Empty status flags.
- Almost Full flag asserted when occupancy reaches 2 or more entries.
- Simultaneous read and write support.
- Reset functionality.

## Status Flags

| Flag | Condition |
|---|---|
| `full` | FIFO contains 4 entries |
| `empty` | FIFO contains 0 entries |
| `afull` | FIFO contains 2 or more entries |

## RTL Architecture

The design consists of the following internal components:

- **Memory Array:** Stores the incoming data.
- **Write Pointer:** Tracks the next memory location for writing.
- **Read Pointer:** Tracks the next memory location for reading.
- **Occupancy Counter:** Maintains the number of stored entries.
- **Control Logic:** Prevents writes when full and reads when empty.
- **Status Logic:** Generates Full, Empty, and Almost Full flags.

## Verification

A Verilog testbench is used to verify the FIFO functionality through different operating scenarios.

Test scenarios include:
- Reset operation.
- Sequential write operations.
- Sequential read operations.
- FIFO full and empty conditions.
- Almost Full flag assertion.
- Simultaneous read and write operations.
- Write attempts when the FIFO is full.
- Read attempts when the FIFO is empty.

Simulation waveforms are used to observe data movement, pointer-related behavior, and status flag transitions.

## Future Implementation: 16-bit FIFO – RTL to GDSII

The next phase of this project aims to extend the design into a 16-bit synchronous FIFO and take it through a complete ASIC implementation flow.

### Planned Enhancements
- Increase data width from 8 bits to 16 bits.
- Explore configurable FIFO depth.
- Improve parameterization and RTL modularity.
- Develop a SystemVerilog-based verification environment.
- Add assertions and more comprehensive corner-case testing.

### Planned ASIC Implementation Flow

1. **RTL Design:** Develop and validate the 16-bit FIFO RTL.
2. **Functional Verification:** Verify functionality using simulation and SystemVerilog testbenches.
3. **Logic Synthesis:** Convert RTL into a gate-level netlist.
4. **Floorplanning:** Define the core area and establish initial design constraints.
5. **Placement:** Place standard cells within the floorplan.
6. **Clock Tree Synthesis (CTS):** Build the clock distribution network.
7. **Routing:** Complete signal and clock routing.
8. **Physical Verification:** Perform DRC and LVS checks.
9. **GDSII Generation:** Generate the final layout database.

**Planned Tools:** Verilog/SystemVerilog, Icarus Verilog or Vivado, OpenLane/OpenROAD, and the Sky130 or another supported PDK.

## Learning Objectives
- Understand synchronous FIFO architecture and operation.
- Gain practical experience in Verilog RTL coding.
- Understand pointer management and occupancy tracking.
- Develop functional verification skills.
- Explore the complete RTL-to-GDSII ASIC design flow.

## Project Status

- [x] 8-bit synchronous FIFO RTL design
- [x] Basic Verilog testbench
- [x] Functional simulation
- [ ] 16-bit FIFO RTL implementation
- [ ] SystemVerilog verification
- [ ] Logic synthesis
- [ ] Physical design
- [ ] DRC/LVS verification
- [ ] GDSII generation

---

*This project is being developed incrementally, progressing from basic RTL design and simulation towards a complete ASIC implementation.*

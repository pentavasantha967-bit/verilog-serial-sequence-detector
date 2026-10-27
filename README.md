# Serial Sequence Detector Using Verilog HDL

## Overview
A serial sequence detector designed using Verilog HDL
and a finite state machine (FSM).

The circuit detects the bit pattern `1001` in a serial
input stream.

## Features
- Mealy FSM architecture
- Four-state implementation
- Serial input processing
- Overlapping sequence detection
- Asynchronous active-high reset
- Verilog testbench for functional simulation

## State Transitions
- S0: No useful match
- S1: Detected `1`
- S10: Detected `10`
- S100: Detected `100`

When the input `1` arrives in S100, the circuit asserts
the detection output.

## Files
- `sequence_detector.v`: RTL implementation
- `sequence_detector_tb.v`: Testbench

## Tools
Verilog HDL simulator (add the tool you actually used).

## Learning Objectives
- FSM design
- Sequential and combinational logic
- State transition implementation
- Testbench development
- Overlapping sequence detection

## Future Improvements
- Expand the testbench with more input patterns
- Add simulation waveform screenshots
- Document the state transition diagram
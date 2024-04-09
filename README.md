# Processor
## NAME (NETID)
Kushal Mohta (km578) //

## Description of Design
This 5-stage processor pipeline design implements the entire ISA. All bypasses and stalls are implemented correctly. For branches that cannot be bypassed, I have noOp flushes built into the design. Everything works perfectly as intended.

## Bypassing
Works
## Stalling
Works
## Optimizations
None yet (have used modified Booth and CLA adder already). Possible further optimizations include building a branch predictor and using a Wallace tree multiplier. 
## Bugs
No known bugs, passes ALL test cases.
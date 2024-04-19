.text
.globl main

main:
    # Simulate the wheel spin
    addi $t0, $zero, 0         # Initialize LED counter
    addi $t1, $zero, 38        # Number of LEDs
    addi $t2, $zero, 0         # Random number of noOps
    addi $t3, $zero, 0         # Spin counter
    addi $t4, $zero, 5         # Number of spins

spin_loop:
    # Generate a random number of noOps (0-100)
    addi $t5, $t3, 1
    addi $t6, $zero, 10
    mul $t6, $t5, $t6 #MULT result is wrong need to FIX  - FOR SLOWING DOWN LOGIC!!
    addi $t2, $zero, 25000      # Store the calculated noOp number in $t2

    # Insert noOps for delay
    addi $t5, $zero, 0         # noOp counter
noOp_loop:
    bne $t5, $t2, noOp_insert
noOp_done:
    # Write the LED value to memory
    addi, $s0, $t0, 0

    # Increment LED counter
    addi $t0, $t0, 1
    addi $s0, $t0, 0
    bne $t0, $t1, spin_loop

    # Increment spin counter
    addi $t3, $t3, 1
    addi $t0, $zero, 0
    bne $t3, $t4, spin_loop

    # Generate a random number (0-37) for the final LED
    addi $t6, $zero, 17        # Store the random number in $t6

    # Write the final LED value to s0
    addi, $s0, $t6, 0

    # Keep the final LED lit until another spin
final_loop:
    addi, $s0, $t6, 0
    j final_loop


noOp_insert: 
    nop                         # Insert noOp
    addi $t5, $t5, 1           # Increment noOp counter
    j noOp_loop

.text
.globl main

main:
    bne $t8, $zero, spin_initialise
    j main

# Simulate the wheel spin
spin_initialise:
    addi $t8, $zero, 0
    addi $t0, $zero, 0    # Initialize LED counter
    addi $t1, $zero, 38   # Number of LEDs
    addi $t3, $zero, 0    # Spin counter
    addi $t4, $zero, 5    # Number of spins
    j spin_loop    

spin_loop:
    # Set the number of noOps based on the spin number
    addi $t5, $t3, 0      # Get the current spin number
    addi $t2, $zero, 0    # Initialize the noOp count

    # Set the noOp count based on the spin number
    addi $t6, $zero, 1
    blt $t5, $t6, set_noOps_0
    addi $t6, $zero, 2
    blt $t5, $t6, set_noOps_1
    addi $t6, $zero, 3
    blt $t5, $t6, set_noOps_2
    addi $t6, $zero, 4
    blt $t5, $t6, set_noOps_3
    addi $t6, $zero, 5
    blt $t5, $t6, set_noOps_4
    j set_noOps_5

set_noOps_0:
    addi $t2, $zero, 15000
    j set_noOps_done

set_noOps_1:
    addi $t2, $zero, 25000
    j set_noOps_done

set_noOps_2:
    addi $t2, $zero, 33000
    j set_noOps_done

set_noOps_3:
    addi $t2, $zero, 40000
    j set_noOps_done

set_noOps_4:
    addi $t2, $zero, 52000
    j set_noOps_done

set_noOps_5:
    addi $t2, $zero, 60000

set_noOps_done:
    # Insert noOps for delay
    addi $t5, $zero, 0    # noOp counter

noOp_loop:
    bne $t5, $t2, noOp_insert
    j noOp_done

noOp_insert:
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop  
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop  
    addi $t5, $t5, 1      # Increment noOp counter
    j noOp_loop

noOp_done:
    # Write the LED value to memory
    addi $s0, $t0, 0

    # Increment LED counter
    addi $t0, $t0, 1
    addi $s0, $t0, 0
    bne $t0, $t1, spin_loop

    # Increment spin counter
    addi $t3, $t3, 1
    addi $t0, $zero, 0
    addi $s0, $t0, 0
    bne $t3, $t4, spin_loop

# Generate a random number (0-37) for the final LED
addi $t6, $zero, 17    # Store the random number in $t6

addi $t7, $zero, 60000 # Initial delay value

slow_down_loop:
    # Write the current LED value to memory
    addi $s0, $t0, 0

    # Insert noOps for delay
    addi $t5, $zero, 0    # noOp counter

slow_down_noOp_loop:
    bne $t5, $t7, slow_down_noOp_insert
    j slow_down_noOp_done

slow_down_noOp_insert:
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop  
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop  
    addi $t5, $t5, 1      # Increment noOp counter
    j slow_down_noOp_loop

slow_down_noOp_done:
    # Increment LED counter
    addi $t0, $t0, 1
    bne $t0, $t1, slow_down_loop_continue
    addi $t0, $zero, 0    # Reset LED counter if it reaches the end

slow_down_loop_continue:
    # Check if the current LED matches the random number
    bne $t0, $t6, slow_down_loop

    # Write the final LED value to s0
    addi $s0, $t6, 0

compute_number_properties: 
    nop
    nop
    nop
    numprop, $s1, $s0, 0  # s1 has the number properties
    j bet_extraction_init

bet_extraction_init:
    # Initialize registers
    addi $t0, $zero, 0    # Bet counter
    addi $t1, $zero, 0    # Register counter
    addi $t2, $zero, 0    # Extracted bet

    # Start extracting bets
extract_bets:
    # Check if all bets have been processed
    addi $t3, $zero, 12
    bne $t0, $t3, continue_extraction
    j end_extraction

continue_extraction:
    # Extract the bet based on register counter
    bne $t1, $zero, extract_from_reg_26
    j extract_from_reg_25

extract_from_reg_26:
    addi $t3, $zero, 1
    bne $t1, $t3, extract_from_reg_27
    j extract_bet_reg_26

extract_from_reg_27:
    j extract_bet_reg_27

extract_from_reg_25:
    # Extract bet from register 25
    sra $t2, $s25, 24     # Extract first 8 bits
    j process_bet

extract_bet_reg_26:
    # Extract bet from register 26
    sra $t2, $s26, 24     # Extract first 8 bits
    j process_bet

extract_bet_reg_27:
    # Extract bet from register 27
    sra $t2, $s27, 24     # Extract first 8 bits

process_bet:
    # Check if extracted bet is zero (end of bets)
    bne $t2, $zero, calculate_payout
    j end_extraction

calculate_payout:
    # Call the placeholder function to calculate payout
    # You can replace this with the actual payout calculation logic
    # placeholder_calculate_payout($t2)

    # Shift the register to prepare for the next bet extraction
    sll $s25, $s25, 8
    sll $s26, $s26, 8
    sll $s27, $s27, 8

    # Increment bet counter
    addi $t0, $t0, 1

    # Check if all bets in the current register have been processed
    addi $t3, $zero, 4
    div $t4, $t0, $t3
    mul $t4, $t4, $t3
    bne $t0, $t4, extract_bets

    # Move to the next register
    addi $t1, $t1, 1
    j extract_bets

end_extraction:
    # All bets have been processed
    # You can add any final processing or cleanup code here
    j final_loop

    # Keep the final LED lit until another spin
final_loop:
    addi $s0, $t6, 0
    bne $t8, $zero, spin_initialise
    j final_loop
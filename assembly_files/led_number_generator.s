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
    j compute_number_properties

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
    addi $s2, $zero, 0
    j extract_bets  

    # Start extracting bets
extract_bets:
    # Check if all bets have been processed
    addi $t3, $zero, 12 # WORKS UNTIL HERE
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
    addi $t4, $zero, 255  # Load the mask value into $t0 (4278190080 is 0xFF000000 in decimal)
    and $t2, $25, $t4            # Extract first 8 bits
    addi $28, $t2, 0
    addi $t0, $t2, 0
    sra $25, $25, 8
    addi $29, $zero, 3
    j extract_from_reg_25
    j process_bet

extract_bet_reg_26:
    # Extract bet from register 26
    addi $t4, $zero, 255  # Load the mask value into $t0 (4278190080 is 0xFF000000 in decimal)
    and $t2, $26, $t4
    sra $26, $26, 8            # Extract first 8 bits
    j process_bet

extract_bet_reg_27:
    # Extract bet from register 27
    addi $t4, $zero, 255  # Load the mask value into $t0 (4278190080 is 0xFF000000 in decimal)
    and $t2, $27, $t4
    sra $27, $27, 8           # Extract first 8 bits
    j process_bet

process_bet:
    # Check if extracted bet is zero (end of bets)
    
    bne $t2, $zero, calculate_payout
    j end_extraction

calculate_payout:
    # Call the placeholder function to calculate payout
    # You can replace this with the actual payout calculation logic
    # placeholder_calculate_payout($t2)
    j payout_calculation

post_payout:
    # Shift the register to prepare for the next bet extraction
    

    # Increment bet counter
    addi $t0, $t0, 1
    addi, $29, $t0, 0

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
    #coin distribution of payout
    j payout_distribution

post_payout_distribution: 
    #motor control to dispense chips
    j final_loop

    # Keep the final LED lit until another spin
final_loop:
    addi $s0, $t6, 0
    #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
    #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
    #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
    #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
    #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
    #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
    #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
    #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
    #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
    #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
    #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE

    bne $t8, $zero, spin_initialise
    j final_loop

payout_calculation:
    # Store the current bet value in $t6
    addi $t6, $t2, 0

    # Extract the bet type (first 6 bits) into $t7
    addi $t8, $zero, 63    # Mask for extracting first 6 bits
    and $t7, $t6, $t8

    # Check if the bet type is 111110 (terminate payout calculation)
    addi $t8, $zero, 62    # Value for 111110
    bne $t7, $t8, continue_payout
    j end_payout

continue_payout:
    # Extract the bet amount (7th and 8th bits) into $t8
    sra $t8, $t6, 6
    addi $t9, $zero, 3     # Mask for extracting 7th and 8th bits
    and $t8, $t8, $t9

    # Determine the bet amount based on the extracted bits
    bne $t8, $zero, check_amount_5
    addi $t9, $zero, 1      # Bet amount is 1
    j calculate_bet_payout

check_amount_5:
    addi $t3, $zero, 1
    bne $t8, $t3, check_amount_25
    addi $t9, $zero, 5      # Bet amount is 5
    j calculate_bet_payout

check_amount_25:
    addi $t3, $zero, 2
    bne $t8, $t3, check_amount_100
    addi $t9, $zero, 25     # Bet amount is 25
    j calculate_bet_payout

check_amount_100:
    addi $t9, $zero, 100    # Bet amount is 100

calculate_bet_payout:
    # Check the bet type and calculate the payout accordingly
    addi $t8, $zero, 38
    blt $t7, $t8, payout_number
    j payout_special

payout_number:
    # Payout for a number bet
    # Check if the bet number matches the LED number (first 6 bits of $s1)
    addi $t8, $zero, 63    # Mask for extracting first 6 bits
    and $t8, $s1, $t8
    bne $t7, $t8, end_payout
    # Payout is 36 times the bet amount (including the original bet)
    addi $t8, $zero, 36
    mul $t8, $t8, $t9
    add $s2, $s2, $t8
    j end_payout

payout_special:
    # Payout for special bets
    addi $t8, $zero, 38
    bne $t7, $t8, check_black
    # Payout for red bet
    # Check if the 7th bit of $s1 is 1 (red)
    sra $t8, $s1, 6
    addi $t3, $zero, 1
    and $t8, $t8, $t3
    bne $t8, $zero, red_payout
    j end_payout
red_payout:
    # Payout is 2 times the bet amount (including the original bet)
    sll $t3, $t9, 1
    add $s2, $s2, $t3
    j end_payout

check_black:
    addi $t8, $zero, 39
    bne $t7, $t8, check_even
    # Payout for black bet
    # Check if the 7th bit of $s1 is 0 (black)
    sra $t8, $s1, 6
    addi $t3, $zero, 1
    and $t8, $t8, $t3
    bne $t8, $zero, end_payout
    # Payout is 2 times the bet amount (including the original bet)
    sll $t3, $t9, 1
    add $s2, $s2, $t3
    j end_payout

check_even:
    addi $t8, $zero, 40
    bne $t7, $t8, check_odd
    # Payout for even bet
    # Check if the 8th bit of $s1 is 1 (even)
    sra $t8, $s1, 7
    addi $t3, $zero, 1
    and $t8, $t8, $t3
    bne $t8, $zero, even_payout
    j end_payout
even_payout:
    # Payout is 2 times the bet amount (including the original bet)
    sll $t3, $t9, 1
    add $s2, $s2, $t3
    j end_payout

check_odd:
    addi $t8, $zero, 41
    bne $t7, $t8, check_1_18
    # Payout for odd bet
    # Check if the 8th bit of $s1 is 0 (odd)
    sra $t8, $s1, 7
    addi $t3, $zero, 1
    and $t8, $t8, $t3
    bne $t8, $zero, end_payout
    # Payout is 2 times the bet amount (including the original bet)
    sll $t3, $t9, 1
    add $s2, $s2, $t3
    j end_payout

check_1_18:
    addi $t8, $zero, 42
    bne $t7, $t8, check_19_36
    # Payout for 1-18 bet
    # Check if the 9th bit of $s1 is 0 (1-18)
    sra $t8, $s1, 8
    addi $t3, $zero, 1
    and $t8, $t8, $t3
    bne $t8, $zero, end_payout
    # Payout is 2 times the bet amount (including the original bet)
    sll $t3, $t9, 1
    add $s2, $s2, $t3
    j end_payout

check_19_36:
    addi $t8, $zero, 43
    bne $t7, $t8, check_1_12
    # Payout for 19-36 bet
    # Check if the 9th bit of $s1 is 1 (19-36)
    sra $t8, $s1, 8
    addi $t3, $zero, 1
    and $t8, $t8, $t3
    bne $t8, $zero, payout_19_36
    j end_payout
payout_19_36:
    # Payout is 2 times the bet amount (including the original bet)
    sll $t3, $t9, 1
    add $s2, $s2, $t3
    j end_payout

check_1_12:
    addi $t8, $zero, 44
    bne $t7, $t8, check_13_24
    # Payout for 1-12 bet
    # Check if the 10th and 11th bits of $s1 are 01 (1-12)
    sra $t8, $s1, 9
    addi $t3, $zero, 3     # Mask for extracting 10th and 11th bits
    and $t8, $t8, $t3
    addi $t3, $zero, 1
    bne $t8, $t3, end_payout
    # Payout is 3 times the bet amount (including the original bet)
    addi $t3, $zero, 3
    mul $t3, $t3, $t9
    add $s2, $s2, $t3
    j end_payout

check_13_24:
    addi $t8, $zero, 45
    bne $t7, $t8, check_25_36
    # Payout for 13-24 bet
    # Check if the 10th and 11th bits of $s1 are 10 (13-24)
    sra $t8, $s1, 9
    addi $t3, $zero, 3     # Mask for extracting 10th and 11th bits
    and $t8, $t8, $t3
    addi $t3, $zero, 2
    bne $t8, $t3, end_payout
    # Payout is 3 times the bet amount (including the original bet)
    addi $t3, $zero, 3
    mul $t3, $t3, $t9
    add $s2, $s2, $t3
    j end_payout

check_25_36:
    addi $t8, $zero, 46
    bne $t7, $t8, check_top_column
    # Payout for 25-36 bet
    # Check if the 10th and 11th bits of $s1 are 11 (25-36)
    sra $t8, $s1, 9
    addi $t3, $zero, 3     # Mask for extracting 10th and 11th bits
    and $t8, $t8, $t3
    addi $t3, $zero, 3
    bne $t8, $t3, end_payout
    # Payout is 3 times the bet amount (including the original bet)
    addi $t3, $zero, 3
    mul $t3, $t3, $t9
    add $s2, $s2, $t3
    j end_payout

check_top_column:
    addi $t8, $zero, 47
    bne $t7, $t8, check_middle_column
    # Payout for top column bet
    # Check if the 13th and 14th bits of $s1 are 11 (top column)
    sra $t8, $s1, 12
    addi $t3, $zero, 3     # Mask for extracting 13th and 14th bits
    and $t8, $t8, $t3
    addi $t3, $zero, 3
    bne $t8, $t3, end_payout
    # Payout is 3 times the bet amount (including the original bet)
    addi $t3, $zero, 3
    mul $t3, $t3, $t9
    add $s2, $s2, $t3
    j end_payout

check_middle_column:
    addi $t8, $zero, 48
    bne $t7, $t8, check_bottom_column
    # Payout for middle column bet
    # Check if the 13th and 14th bits of $s1 are 10 (middle column)
    sra $t8, $s1, 12
    addi $t3, $zero, 3     # Mask for extracting 13th and 14th bits
    and $t8, $t8, $t3
    addi $t3, $zero, 2
    bne $t8, $t3, end_payout
    # Payout is 3 times the bet amount (including the original bet)
    addi $t3, $zero, 3
    mul $t3, $t3, $t9
    add $s2, $s2, $t3
    j end_payout

check_bottom_column:
    addi $t8, $zero, 49
    bne $t7, $t8, end_payout
    # Payout for bottom column bet
    # Check if the 13th and 14th bits of $s1 are 01 (bottom column)
    sra $t8, $s1, 12
    addi $t3, $zero, 3     # Mask for extracting 13th and 14th bits
    and $t8, $t8, $t3
    addi $t3, $zero, 1
    bne $t8, $t3, end_payout
    # Payout is 3 times the bet amount (including the original bet)
    addi $t3, $zero, 3
    mul $t3, $t3, $t9
    add $s2, $s2, $t3

end_payout:
    # Return to the bet extraction code
    j post_payout

payout_distribution:
    # Initialize chip count registers
    addi $s3, $zero, 0    # 1 chip count
    addi $s4, $zero, 0    # 5 chips count
    addi $s5, $zero, 0    # 25 chips count
    addi $s6, $zero, 0    # 100 chips count

    # Calculate the number of 100 chips
    addi $t0, $zero, 100
    div $s6, $s2, $t0     # $s6 = payout / 100
    mul $t1, $s6, $t0
    sub $t1, $s2, $t1     # $t1 = payout % 100

    # Calculate the number of 25 chips
    addi $t0, $zero, 25
    div $s5, $t1, $t0     # $s5 = (payout % 100) / 25
    mul $t2, $s5, $t0
    sub $t1, $t1, $t2     # $t1 = (payout % 100) % 25

    # Calculate the number of 5 chips
    addi $t0, $zero, 5
    div $s4, $t1, $t0     # $s4 = ((payout % 100) % 25) / 5
    mul $t2, $s4, $t0
    sub $t1, $t1, $t2     # $t1 = ((payout % 100) % 25) % 5

    # Calculate the number of 1 chips
    addi $s3, $t1, 0      # $s3 = ((payout % 100) % 25) % 5

    # Payout distribution complete
    j post_payout_distribution
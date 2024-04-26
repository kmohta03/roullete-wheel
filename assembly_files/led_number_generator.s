.text
.globl main

main:
    bne $4, $zero, spin_initialise
    bne $3, $zero, main
    j open_door

#detect_spin: 
    #bne $4, $zero, spin_initialise
    #j main

# Simulate the wheel spin
spin_initialise:
    addi $t8, $zero, 0
    addi $t0, $zero, 0    # Initialize LED counter
    addi $t1, $zero, 38   # Number of LEDs
    addi $t3, $zero, 0    # Spin counter
    addi $t4, $zero, 5    # Number of spins
    addi $6, $zero, 1
    j spin_loop    

spin_loop:
    
    # Set the number of noOps based on the spin number
    addi $t5, $t3, 0      # Get the current spin number
    addi $t2, $zero, 0    # Initialize the noOp count
    j get_number
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
    addi $t2, $zero, 19000
    j set_noOps_done

set_noOps_2:
    addi $t2, $zero, 28000
    j set_noOps_done

set_noOps_3:
    addi $t2, $zero, 50000
    j set_noOps_done

set_noOps_4:
    addi $t2, $zero, 55000
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


get_number:
    addi $t6, $zero, 63
    bne $s0, $t6, compute_number_properties
    j get_number

# # Generate a random number (0-37) for the final LED
# addi $t6, $zero, 17    # Store the random number in $t6

# addi $t7, $zero, 60000 # Initial delay value

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
    addi $t0, $zero, 0  # Bet counter
    addi $t1, $zero, 0  # Register counter
    addi $t2, $zero, 0  # Extracted bet
    addi $t3, $zero, 0  # Temporary register for shifted value
    addi $s2, $zero, 0
    j extract_bets  

    # Start extracting bets
extract_bets:
    # Check if all bets have been processed
    addi $t4, $zero, 12
    bne $t0, $t4, continue_extraction
    j end_extraction

continue_extraction:
    # Extract the bet based on register counter
    bne $t1, $zero, extract_from_reg_26
    j extract_from_reg_25


extract_from_reg_26:
    addi $t4, $zero, 1
    bne $t1, $t4, extract_from_reg_27
    j extract_bet_reg_26_bet1

extract_from_reg_27:
    j extract_bet_reg_27_bet1

extract_from_reg_25:
    # Extract bets from register 25
    addi $t3, $zero, 255
    and $t2, $25, $t3      # Extract the first bet
    j process_bet

extract_from_reg_25_bet2:
    addi $t4, $zero, 65280
    and $t3, $25, $t4      # Extract the second bet
    sra $t2, $t3, 8
    j extract_from_reg_25_bet2
    j process_bet

extract_from_reg_25_bet3:
    addi $t4, $zero, 16711680
    and $t3, $25, $t4      # Extract the third bet
    sra $t2, $t3, 16
    j process_bet

extract_from_reg_25_bet4:
    addi $t4, $zero, 4278190080
    and $t2, $25, $t4      # Extract the fourth bet
    sra $t2, $t2, 24
    j process_bet


extract_bet_reg_26_bet1:
    # Extract bets from register 26
    addi $t4, $zero, 255
    and $t2, $26, $t4      # Extract the first bet
    j process_bet

extract_bet_reg_26_bet2:
    addi $t4, $zero, 65280
    and $t3, $26, $t4      # Extract the second bet
    sra $t2, $t3, 8
    j process_bet

extract_bet_reg_26_bet3:
    addi $t4, $zero, 16711680
    and $t3, $26, $t4      # Extract the third bet
    sra $t2, $t3, 16
    j process_bet

extract_bet_reg_26_bet4:
    addi $t4, $zero, 4278190080
    and $t2, $26, $t4      # Extract the fourth bet
    sra $t2, $t2, 24
    j process_bet


extract_bet_reg_27_bet1:
    # Extract bets from register 27
    addi $t4, $zero, 255
    and $t2, $27, $t4  
     # Extract the first bet
    j process_bet

extract_bet_reg_27_bet2:
    addi $t4, $zero, 65280
    and $t3, $27, $t4      # Extract the second bet
    sra $t2, $t3, 8
    j process_bet

extract_bet_reg_27_bet3:
    addi $t4, $zero, 16711680
    and $t3, $27, $t4      # Extract the third bet
    sra $t2, $t3, 16
    j process_bet

extract_bet_reg_27_bet4:
    addi $t4, $zero, 4278190080
    and $t2, $27, $t4      # Extract the fourth bet
    sra $t2, $t2, 24
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
    # Increment bet counter
    #j post_payout
    j post_payout
    addi $t0, $t0, 1 
    addi $29, $t0, 0
    blt $t0, $2, update_bet_counts
    j end_extraction

update_bet_counts:
    # Check if all bets in the current register have been processed
    addi $t4, $zero, 3
    bne $t0, $t4, check_bet2
    j update_register_counter


check_bet2:
    addi $t4, $zero, 1
    bne $t0, $t4, check_bet3
    bne $t1, $zero, extract_bet_reg_26_bet2
    addi $t4, $zero, 2
    bne $t1, $t4, extract_bet_reg_27_bet2
    j extract_from_reg_25_bet2

check_bet3:
    addi $t4, $zero, 2
    bne $t0, $t4, check_bet4
    bne $t1, $zero, extract_bet_reg_26_bet3
    addi $t4, $zero, 2
    bne $t1, $t4, extract_bet_reg_27_bet3
    j extract_from_reg_25_bet3

check_bet4:
    bne $t1, $zero, extract_bet_reg_26_bet4
    addi $t4, $zero, 2
    bne $t1, $t4, extract_bet_reg_27_bet4
    j extract_from_reg_25_bet4

update_register_counter:
    # Move to the next register
    addi $t1, $t1, 1
    addi $t0, $zero, 0
    j extract_bets

end_extraction:
    j payout_distribution

post_1:
    addi $s7, $zero, 0      # Initialize a counter in $s0 to 0
    j motor_5
post_5:
    addi $s7, $zero, 0      # Initialize a counter in $s0 to 0
    j motor_25
post_25:
    addi $s7, $zero, 0      # Initialize a counter in $s0 to 0
    j motor_100

    # All bets have been processed
    #coin distribution of payout
    
motor_1: 
    bne  $s3, $s7, dispense_1
    j post_1
        
motor_5:
    bne  $s4, $s7, dispense_5
    j post_5

motor_25: 
    bne  $s4, $s7, dispense_25
    j post_25

motor_100: 
    bne  $s4, $s7, dispense_100
    j post_payout_distribution



post_payout_distribution: 
    #motor control to dispense chips
    addi $5, $zero, 1

    j final_loop

    # Keep the final LED lit until another spin
final_loop:
    addi $s0, $s0, 0
    # Reset registers 1-32 to zero
    addi $5, $zero, 2
    addi $1, $zero, 0
    addi $2, $zero, 0
    addi $3, $zero, 0
    addi $4, $zero, 0
    addi $5, $zero, 0
    addi $6, $zero, 0
    addi $7, $zero, 0
    addi $8, $zero, 0
    addi $9, $zero, 0
    addi $10, $zero, 0
    addi $11, $zero, 0
    addi $12, $zero, 0
    addi $13, $zero, 0
    addi $14, $zero, 0
    addi $15, $zero, 0
    addi $16, $zero, 0
    addi $17, $zero, 0
    #addi $18, $zero, 0
    addi $19, $zero, 0
    addi $20, $zero, 0
    addi $21, $zero, 0
    addi $22, $zero, 0
    addi $23, $zero, 0
    addi $24, $zero, 0
    addi $25, $zero, 0
    addi $26, $zero, 0
    addi $27, $zero, 0
    addi $28, $zero, 0
    addi $29, $zero, 0
    addi $30, $zero, 0
    addi $31, $zero, 0
    j main

payout_calculation:
    # Store the current bet value in $t6
    addi $t6, $t2, 0

    # Extract the bet type (first 6 bits) into $t7
    addi $t8, $zero, 63    # Mask for extracting first 6 bits
    and $t7, $t6, $t8

    # Check if the bet type is 111110 (terminate payout calculation)
    addi $t8, $zero, 62    # Value for 111110
    bne $t7, $t8, continue_payout
    j end_extraction

continue_payout:
    # Extract the bet amount (7th and 8th bits) into $t8
    sra $t8, $t6, 6
    addi $s7, $zero, 3     # Mask for extracting 7th and 8th bits
    and $t8, $t8, $s7

    # Determine the bet amount based on the extracted bits
    bne $t8, $zero, check_amount_5
    addi $s7, $zero, 1      # Bet amount is 1
    j calculate_bet_payout

check_amount_5:
    addi $t3, $zero, 1
    bne $t8, $t3, check_amount_25
    addi $s7, $zero, 5      # Bet amount is 5
    j calculate_bet_payout

check_amount_25:
    addi $t3, $zero, 2
    bne $t8, $t3, check_amount_100
    addi $s7, $zero, 25     # Bet amount is 25
    j calculate_bet_payout

check_amount_100:
    addi $s7, $zero, 100    # Bet amount is 100

calculate_bet_payout:
    # Check the bet type and calculate the payout accordingly
    addi $t8, $zero, 38
    j calculate_bet_payout
    blt $t7, $t8, payout_number

payout_number:
    # Payout for a number bet
    # Check if the bet number matches the LED number (first 6 bits of $s1)
    addi $t8, $zero, 63    # Mask for extracting first 6 bits
    and $t8, $s1, $t8
    bne $t7, $t8, end_payout
    # Payout is 36 times the bet amount (including the original bet)
    addi $t8, $zero, 36
    mul $t8, $t8, $s7
    add $s2, $s2, $t8
    j end_payout

payout_special:
    # Payout for special bets
    sra $t8, $s1, 13    # Shift right by 13 bits to get the 14th bit
    addi $t9, $zero, 1
    and $t8, $t8, $t9   # Mask the 14th bit
    bne $t8, $t9, not_zeros
    j end_payout

not_zeros:
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
    sll $t3, $s7, 1
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
    sll $t3, $s7, 1
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
    sll $t3, $s7, 1
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
    sll $t3, $s7, 1
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
    sll $t3, $s7, 1
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
    sll $t3, $s7, 1
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
    mul $t3, $t3, $s7
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
    mul $t3, $t3, $s7
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
    mul $t3, $t3, $s7
    add $s2, $s2, $t3
    j end_payout

check_top_column:
    addi $t8, $zero, 47
    bne $t7, $t8, check_middle_column
    # Payout for top column bet
    # Check if the 12th and 13th bits of $s1 are 11 (top column)
    sra $t8, $s1, 11
    addi $t3, $zero, 3     # Mask for extracting 13th and 14th bits
    and $t8, $t8, $t3
    addi $t3, $zero, 3
    bne $t8, $t3, end_payout
    # Payout is 3 times the bet amount (including the original bet)
    addi $t3, $zero, 3
    mul $t3, $t3, $s7
    add $s2, $s2, $t3
    j end_payout

check_middle_column:
    addi $t8, $zero, 48
    bne $t7, $t8, check_bottom_column
    # Payout for middle column bet
    # Check if the 12th and 13th bits of $s1 are 10 (middle column)
    sra $t8, $s1, 11
    addi $t3, $zero, 3     # Mask for extracting 13th and 14th bits
    and $t8, $t8, $t3
    addi $t3, $zero, 2
    bne $t8, $t3, end_payout
    # Payout is 3 times the bet amount (including the original bet)
    addi $t3, $zero, 3
    mul $t3, $t3, $s7
    add $s2, $s2, $t3
    j end_payout

check_bottom_column:
    addi $t8, $zero, 49
    bne $t7, $t8, end_payout
    # Payout for bottom column bet
    # Check if the 12th and 13th bits of $s1 are 01 (bottom column)
    sra $t8, $s1, 11
    addi $t3, $zero, 3     # Mask for extracting 13th and 14th bits
    and $t8, $t8, $t3
    addi $t3, $zero, 1
    bne $t8, $t3, end_payout
    # Payout is 3 times the bet amount (including the original bet)
    addi $t3, $zero, 3
    mul $t3, $t3, $s7
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
    
    
    
    addi $s7, $zero, 2
    mul $s6, $s7, $s6
    mul $s5, $s7, $s5
    mul $s4, $s7, $s4
    mul $s3, $s7, $s3

    # Payout distribution complete
    j post_payout_distribution 


#MOTOR LOGIC
open_door:
    addi $s3, $zero, 90    # Set duty cycle to 30
    sw $s3, 9($zero)  # Write duty cycle to MMIO address for Motor 5
    addi $s4, $zero, 60000  # Load delay value
    j motor_delay              # Call delay function

close_door:
    addi $s3, $zero, 40     # Set duty cycle to 0
    sw $s3, 9($zero)  # Write duty cycle to MMIO address for Motor 5
    addi $s4, $zero, 60000
    j main

motor_delay:
    # Insert noOps for delay
    addi $s5, $zero, 0    # noOp counter
    j motor_loop

motor_loop:
    bne $s5, $s4, motor_noOp_insert
    j close_door


dispense_1:
    addi $s3, $zero, 98    # Set duty cycle to 30
    sw $s3, 10($zero)  # Write duty cycle to MMIO address for Motor 5
    addi $s4, $zero, 60000  # Load delay value
    j motor_delay_1              # Call delay function

undispense_1:
    addi $s3, $zero, 2     # Set duty cycle to 0
    sw $s3, 10($zero)  # Write duty cycle to MMIO address for Motor 5
    addi $s4, $zero, 60000
    j motor_1

motor_delay_1:
    # Insert noOps for delay
    addi $s5, $zero, 0    # noOp counter
    j motor_loop_1

motor_loop_1:
    bne $s5, $s4, motor_noOp_insert_1
    j undispense_1


dispense_5:
    addi $s3, $zero, 98    # Set duty cycle to 30
    sw $s3, 11($zero)  # Write duty cycle to MMIO address for Motor 5
    addi $s4, $zero, 60000  # Load delay value
    j motor_delay_5             # Call delay function

undispense_5:
    addi $s3, $zero, 2     # Set duty cycle to 0
    sw $s3, 11($zero)  # Write duty cycle to MMIO address for Motor 5
    addi $s4, $zero, 60000
    j motor_5

motor_delay_5:
    # Insert noOps for delay
    addi $s5, $zero, 0    # noOp counter
    j motor_loop_5

motor_loop_5:
    bne $s5, $s4, motor_noOp_insert_5
    j undispense_5

dispense_25:
    addi $s3, $zero, 98    # Set duty cycle to 30
    sw $s3, 12($zero)  # Write duty cycle to MMIO address for Motor 5
    addi $s4, $zero, 60000  # Load delay value
    j motor_delay_25             # Call delay function

undispense_25:
    addi $s3, $zero, 2     # Set duty cycle to 0
    sw $s3, 12($zero)  # Write duty cycle to MMIO address for Motor 5
    addi $s4, $zero, 60000
    j motor_25

motor_delay_25:
    # Insert noOps for delay
    addi $s5, $zero, 0    # noOp counter
    j motor_loop_25

motor_loop_25:
    bne $s5, $s4, motor_noOp_insert_25
    j undispense_25

dispense_100:
    addi $s3, $zero, 98    # Set duty cycle to 30
    sw $s3, 13($zero)  # Write duty cycle to MMIO address for Motor 5
    addi $s4, $zero, 60000  # Load delay value
    j motor_delay_100           # Call delay function

undispense_100:
    addi $s3, $zero, 2     # Set duty cycle to 0
    sw $s3, 13($zero)  # Write duty cycle to MMIO address for Motor 5
    addi $s4, $zero, 60000
    j motor_100

motor_delay_100:
    # Insert noOps for delay
    addi $s5, $zero, 0    # noOp counter
    j motor_loop_100

motor_loop_100:
    bne $s5, $s4, motor_noOp_insert_100
    j undispense_100

motor_noOp_insert_100:
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    addi $s5, $s5, 1      # Increment noOp counter
    j motor_loop_100



motor_noOp_insert_25:
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    addi $s5, $s5, 1      # Increment noOp counter
    j motor_loop_25

motor_noOp_insert_5:
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    addi $s5, $s5, 1      # Increment noOp counter
    j motor_loop_5

motor_noOp_insert_1:
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    addi $s5, $s5, 1      # Increment noOp counter
    j motor_loop_1 

motor_noOp_insert:
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop 
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop                         
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    addi $s5, $s5, 1      # Increment noOp counter
    j motor_loop 
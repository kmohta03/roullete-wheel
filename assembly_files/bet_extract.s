main: 
    addi, $s0, $zero, 17
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
    addi $t0, $zero, 4278190080  # Load the mask value into $t0 (4278190080 is 0xFF000000 in decimal)
    and $t2, $25, $t0            # Extract first 8 bits
    addi $28, $t2, 0
    sra $25, $25, 8
    j process_bet

extract_bet_reg_26:
    # Extract bet from register 26
    addi $t0, $zero, 4278190080  # Load the mask value into $t0 (4278190080 is 0xFF000000 in decimal)
    and $t2, $26, $t0
    sra $26, $26, 8            # Extract first 8 bits
    j process_bet

extract_bet_reg_27:
    # Extract bet from register 27
    addi $t0, $zero, 4278190080  # Load the mask value into $t0 (4278190080 is 0xFF000000 in decimal)
    and $t2, $27, $t0 
    sra $27, $27, 8           # Extract first 8 bits
    j process_bet

process_bet:
    # Check if extracted bet is zero (end of bets)
    #bne $t2, $zero, calculate_payout
    j process_bet


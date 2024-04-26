
main:     
    addi $s3, $zero, 2 
    addi $s4, $zero, 6
    addi $s5, $zero, 2 
    addi $s6, $zero, 4
    #addi $5, $zero, 1


# post_1:
#     addi $s7, $zero, 0
#     addi $t0, $zero, 100000000      
#     j motor_5
# post_5:
#     addi $s7, $zero, 0
#     addi $t0, $zero, 100000000       
#     j motor_25
# post_25:
#     addi $s7, $zero, 0
#     addi $t0, $zero, 100000000       
#     j motor_100

# motor_1: 
#        # Load the number of iterations into $t0
#     bne  $s3, $s7, dispense_1
#     j post_1
        
# motor_5:
#     bne  $s4, $s7, dispense_5
#     j post_5

# motor_25: 
#     addi $t0, $t0, -1          # Decrement the counter by 1
#     bne $t0, $zero, motor_25 # Branch to delay_loop if $t0 is not zero
#     bne  $s5, $s7, dispense_25
#     j post_25

# motor_100: 
#     addi $t0, $t0, -1          # Decrement the counter by 1
#     bne $t0, $zero, motor_100
#     bne  $s6, $s7, dispense_100
#     j post_payout_distribution



# post_payout_distribution: 
#     #motor control to dispense chips
#     j final_loop

#     # Keep the final LED lit until another spin
# final_loop:
#     addi $s0, $t6, 0
#     #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
#     #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
#     #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
#     #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
#     #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
#     #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
#     #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
#     #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
#     #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
#     #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE
#     #NEED TO ADD REGISTER MAPPED RESET SIGNAL HERE


#     j final_loop



# dispense_1:
#     addi $t1, $zero, 98    # Set duty cycle to 30
#     sw $t1, 10($zero)  # Write duty cycle to MMIO address for Motor 5
#     addi $t4, $zero, 60000  # Load delay value
#     j motor_delay_1              # Call delay function

# undispense_1:
#     addi $t3, $zero, 2     # Set duty cycle to 0
#     sw $t3, 10($zero)  # Write duty cycle to MMIO address for Motor 5
#     addi $t4, $zero, 60000
#     j motor_1

# motor_delay_1:
#     # Insert noOps for delay
#     addi $t5, $zero, 0    # noOp counter
#     j motor_loop_1

# motor_loop_1:
#     bne $t5, $t4, motor_noOp_insert_1
#     j undispense_1


# dispense_5:
#     addi $t3, $zero, 90    # Set duty cycle to 30
#     sw $t3, 11($zero)  # Write duty cycle to MMIO address for Motor 5
#     addi $t4, $zero, 60000  # Load delay value
#     j motor_delay_5             # Call delay function

# undispense_5:
#     addi $t3, $zero, 40     # Set duty cycle to 0
#     sw $t3, 11($zero)  # Write duty cycle to MMIO address for Motor 5
#     addi $t4, $zero, 60000
#     j motor_5

# motor_delay_5:
#     # Insert noOps for delay
#     addi $t5, $zero, 0    # noOp counter
#     j motor_loop_5

# motor_loop_5:
#     bne $t5, $t4, motor_noOp_insert_5
#     j undispense_5

# dispense_25:
#     addi $t3, $zero, 98    # Set duty cycle to 30
#     sw $t3, 12($zero)  # Write duty cycle to MMIO address for Motor 5
#     addi $t4, $zero, 60000  # Load delay value
#     j motor_delay_25             # Call delay function

# undispense_25:
#     addi $t3, $zero, 2     # Set duty cycle to 0
#     sw $t3, 12($zero)  # Write duty cycle to MMIO address for Motor 5
#     addi $t4, $zero, 60000
#     j motor_25

# motor_delay_25:
#     # Insert noOps for delay
#     addi $t5, $zero, 0    # noOp counter
#     j motor_loop_25

# motor_loop_25:
#     bne $t5, $t4, motor_noOp_insert_25
#     j undispense_25

# dispense_100:
#     addi $t3, $zero, 90    # Set duty cycle to 30
#     sw $t3, 13($zero)  # Write duty cycle to MMIO address for Motor 5
#     addi $t4, $zero, 60000  # Load delay value
#     j motor_delay_100           # Call delay function

# undispense_100:
#     addi $t3, $zero, 40     # Set duty cycle to 0
#     sw $t3, 13($zero)  # Write duty cycle to MMIO address for Motor 5
#     addi $t4, $zero, 60000
#     j motor_100

# motor_delay_100:
#     # Insert noOps for delay
#     addi $t5, $zero, 0    # noOp counter
#     j motor_loop_100

# motor_loop_100:
#     bne $t5, $t4, motor_noOp_insert_100
#     j undispense_100

# motor_noOp_insert_100:
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
    
#     addi $t5, $t5, 1      # Increment noOp counter
#     j motor_loop_100



# motor_noOp_insert_25:
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
    
#     addi $t5, $t5, 1      # Increment noOp counter
#     j motor_loop_25

# motor_noOp_insert_5:
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
    
#     addi $t5, $t5, 1      # Increment noOp counter
#     j motor_loop_5

# motor_noOp_insert_1:
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop 
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop                         
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
#     nop
    
#     addi $t5, $t5, 1      # Increment noOp counter
#     j motor_loop_1 
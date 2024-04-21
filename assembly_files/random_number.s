.text
.globl main

main:
    # Initialize registers
    addi $t7, $zero, 1     # $t7 = 1 (to add to the result)
    addi $t8, $zero, 38    # $t8 = 38 (modulus)
    addi $t9, $zero, 12345 # $t9 = 12345 (initial seed value)

    # Generate pseudo-random number using arithmetic operations
    sll $s1, $t9, 7        # $s1 = $t9 << 7
    add $s1, $s1, $t9      # $s1 = $s1 + $t9
    sra $s2, $t9, 13       # $s2 = $t9 >> 13
    sub $s1, $s1, $s2      # $s1 = $s1 - $s2
    sll $s2, $t9, 17       # $s2 = $t9 << 17
    add $t9, $s1, $s2      # $t9 = $s1 + $s2

    # Perform modulo operation to get a number between 0 and 37
    div $s0, $t9, $t8

    # Add 1 to the result to get a number between 1 and 38
    add $s0, $s0, $t7

    # You can perform further operations with the pseudo-random number in $s0 as needed

    # End of the program
    j end

end:
    # Infinite loop to keep the program running
    j end
main:
    # Initialize registers
    addi $t7, $zero, 1    # $t7 = 1 (multiplier)
    addi $t8, $zero, 12345    # $t8 = 12345 (increment)
    addi $t9, $zero, 38    # $t9 = 38 (modulus)
    addi $s1, $zero, 1    # $s1 = 1 (to add to the result)

    # Generate random number using LCG algorithm
    # Formula: X_{n+1} = (a * X_n + c) mod m
    # Here, we use a = 1, c = 12345, m = 38
    mul $s2, $t7, $s0    # $s2 = $t7 * $s0 (multiply previous random number by multiplier)
    add $s2, $s2, $t8    # $s2 = $s2 + $t8 (add increment to the result)
    div $zero, $s2, $t9    # Perform modulo operation ($s2 / $t9)
    mul $s0, $s2, $t9    # $s0 = remainder * $t9
    sub $s0, $s2, $s0    # $s0 = $s2 - $s0 (modulo result)
    add $s0, $s0, $s1    # $s0 = $s0 + $s1 (add 1 to the result to get a number between 1 and 38)
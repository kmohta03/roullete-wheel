# Initialize seed value
add $t0, $zero, $s2

# LCG constants
addi $t1, $zero, 1103515245 # multiplier (a)
addi $t2, $zero, 12345       # increment (c)
addi $t3, $zero, 38          # range (1 to 38)

# LCG algorithm
mul $t4, $t0, $t1            # a * X(n)
add $t4, $t4, $t2            # a * X(n) + c
addi $t5, $zero, 2147483647
and $t0, $t4, $t5     # (a * X(n) + c) mod m, m = 2^31

# Scale to the desired range
addi $t5, $zero, 137438953   # m / 38
div $t6, $t0, $t5            # random number / (m / 38)
addi $t6, $t6, 1             # add 1 to get a number between 1 and 38

# Store the random number in a register (e.g., $s0)
add $s1, $zero, $t6

# Update $rstatus with the new seed value for the next run
add $s2, $zero, $t0
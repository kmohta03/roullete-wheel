addi $t0, $zero, 60
nop
nop
sw $t0, 10($zero)

addi $t1, $zero, 100000000
delay_loop1: 
    addi $t1, $t1, -1
    bne $t1, $zero, delay_loop1

addi $t0, $zero, 10
nop
nop 
nop 
sw $t0, 10($zero)

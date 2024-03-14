.data
enter1:.asciiz"enter lowerbound: "
enter2:.asciiz"enter upperbound: "
gap: .asciiz" "
.text
.globl main
main:
li $v0,4
la $a0,enter1
syscall
li $v0,5
syscall
move $t0,$v0
li $v0,4
la $a0,enter2
syscall
li $v0 5
syscall
move $t1,$v0

li $t4,1
j check
check:
bgt $t0,$t1,exit
li $t2,2
ble $t0,$t4,next
move $t3,$t2
j solve
solve:
beq $t3,$t0,print
div $t0,$t3
mfhi $t5
beqz $t5,next
addiu $t3,$t3,1
j solve
print:
li $v0,1
move $a0,$t0
syscall
li $v0,4
la $a0,gap
syscall

j next
next:
addiu $t0,$t0,1
j check
exit:
li $v0,10
syscall

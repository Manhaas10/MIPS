.data
enter: .asciiz "\nenter: "
even: .asciiz "even\n"
odd: .asciiz "odd\n"
.text
.globl main
main:
li $v0,4
la $a0,enter
syscall
li $v0,5
syscall
move $t0,$v0
li $t1,2
div $t0,$t1
mfhi $t1
beqz $t1,print
li $v0,4
la $a0,odd
syscall
j exit
print:
li $v0,4
la $a0,even
syscall
j exit
exit:
li $v0,10
syscall

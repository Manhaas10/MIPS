.data
enter: .asciiz "enter: "
.text
.globl main
main:
li $v0,4
la $a0,enter
syscall
li $v0,5
syscall
move $t0,$v0
li $t1,1
ble $t0,$t1,print
move $t1,$t0
li $t2,1
j fact

fact:
beq $t0,$t2,print
addi $t0,$t0,-1
mul $t1,$t1,$t0
j fact

print:
li $v0,1
move $a0,$t1
syscall
j exit
exit:
li $v0,10
syscall

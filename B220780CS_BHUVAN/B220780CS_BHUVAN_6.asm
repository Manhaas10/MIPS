.data
enter:.asciiz"enter: "
opy:.asciiz "yes "
opn: .asciiz"no "
.text
.globl main
main:
li $v0,4
la $a0,enter
syscall
li $v0,5
syscall
move $t0,$v0

li $t1,0
li $t2,10
j solve
solve:
beqz $t0,print
div $t0,$t2
mflo $t0
mfhi $t3
move $t4,$t3
mul $t3,$t3,$t3
mul $t3,$t3,$t4
add $t1,$t1,$t3

j solve
print:
move $t0,$v0
beq $t1,$t0,yes
li $v0,4
la $a0,opn
syscall
j exit
yes:
li $v0,4
la $a0,opy
syscall
j exit
exit:
li $v0,10
syscall



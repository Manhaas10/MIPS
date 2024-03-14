.data
enter:.asciiz "enter: "
opy: .asciiz " yes "
opn:.asciiz " no "
.text
.globl main
main:
li $v0,4
la $a0,enter
syscall
li $v0,5
syscall
move $t0,$v0
move $t1,$t0

li $t2,0
li $t3,1

j solve
solve:
 beq $t3,$t0,check
 div $t0,$t3
 mfhi $t4
 beqz $t4,inc
 addiu $t3,$t3,1
 j solve
 
 inc:
 add $t2,$t2,$t3
 addiu $t3,$t3,1
 j solve
 check:
 beq $t2,$t0,print
 li $v0,4
 la $a0,opn
 syscall
 j exit
 print:
 li $v0,4
 la $a0,opy
 syscall
 j exit
 exit:
 li $v0,10
 syscall
 



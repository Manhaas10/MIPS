.data
 enter: .asciiz "\nenter: "
 opy:.asciiz "yes, it is palindrome"
 opn:.asciiz"no,it is not palindrome"
.text
.globl main
main:
li $v0,4
la $a0,enter
syscall
li $v0,5
syscall
move $t0,$v0
li $t1,10
li $t2,0
move $t3,$t0
j pali

pali:
beqz $t3,print
div $t3,$t1
mflo $t3
mfhi $t4
mul $t2,$t2,$t1
add $t2,$t4,$t2
li  $v0,1
move $a0,$t2
syscall
j pali

print:
beq $t0,$t2,yes
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


 

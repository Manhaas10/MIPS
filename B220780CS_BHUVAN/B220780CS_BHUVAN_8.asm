.data:
arr: .space 100
msg1: .asciiz "Enter N:"
msg2: .asciiz "Enter integer:"
#msg3: .asciiz "Sum of the numbers is:"
enter: .asciiz "Enter the target: "
nfound: .asciiz "not found "
foun: .asciiz "found " 

.text
main:
li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $s1,$v0

li $t0,0
j input
input:
beq $t0,$s1,end_input
sll $t1,$t0,2
li $v0,4
la $a0,msg2
syscall
li $v0,5
syscall
sw $v0,arr($t1)
addi $t0,$t0,1
j input

end_input:
li $t1,0
li $t0,0
li $v0,4
la $a0,enter
syscall
li  $v0,5
syscall
move $s2,$v0


check:
beq $t0,$s1,notfound
sll $t2,$t0,2
lw $t3,arr($t2)
beq $t3,$s2,found
addi $t0,$t0,1
j check

notfound:
li $v0,4
la $a0,nfound
syscall
j exit
found:
li $v0,4
la $a0,foun
syscall
j exit
exit:
li $v0,10
syscall





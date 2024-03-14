.data
str: .space 33
enter: .asciiz "\nenter: "
output: .asciiz"\nnum: "
.text
.globl main
main:
li $v0,,4
la $a0,enter
syscall

li $v0,8
la $a0,str
li $a1,33
syscall

la $t0,str
li $t1,0
li $t2,1
j convert

convert:
 lbu $t3,0($t0)
 beqz $t3,print
 sub $t3,$t3,'0'
 sll $t1,$t1,1
 add $t1,$t1,$t3
 addiu $t0,$t0,1
 j convert
 print:
 li $v0,4
 la $a0,output
 syscall
 li $v0,1
 move $a0,$t1
 syscall
 j exit
 exit:
 li $v0,10
 syscall
 
 
 

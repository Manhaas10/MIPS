.data
str:.space 150
enter: .asciiz "enter the string: "

.text
.globl main
main:
 li $v0,4
 la $a0,enter
 syscall
 li $v0,8
 la $a0,str
 li $a1,150
 syscall

 
 la $t0,str
 j convert
 convert:
 lb $t1,0($t0)
 beq $t1,$zero,print
 li $t2,'a'
 li $t3,'z'
 li $t4,'A'
 li $t5,'Z'
 blt $t1,$t2,low
 bgt $t1,$t3,store
 sub $t1,$t1,'a'
 add $t1,$t1,'A'
 sb $t1,0($t0)
 addi $t0,$t0,1
 j convert
 low:
 bgt $t1,$t5,store
 blt $t1,$t4,store
 sub $t1,$t1,'A'
 add $t1,$t1,'a'
 j store
 store:
 sb $t1,0($t0)
 addi $t0,$t0,1
 j convert
 print:
 li $v0,4
 la $a0,str
 syscall
 li $v0,10
 syscall
 
 
 
 
 

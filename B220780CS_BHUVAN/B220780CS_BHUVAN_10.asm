
.data
enter: .asciiz "enter the number:"
.text
main:
li $v0,4
la $a0,enter
syscall
 li $v0,5
 syscall
 move $t0,$v0
 move $t3,$t0
 #addi $t4,$zero,-1
 #mul $t3,$t3,$t4
 li $t7,1
 sub $t6,$zero,$t7
 beq $t0,$t7,print0
 beq $t0,$t6,print0
 not $t1,$t2
 addiu $t1,$t1,1
 
 add $t2,$t1,$t0
 
 li $v0,1
 move $a0,$t2
 syscall
 j exit
 print0:
 li $v0,1
 move $a0,$zero
 syscall
 j exit
 exit:
li $v0,10
syscall

 
 
 

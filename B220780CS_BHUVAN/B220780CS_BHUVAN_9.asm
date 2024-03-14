.data:
enter:.asciiz "enter the number: "
result:.asciiz"ans: "
.text

main:
 li $v0,4
 la $a0,enter
 syscall
 li $v0,5
 syscall
 move $t0,$v0
 li $t1,0
 li $t2,1
 li $t4,2
 li $t3,3
 ble $t0,$t2,printr
 #beq $t0,$t3,print
 j fib

fib:
 beq $t0,$t4,print
 add $t3,$t1,$t2
 add $t1,$t2,$zero
 add $t2,$t3,$zero
 addiu $t4,$t4,1
 j fib
printr:
 li $v0,4
 la $a0,result
 syscall
 li $v0,1
 move $a0,$zero
 syscall
j exit
print:
 li $v0,4
 la $a0,result
 syscall
 li $v0,1
 move $a0,$t2
 syscall
j exit
exit:
li $v0,10
syscall
 
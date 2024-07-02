.data
X: .space 60
Y: .space 60
msg1: .asciiz "Enter n: "
msg2: .asciiz "Enter vector X: "
msg3: .asciiz "Enter vector Y: "
msg4: .asciiz "The Dot Product of X and Y is: "
msg5: .asciiz "No vectors to multiply "
       

.text
.globl main

main: 
        li $v0, 4 
        la $a0, msg1
        syscall

        li $v0, 5
	syscall
	addi $t0 ,$v0, 0


	beqz $t0, n_0
                

	la $t1, X 
	la $t2, Y

	li $s0, 0

	li $v0, 4 
	la $a0, msg2
	syscall
        
loop:         	
	li $v0, 6
	syscall 
	swc1 $f0, 0($t1)

	addi $t1, $t1, 4

	addi $s0, $s0, 1
	bne $s0, $t0, loop

	li $s0, 0

	li $v0, 4 
	la $a0, msg3
	syscall

loop2:                 
	li $v0, 6
	syscall 
	swc1 $f0, 0($t2)

	addi $t2, $t2, 4

	addi $s0, $s0, 1
	bne $s0, $t0, loop2

	li $s0, 0

	la $t1, X
	la $t2, Y

	li $t3, 0
	mtc1 $t3, $f0

loop3: 
	lwc1 $f1, 0($t1) 
	lwc1 $f2, 0($t2) 

	mul.s $f1, $f1, $f2
	add.s $f0, $f0, $f1

	addi $t1, $t1, 4
	addi $t2, $t2, 4

	addi $s0, $s0, 1
	bne $s0, $t0, loop3

	li $v0, 4
	la $a0, msg4
	syscall

	mov.s $f12, $f0

	li $v0, 2
	syscall

	jr $ra

n_0: 

	li $v0, 4
	la $a0, msg5
	syscall

	jr $ra
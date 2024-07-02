	.data
msg1: .asciiz "Enter the value of n:"
msg2: .asciiz ","

	.text
	.globl main
main:  	
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $v0, 0($sp)

loop:
	lw $v0, 0($sp)
	ble $v0, $s0 exit
	addi $s0, $s0, 1

	add $a0, $0, $0
	add $a0, $s0, $0
	jal fun

	add $a0, $v0, $0
	li $v0, 1
	syscall

	#comma
	li $v0, 4
	la $a0, msg2
	syscall

	j loop

exit:

	lw $ra, 4($sp)
	add $sp, $sp, 8
	jr $ra

fun:
	addi $t0, $0, 1
	bne $a0, $t0, Label1
	addi $v0, $0, 1
	jr $ra

Label1:
	xor $t0, $0, $0
	addi $t0, $0, 2
	bne $a0, $t0, Label2
	addi $v0, $0, 1
	jr $ra

Label2:
	 addi $sp, $sp, -12
         sw $ra, 8($sp)
         sw $a0, 4($sp)

         addi $a0, $a0, -1
         jal fun

         sw $v0, 0($sp)
         lw $a0, 4($sp)

         addi $a0, $a0, -2
         jal fun

         lw $t1, 0($sp)
         add $v0, $t1, $v0
         lw $ra, 8($sp)
         addi $sp, $sp, 12
         jr $ra 

	
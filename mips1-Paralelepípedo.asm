.data
	msg01: .asciiz"Digite a lagura do paralelepípedo: "
	msg02: .asciiz"Digite a altura do paralelepípedo: "
	msg03: .asciiz"A área do paralelepípedo é: "
.text
.main
	li $v0, 4
	la $a0, msg01
	syscall
	
	li $v0, 5
	syscall
	
	add $t1, $v0, 0
	
	li $v0, 4
	la $a0, msg02
	syscall
	
	li $v0, 5
	syscall
	
	add $t2, $v0, 0
	
	mul $s1, $t1, $t2
	
	li $v0, 4
	la $a0, msg03
	syscall
	
	li $v0, 1
	add $a0, $s1, 0
	syscall
	
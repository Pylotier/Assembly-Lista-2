.data
	msg01: .asciiz"Digite o primeiro número: "
	msg02: .asciiz"Digite o segundo número: "
	msgN1Menor: .asciiz"A diferença do 1° com 2° é: "
	msgN2Menor: .asciiz"A diferença do 2° com 1° é: "
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
	
	blt $t1, $t2, n1Menor
	j n2Menor
n1Menor:
	sub $s1, $t2, $t1
	
	li $v0, 4
	la $a0, msgN1Menor
	syscall
	
	li $v0, 1
	add $a0, $s1, 0
	syscall
	j fimse
n2Menor:
	sub $s1, $t1, $t2
	
	li $v0, 4
	la $a0, msgN2Menor
	syscall
	
	li $v0, 1
	add $a0, $s1, 0
	syscall
fimse:
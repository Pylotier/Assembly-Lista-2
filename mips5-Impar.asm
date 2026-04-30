.data
	msg01: .asciiz"Digite o primeiro 2°número: "
	msg02: .asciiz"Digite o segundo 1ºnúmero: "
	msg03: .asciiz"A soma dos número impares é: "
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
	add $t1, $t1, 1
	
enquantoN1:
	rem $s1, $t1, 2
	bnez $s1, impar_1
voltaEnquantoN1:
	add $t1, $t1, 1
	bgt $t2, $t1, enquantoN1
	j fim
impar_1:
	add $s7, $t1, $s7
	j voltaEnquantoN1

n2Menor:
	add $t2, $t2, 1
enquantoN2:
	rem $s1, $t2, 2
	bnez $s1, impar_2
voltaEnquantoN2:
	add $t2, $t2, 1
	bgt $t1, $t2, enquantoN2
	j fim
impar_2:
	add $s7, $t2, $s7
	j voltaEnquantoN2

fim:
	li $v0, 4
	la $a0, msg03
	syscall
	
	
	li $v0, 1
	add $a0, $s7, 0
	syscall

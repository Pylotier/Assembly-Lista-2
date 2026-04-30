.data
	msg01: .asciiz"Digite o raio do circulo: "
	msg02: .asciiz"O circunferência do circulo é: "
.text
.main
	li $v0, 4
	la $a0, msg01
	syscall
	
	li $v0, 5
	syscall

	add $t1, $v0, 0
	
	li $t0, 2
	#2pr
	mul $s1, $t0, 3
	mul $s2, $s1, $t1
	
	li $v0, 4
	la $a0, msg02
	syscall
	
	li $v0, 1
	add $a0, $s2, 0
	syscall
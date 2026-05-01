.data
	msg01: .asciiz"Digite a lagura do paralelepípedo: "
	msg02: .asciiz"Digite a altura do paralelepípedo: "
	msg03: .asciiz"Digite a profundidade paralelepípedo: : "
	msg04: .asciiz"O volume do paralelepípedo é: "
.text
.main
	li $v0, 4
	la $a0, msg01
	syscall # Perguntar qual a largura
	
	li $v0, 5
	syscall # Esperar input
	
	add $t1, $v0, 0 # Guaradar valor da altura
	
	li $v0, 4
	la $a0, msg02 
	syscall # Perguntar qual a altura
	
	li $v0, 5
	syscall # Esperar input
	
	add $t2, $v0, 0 # Guaradar valor da largura
	
	li $v0, 4
	la $a0, msg03 
	syscall # Perguntar qual a profundidade
	
	li $v0, 5
	syscall # Esperar input
	
	add $t3, $v0, 0 # Guaradar valor da profundidade
	
	# V = a.b.c
	mul $s1, $t1, $t2 # Calculo de área R1 = (L*A)
	mul $s2, $s1, $t3 # Calculo de área (R*P)
	
	li $v0, 4
	la $a0, msg04
	syscall # Falar a área
	
	li $v0, 1
	add $a0, $s2, 0
	syscall # Falar a área do paralelepípedo

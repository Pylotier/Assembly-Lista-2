.data
	msg01: .asciiz"Digite a 1° nota: "
	msg02: .asciiz"Digite a 2° nota: "
	msg03: .asciiz"Digite a 3° nota: "
	msg04: .asciiz"Digite a 4° nota: "
	msg05: .asciiz"Média do aluno: "
	msgAprovado: .asciiz"\nStatus: APROVADO"
	msgExame: .asciiz"\nStatus: EXAME"
	msgRetido: .asciiz"\nStatus: RETIDO\n"
.text
.main
	#NOTA 1
	li $v0, 4
	la $a0, msg01
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#NOTA 2
	li $v0, 4
	la $a0, msg02
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	#NOTA 3
	li $v0, 4
	la $a0, msg03
	syscall
	
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	#NOTA 4
	li $v0, 4
	la $a0, msg04
	syscall
	
	li $v0, 5
	syscall
	add $t4, $v0, 0
		
	#MEIDA
	add $s1, $t1, $t2 # N1+N2
	add $s2, $t3, $t4 # N3+N4
	add $s3, $s1, $s2 # SOMA1 + SOMA2
	
	div $s4, $s3, 4
	
	# a. Se a média for >= 6,0 exibir “APROVADO”;
	# b. Se a média for >= 3,0 ou < 6,0 exibir “EXAME”;
	# c. Se a média for < 3,0 exibir “RETIDO”.
	bge $s4, 6, aprovado
	blt $s4, 6, condicao1
	j retido
aprovado:
	li $v0, 4
	la $a0, msg05
	syscall
	
	li $v0, 1
	add $a0, $s4, 0
	syscall
	
	li $v0, 4
	la $a0, msgAprovado
	syscall
	
	j fimse
condicao1:
	bge $s4, 3, exame
	j retido
exame:	
	li $v0, 4
	la $a0, msg05
	syscall
	
	li $v0, 1
	add $a0, $s4, 0
	syscall
	
	li $v0, 4
	la $a0, msgExame
	syscall
	
	j fimse
retido:
	li $v0, 4
	la $a0, msg05
	syscall
	
	li $v0, 1
	add $a0, $s4, 0
	syscall
	
	li $v0, 4
	la $a0, msgRetido
	syscall
	
	j fimse
fimse:
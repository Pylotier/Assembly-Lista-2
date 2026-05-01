.data
	msg01: .asciiz"Digite o raio do circulo: "
	msg02: .asciiz"O circunferência do circulo é: "
.text
.main
	li $v0, 4 # Perguntar qual o raio
	la $a0, msg01
	syscall
	
	li $v0, 5 # Esperar input do raio
	syscall

	add $t1, $v0, 0 # Guardar o valor do raio
	
	li $t0, 2
	#2pr
	mul $s1, $t0, 3 # r1 = Pi*2
	mul $s2, $s1, $t1 # r2 = r1*raio
	
	li $v0, 4 # Falar o enuncaido da resposta
	la $a0, msg02
	syscall
	
	li $v0, 1 # Falar a circuferencia do circulo
	add $a0, $s2, 0
	syscall

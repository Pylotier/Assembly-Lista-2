.data
	msg01: .asciiz"Digite um número: "
	msg02: .asciiz"Número negativo, digite novamente\n"
	msgMaiorNumero: .asciiz"Maior número: "
	msgMenorNumero: .asciiz"\nMenor número: "
.text
.main
	li $t1, 0
enquanto:
	li $v0, 4
	la $a0, msg01
	syscall
	
	li $v0, 6
	syscall
	
	c.lt.s $f0, $f31 # $f0 < 0
	bc1t menorQueZero
	
	beq $t1, 0, primeiraVez
	
	c.lt.s $f0, $f1 # $f0 < menorNumero
	bc1t mudarMenor # Se VERDADE
	bc1f resFalso # Se FALSO
	
mudarMenor:
	add.s $f2, $f0, $f31
	j voltar
	
resFalso:
	c.le.s $f0, $f1 # $f0 é menor do que maior ou igual a mario numero
	bc1f mudarMaior # Se falso, ele muda o maior com número digitado
	j voltar
	
mudarMaior:
	add.s $f1, $f0, $f31
	j voltar
	
voltar:
	addi $t1, $t1, 1
	blt $t1, 10, enquanto
	j fimEnquanto
	
menorQueZero:
	li $v0, 4
	la $a0, msg02
	syscall
	j enquanto
	
primeiraVez:
	add.s $f1, $f0, $f31 # MAIOR NÚMERO
	add.s $f2, $f0, $f31 # MENOR NÚMERO
	j voltar
fimEnquanto:
	li, $v0, 4
	la $a0, msgMaiorNumero
	syscall
	
	add.s $f12, $f1, $f31
	
	li $v0, 2
	syscall
	
	li, $v0, 4
	la $a0, msgMenorNumero
	syscall
	
	add.s $f12, $f2, $f31
	
	li $v0, 2
	syscall


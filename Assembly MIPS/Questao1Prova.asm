# Expressão: Z = [(XA^600)/(B)]^Y
# A = $a0
# B = $a1
# X = $a2
# Y = $a3
# Variavel retornada é Z pelo $v0

	addi $sp, $sp, -24	# Abrindo o espaço na pilha
	sw $a0, 0 ($sp)		# Armazenando as variaveis na pilha \/
	sw $a1, 4 ($sp)		#		||
	sw $a2, 8 ($sp)		#		||
	sw $a3, 12 ($sp)	#		||
	sw $ra, 16 ($sp)	# Armazenando a variavel de retorno
	
	# ---- P A R A M E T R O S ----
	
	lw $a2, 0 ($sp)		# A 
	lw $a3, 8 ($sp)		# X 
	jal MULT
		sw $v1, 20 ($sp)	#Empilhando o valor da multiplicação XA 
		
	addi $a0, $zero, 600	# Guardando 600 em $t1 para potenciação
	lw $a2, 20 ($sp)		# Pegando o valor de X.A
	jal POT			# XA^600
		sw $v0, 20 ($sp)	#Armazenando o valor de XA ^ 600
		lw $a3, 20 ($sp)
		lw $a1, 4 ($sp)		# Pegando a variavel para fazer a divisão
	jal DIV
		sw $v1, 20($sp)		# Empilhando o valor de XA^600/B 
		lw $a0, 12 ($sp)
		sw $a2, 20 ($sp)
	jal POT			
		lw $ra, 16 ($sp)
		addi $sp, $sp, 24	#Quebrando a pilha
		jr $ra
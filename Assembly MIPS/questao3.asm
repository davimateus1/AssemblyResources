# Proc1 retorna inteiros -> {$v0 = a, $v1 = V[4]}
# M[] = $a0; V[] = $a1, i = $a2, j = $a3
# Iremos usar $t0 até $t7
# Load: ler,

Proc1:
	addi $t0, $zero, 3	# a = 3
	addi $t1, $zero, 6	# b = 6
	
	# if
	
	addi $t2, $zero, 4	# V[4]
	add $t2, $t2, $t2
	add $t2, $t2, $t2	# achando o endereço 4 x [4]
	add $t2, $t2, $a1	# new adress
	lw $t3, 0 ($t2)		# guarda o valor de V[4] em $t3
	slt $t4, $t3, $t1	# $t1 >= $t3 / 1 é menor, 0 é maior ou igual
	beq $t4, $zero, Final	# Se o $t4 == 0, finaliza o loop

Loop:	
	addi $t5, $zero, $t5
	add $t5, $t5, $t5
	add $t5, $t5, $t5	# achando o endereço 4 * [5]
	add $t5, $t5, $a0	# New adress
	lw $t6, 0 ($t5)		# Guarda o valor de M[5] em $t6
	
	addi $sp, $sp, -36	# criando espaço na pilha
	sw $a0, 0 ($sp)		# Salva M[] na pilha
	sw $a1, 4 ($sp)		# Salva V[] na pilha
	sw $a3, 8 ($sp)		# Salva J na pilha
	sw $t0, 12 ($sp)	# Salva a na pilha
	sw $t1, 16 ($sp)	# Salva b na pilha
	sw $t2, 20 ($sp)	# Salva V[4] na pilha	
	sw $t6, 24 ($sp)	# Salva o valor de M[5] na pilha
	sw $ra, 32 ($sp)	# Salva o retorno
	add $a2, $t0, $zero	# Salvando o valor de a em $a2
	add $a3, $t0, $zero	# Salvando o valor de b em $a3
	jal Proc2		# Pula pro proc2
	sw $v0, 28 ($sp)	# Salva Proc2 na pilha
	lw $t0, 16 ($sp)	# Guarda valor de B em $t0
	jal Proc3		# Pula pro proc3
	add $t7, $zero, $v0	# adicionando valor de proc3
	lw $t1,28($sp)		# guarda o valor de proc2 em $t1
	add $t3, $zero, $t3
	add $t2, $t2, $zero
Loop2:
	beq $t7, $t2, Saida2	# Se $t0 = $t2 finaliza o loop
	add $t3, $t3, $t1	# $t3 + Proc2
	addi $t2, $zero, 1		
	j loop2			# retornando ao loop2
Saida2:
	lw $t4, 24 ($sp)	# Guarda o valor de M[5] em $t4
	slt $t5, $t3, $t4       # Se Proc2 x Proc3 < M[5]
	beq $t5, $zero, Saida	# Se o $t4 == 0, finaliza o loop	
	lw $t6, 12 ($sp)	# guarda o valor de a na pilha
	lw $t7, 16 ($sp)	# guarda o valor de b na pilha 
	add $t0, $t4, $t7	# a = M[5] + b	
	lw $a0, 0 ($sp)		# Salva M[] na pilha
	lw $a1, 4 ($sp)		# Salva V[] na pilha
	lw $a3, 8 ($sp)		# Salva J na pilha
	lw $t1, 16 ($sp)	# Salva b na pilha
	lw $t2, 20 ($sp)	# Salva V[4] na pilha
	lw $ra, 32 ($sp)	
	addi $sp, $sp, 36
	j Loop			# Volta ao loop
Saida:
	addi $sp, $sp, -20	# criando espaço na pilha
	sw $a1, 0 ($sp)		# Salva V[] na pilha
	sw $a3, 4 ($sp)		# Salva J na pilha
	sw $t0, 8 ($sp)		# Salva a na pilha
	sw $t1, 12 ($sp)	# Salva b na pilha
	sw $ra, 16($sp)		# Retorno
	add $a0, $zero, $t1	# Guarda o valor de b em $a0
	jal Proc3		# Pula pra proc 3
	lw $a3, 4 ($sp)		# guarda o valor de J na pilha
	lw $a2, 8 ($sp)		# guarda o valor de a na pilha
	sw $v0, 20 ($sp)	# Salva proc 3
	jal Proc2		# pula pra proc2
	add $t0, $zero, $v0	# adicionando $v0 a $t0 
	lw $t1, 20 ($sp)	
	lw $a1, 0  ($sp)
	lw $t2, 12 ($sp)
	lw $ra, 16 ($sp)	# guarda retorno
	addi $sp, $sp, 24	# quebra a pilha	
	
	add $t4, $t4, $zero
Loop3:
	slt $t5, $t1, $t0
	beq $t4, $zero, Saida3	# Se $t0 = $t2 finaliza o loop
	sub $t1, $t1, $t0	# proc3 - proc2
	addi $t4, $zero, 1		
	j Loop3			# retornando ao loop3
	
Saida3: 
	sw $t4, 0 ($t2)		# Salva o novo valor de V[4] na pilha	
	
Final:
	add $v0, $zero, $t0
	lw $t3, 0($t2)		# Guarda o valor de V[4] em $t3
	add $v1, $zero, $t3	
	jr $ra			# Retorno $ra		
# Save = $a0, Test = $a1, I = $a2, J = $a3
# Iremos trabalhar com $t0 até $t7

loop:
	add $t0, $t0, $a2
	add $t0, $t0, $t0	# Achando o endereço 4 x i
	add $t0, $t0, $a0	# Novo endereço de Save[i]
	lw $t1, 0 ($t0)		# Guardando o valor de Save[i]($t0) em $t1
	add $t2, $t2, $a3
	add $t2, $t2, $t2	# Achando o endereço 4 x j
	add $t2, $t2, $a1	# Novo endereço de Test[j] em $t3
	lw $t3, 0 ($t2)		# Guardando o valor de Test[j]($a1) em $t3 
	beq $t1, $t3, Exit	# Se o save for igual ao test, ele sai
	beq $a2, $a3, If	# Se o I for igual ao J, ele chama o If
	bne $a2, $a3, Else	# Se o I for diferente do J, ele chama o Else
	add $a2, $a2, $a3 	# I + J
	j loop			# Retorna o Loop	
If:
	addi $t4, $a2, 1
	add $t4, $t4, $t4
	add $t4, $t4, $t4
	add $t4, $t4, $a0
	lw $t5, 0 ($t4)
	addi $t5, $t5, 2
	sw $t5, 0 ($t0)
	jr $ra			# retorna
Else:
	addi $t4, $a2, 1
	add $t4, $t4, $t4
	add $t4, $t4, $t4
	add $t4, $t4, $a0
	lw $t5, 0 ($t4)
	subi $t5, $t5, 2
	sw $t5, 0 ($t0)
	jr $ra			#retorna
Exit: 
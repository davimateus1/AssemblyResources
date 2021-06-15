# Vetor = $a0
# O proc1 retorna o resultado da média = $v0

Proc1:
	
	# Soma dos valores
	
	addi $t0, $zero, 10	# Limite
	add $t1, $zero, $t1	# Contador									
loop:
	beq $t0, $t1, Exit	# Se o $t0 e o $t1 forem iguais, encerra o loop
	add $t2, $zero, $t1
	add $t2, $t2, $t2
	add $t2, $t2, $t2	# achando o endereço 4 x I
	add $t2, $t2, $a0	# Novo endereço
	lw $t3, 0 ($t2)		# Guarda o valor de V[i] em $t3
	add $t4, $t4, $t3	# Soma valoress de V[i]
	addi $t1, $zero, 1	# adiciona 1 ao $t2 (Contador)
	j loop
Exit:
			
	#Divisão de valores
	
	addi $t0, $zero, 10
	add $t1, $zero, $t1
loop2:
	beq $t0, $t1, Exit2
	sub $t4, $t4, $t0	# soma 10
	addi $t1, $zero, 1	# contador +1
	j loop2			# volta para o loop2
Exit2:
	add $v0, $zero, $t1	# add $t1 a $v0
	j $ra			# return $ra

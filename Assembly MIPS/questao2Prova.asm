# Array[] = $a0
# B = $a1 
# Matriz[] = $a2
# A = $a3
# Irei utilizar os registradores $t0 até $t7

Proc1:
	While:
		addi $t1, $zero, 6	# Adicionando 6 ao $t1 para depois poder guarda-lo no Array
		add $t1, $t1, $t1	
		add $t1, $t1, $t1	# Pegando o endereço 4 x [6]
		add $t1, $t1, $a0	# Array [6]
		add $s4, $zero, $t1	# Guardando no registrador S
		addi $t2 $zero, 7	# Adicionando 7 ao $t2 para depois poder guarda-lo na Matriz
		add $t2, $t2, $t2	
		add $t2, $t2, $t2	# Pegando o endereço 4 x [7]
		add $t2, $t2, $a2	# Matriz [7]
		lw $s0, 0 ($t1)		# Lendo o valor de Array [6] e guardando ele no $s0  
		lw $s1, 0 ($t2)		# Lendo o valor de Matriz [7] e guardando ele no $s1
		slt $t0, $a3, $a1	# Se B > A, guarda o resultado em $t0
		slt $t3, $s0, $s1	# Se Array[6] < Matriz[7] guarda o resultado em $t3
		slt $t4, $s0, $a1	# Se B >= Array [6] guarda o resultado em $t4
		and $t4, $t3, $t4	# Se a condição && for verdadeira, guarde o valor em $t4
		or $t3, $t0, $t4 	# Se a condição || for verdadeira, guarde o valor em $t3
		bne $t3, $zero, Acaba
		add $a0, $zero, $s0
			
		jal Proc3
			add $s2, $zero, $v1	# Adicionando ao $s2 o $v1
		
			
		add $a2, $zero, $s1		# Adicionando ao $a2 o $s1		
		jal Proc2
			add $s3, $zero, $v0	# Adicionando ao $s3 o $v0
			
		sub $t0, $s2, $s3	# Subtraindo os valores dos Registradores S e guardando em $t0			
		sw $t0, 0 ($s4)
		j Proc1		# jump pro Proc1
		
	Acaba:
		lw $v0, 0 ($s4)
		jr $ra		# Retornando 
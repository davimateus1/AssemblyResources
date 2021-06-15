# O retorno de proc 1 são inteiros, $v0
# Matriz, vetor, i, j -> $a0,$a1,$a2,$a3 respectivamente

    Proc1:
          addi $sp, $sp, -24        # Criando espaço na pilha
          add $t0, $a2, $zero       # Guardando o valor de I
          add $t1, $a3, $zero       # Guardando o valor de J
          sw $t0, 0($sp)            # Salvando I na pilha
          sw $t1, 4($sp)            # Salvando J na pilha 
          Loop:
              lw $t0, 0($sp)        # guardando valor de I
              add $t4, $t0, $t0     # x 2i
              add $t4, $t4, $t4     # x 4i
              add $t4, $t4, $t4     # x 8i
              add $t5, $t1, $t1 
              add $t5, $t5, $t1     # x 3j             
              add $t6, $t5, $t4     # 8i + 3j
              lw $t2, $t6 ($a1)
              add $t7, $t1, $t1 
              add $t7, $t7, $t7
              lw $t3, $t7 ($a0)
              slt $t4, $t3, $t2     # M[4j] < V[8i + 3j] = 1
              beq $t4, $zero, EXIT  # Se $t4 for igual a 0, fim do loop
              add $a2, $t2, $zero   # colocar em a2 o valor de t2
              jal proc2             # pulando pra proc2
              sw $v0, $t7($a0)      # atualiza o valor de M[4j]
              add $a0, $t1, $zero   # mandando o valor de t1 pra a0
              jal proc3             # pulando pra proc3
              add $t7,$t0,$v0       # i + proc3(j)
              sw $t7, 4($sp)        # atualiza o valor de j
              j Loop                # volta para o loop
    Exit: 
         lw $ra,8($sp)              # guarda retorno em $ra
         lw $v0, 4 ($sp)            # guarda valor de j em $v0
         addi $sp, $sp, 20	    # 
         Jr $ra                     # retorna $ra
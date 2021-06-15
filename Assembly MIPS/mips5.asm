
.data
      saudacao: .asciiz "Olá, forneça a sua idade: "
      saida: .asciiz "Sua idade é: "
      
      
      
.text
      #Leitura de inteiros exemplo
      li $v0,4 #Imprime uma String
      la $a0, saudacao #movendo o saudacao para o LOAD ADRESS, la
      syscall 
      
      li $v0, 5 #Leitura de inteiros
      syscall
      
      move $t0, $v0 #o valor fornecido está em $t0
      
      li $v0, 4 #Imprime uma String
      la $a0, saida
      syscall 
      
      li $v0, 1
      move $a0,$t0 #movendo oque está em $t0 para $a0
      syscall
      
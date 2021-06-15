.data

      msg: .asciiz "Informe um número: "
      ehpar: .asciiz "O número é par."
      ehimpar: .asciiz "O número é impar."
      
.text

      #imprimindo mensagem para o usuário
      li $v0,4
      la $a0, msg
      syscall
      
      #ler o numero
      li $v0, 5
      syscall
      
      li $t0, 2
      div $v0, $t0
      
      mfhi $t1 #Possi o resto da divisao por 2
      
      beq  $t1, $zero, imprimePar
      li $v0, 4
      la $a0, ehimpar
      syscall
      
      #encerrar o programa      
      li $v0, 10
      syscall
      
      imprimePar:
                li $v0,4
                la $a0, ehpar
                syscall
      
      


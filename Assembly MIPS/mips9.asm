.data

      msg: .asciiz "Informe um n�mero: "
      ehpar: .asciiz "O n�mero � par."
      ehimpar: .asciiz "O n�mero � impar."
      
.text

      #imprimindo mensagem para o usu�rio
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
      
      


.data
     
     msg: .asciiz "Forneça um número decimal; " 
     zero: .double 0.0

.text

     #Imprimindo mensagem para o usuário
     li $v0, 4
     la $a0, msg
     syscall    
     
     #lendo o numero
     li $v0, 7 
     syscall #Valor lido estará em $f0
     
     ldc1 $f2, zero
     add.d $f12, $f2, $f0
     
     #imprimindo o numero
     li $v0, 3
     syscall
     
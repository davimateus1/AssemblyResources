.data
     
     msg: .asciiz "Forne�a um n�mero decimal; " 
     zero: .double 0.0

.text

     #Imprimindo mensagem para o usu�rio
     li $v0, 4
     la $a0, msg
     syscall    
     
     #lendo o numero
     li $v0, 7 
     syscall #Valor lido estar� em $f0
     
     ldc1 $f2, zero
     add.d $f12, $f2, $f0
     
     #imprimindo o numero
     li $v0, 3
     syscall
     
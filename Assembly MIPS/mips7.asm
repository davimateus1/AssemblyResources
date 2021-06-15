#Pontos Flutuantes, float precisa de 32 bits para ser armazenado, double precisa de 64
.data
     msg: .asciiz "Forneça um número decimal: "
     zero: .float 0.0

.text
     #Imprimindo a msg para o usuário
     li $v0, 4
     la $a0, msg
     syscall
     
     #Lendo o número
     li $v0, 6 
     syscall #O valor lido estará em $f0
     
     lwc1 $f1, zero #Load word Coprocessador 1 -> $f1 agora tem o valor 0
     add.s $f12, $f1, $f0
     
     #Imprimindo o numero
     li $v0, 2
     syscall

#Aula 5


.data
      idade: .word 18
.text

     li $t0, 100 #armazenando o valor 100 em $t0
     li $t1, 30
     sub $t2,$t0,$t1 # Armazenando na variavel $t2 o valor da subtração de $t0 e $t1, sub é usado quando temos duas variaveis
     subi $t3,$t2,30 # Armazenando na variavel t3 o valor da variavel $t2 - 30, subi é usado quando temos apenas uma variavel
     

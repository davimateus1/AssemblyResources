#Leitura de Strings

.data
     
     pergunta: .asciiz "Qual � o seu nome?"
     saudacao: .asciiz "Ol�, "
     nome: .space 25 # variavel nome que suporta at� 25 caractares, o space � utilizado para determinar isso

.text

     #Impress�o da pergunta
     li $v0, 4
     la $a0, pergunta
     syscall
     
     #Leitura do nome (String)
     li $v0, 8
     la $a0, nome
     la $a1, 25
     syscall
     
     #Impress�o da Sauda��o
     li $v0, 4
     la $a0, saudacao
     syscall
     
     #Imprime o nome
     li $v0, 4
     la $a0, nome
     syscall
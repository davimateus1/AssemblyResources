#Leitura de Strings

.data
     
     pergunta: .asciiz "Qual é o seu nome?"
     saudacao: .asciiz "Olá, "
     nome: .space 25 # variavel nome que suporta até 25 caractares, o space é utilizado para determinar isso

.text

     #Impressão da pergunta
     li $v0, 4
     la $a0, pergunta
     syscall
     
     #Leitura do nome (String)
     li $v0, 8
     la $a0, nome
     la $a1, 25
     syscall
     
     #Impressão da Saudação
     li $v0, 4
     la $a0, saudacao
     syscall
     
     #Imprime o nome
     li $v0, 4
     la $a0, nome
     syscall
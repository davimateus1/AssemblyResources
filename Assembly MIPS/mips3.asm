.text 
      #Multiplicação em Assembly


      li $t0, 12
      addi $t1, $zero, 10
      
      #Estou guardando o valor da multiplicação no $s0
      mul $s0,$t0,$t1
      
      li $v0,1
      
      #Estou movendo o $s0 para o $a0 para exibir o número
      move $a0,$s0   
      syscall
      
      #-------------------------------------------------------
      #Shift Left Logico 
      sll $s1,$t1,10 # 10 x 2^10 -> 10 x 1024 = 10240
      
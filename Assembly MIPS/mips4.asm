.text
      # Divisão de Inteiros -> div
      
      li $t0, 32
      li $t1, 5
      
      srl $s2, $t0, 2 # srl so pega a parte inteira -> 32 / 2^2 -> 32 / 4 = 8
      
      div $t0,$t1 # Dividindo 32 por 5
      
      #Pegando a parte inteira da divisão e colocando em $s0
      mflo $s0
      
      #Pegando o resto da divisão e colocando em $s1
      mfhi $s1 
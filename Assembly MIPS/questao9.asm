# AZUL - $a1
# AMARELA - $a2
# VERDE - $a3

.main:	
	addi $a1, $zero, 3
	add $a0, $zero, $a1
	jal calculaGanhos
	add $t0, $zero, $v0
	addi $a1, $zero, 2
	jal calculaGanhos
	add $t1, $zero, $v0
	addi $a3, $zero, 5
	jal calculaGanhos
	add $t2, $zero, $v0
	add $t3, $zero, $t0
	add $t3, $t3, $t1
	add $t3, $t3, $t2
	j Exit
	
calculaGanhos:
	add $t1, $zero, $t1
	add $t4, $zero, $t4
	Loop:
		beq $a0, $t4, Exit2
		addi $t4, $t4, 500
		addi $t1, $zero, 1
	j Loop
	Exit2:
		add $v0, $zero, $t5
		jr $ra

Exit: 	
		
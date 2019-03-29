.data
	array: .word 0,1,1,1,0,0,0,1,1,1,0,1,1,0,0
	size: .word 15
	
.text
	la $t0,array		
	la $t1,array
	lw $t2,size		
	add $t3,$zero,$zero	#Counter 1
	li $s0,0		#Number of zeros
	li $s1,0		#Number of ones
	
	countele:
		bge $t3,$t2,segregation
		lw $t5,($t0)
		seq $t6,$t5,0
		add $s0,$s0,$t6
		seq $t6,$t5,1
		add $s1,$s1,$t6
		addi $t3,$t3,1
		addi $t0,$t0,4
		j countele
	
	segregation:
		li $t4,1
		group0:
			ble $s0,0,group1
			sw $zero,($t1)
			addi $s0,$s0,-1
			addi $t1,$t1,4
			j group0
			
		group1:
			ble $s1,0,End
			sw $t4,($t1)
			addi $s1,$s1,-1
			addi $t1,$t1,4
			j group1
		
	End:
		la $t0,array
		lw $t1,size
		li $t2,0
		print:
			bge $t2,$t1,endofprint
			lw $a0,($t0)
			li $v0,1
			syscall
			addi $t2,$t2,1
			addi $t0,$t0,4
			j print
		endofprint:
			li $v0,10
			syscall
.data
	array: .word 0,4,8,9,1,2,4,5,5,5,0,0
	size: .word 12
.text
		
	li $t0,0	#Count For size
	lw $t1,size	#Size of array 
	li $s0,4	#Element to search
	la $t2,array	#Address of Array
	li $s1,0	#count for element
	
	countele:
		bge $t0,$t1,End
		lw $t4,($t2)
		seq $t5,$t4,$s0
		add $s1,$s1,$t5
		addi $t0,$t0,1
		addi $t2,$t2,4
		j countele
		
	End:
		li $v0,10
		syscall		
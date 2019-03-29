.data
	string: .asciiz "iittirupati"
	size: .word 11
.text
	la $t0,string
	la $t1,string
	lw $t2,size
	addi $t3,$t2,-1
	add $t1,$t1,$t3
	
	swap:
		ble $t1,$t0,End
		lb $s0,($t0)
		lb $s1,($t1)
		sb $s1,($t0)
		sb $s0,($t1)
		addi $t0,$t0,1
		addi $t1,$t1,-1
		j swap
		
	End:
		la $a0,string
		li $v0,4
		syscall
		li $v0,10
		syscall
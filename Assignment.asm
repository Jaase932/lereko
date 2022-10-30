# NAME:		 LEREKO
# SURNAME:   RAMATABOE
# STUDENT NO:202003168
# DATE:      28/10/2022



.data

.text
	main:
	
	li	$t9, 0  # $t9 for count
	li  $t8, 0  # $t8 for x
	
	for2:
		bge	$t9, 10,Exit
		
		jal	isPrime
		
		
		if2:
			beq	$v1,1,num_is_prime    # if prime is reversible jump to prime
			beq $v1, 0, jump_to_for2
			
	
	
	li	$v0, 10
	syscall
Exit:
	li	$v0, 10
	syscall	
isPrime:
	
	if:                         #check num is equal to 1 or zero
		beq $a2,0,return0
		beq $a2,1, return0
		
	li	 $t3, 2
	div	 $t5,$a2,2
	for:
		bgt	 $t3,$t5,return1
		div  $t2, $a2, $t3
		if3:
		beq  $t2, 0, return0
		addi $t3,$t3,1
		
		j	for
		
	jr $ra

return0:
		li	$v1,0
		
return1:
		li	$v1,1
reverse_num:
	li $t0,0
	
	while:
		beq $a2, 0,return_rev
		div $a1, $a2, 10         # a2 is num and a1 is rev
		mul $t0, $t0, 10
		add $t0, $t0, $a1
		div	 $a2, $a2, 10
		j	while
		
	jr $ra	
		
return_rev:
		add $v1, $zero, $a1
		
num_is_prime:
		mul $a2, $t8, $t8   # t4 is square
		move $t4, $a2        # store square into t4
		jal reverse_num
		move $t0, $v1      # store reverse into t0
		if4:
			bne $a2, $t0, not_palindrome  # if not palindrome jump to not_palindrome
			beq $a2, $t0, jump_to_for2    # if palindrome return to main loop (for2)
		
		
not_palindrome:
		li $t1,0                           #initializing i to zero
		div $t5, $t0, 2                    # devide reversed square by 2
		for3:							   # iterate for loop
			bgt $t0, $t5, jump_to_for2     # if i greater less than reversed square iterate 
			mul $t6, $t1, $t1          # t6 equals to i * i
			if5:
				move	$a2, $t1        
				beq	$t0, $t6, is_square 
				bne $t0, $t6, jump_to_for3
is_square:
		jal	isPrime
		beq $v1, 1, print
		bne $v1, 1, jump_to_for2
		
jump_to_for3:
		addi $t6, $t6, 1
		j	for3
print:
	li $v0, 1
	move $a0, $t4    # t4 is square
	syscall
	addi $t9, $t9, 1
	addi $t8, $t8, 1
	j for2
		
jump_to_for2:
			addi	$t8, $t8, 1
			j	for2

	.text
	.globl	main
main:
        subq    $8, %rsp        # alignement
	
        
        
        xorq    %rax, %rax      # sortie avec code 0
        addq    $8, %rsp
	ret

        .data
format:
	.string	"xxx"

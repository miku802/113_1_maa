	.text
	.globl	main
main:
        subq    $8, %rsp        # alignement
        
	movq	$format, %rdi   # premier argument (format)
        movq    $42, %rsi       # second argument (n)
        xorq    %rax, %rax      # %rax = 0 = pas de registres vecteurs
	call	printf

        xorq    %rax, %rax      # sortie avec code 0
        addq    $8, %rsp
	ret

        .data
format:
	.string	"a = %d\n"



	.text
	.globl	main

## int isqrt(int n) {
##   int c = 0, s = 1;
##   while (s <= n) {
##     c++;
##     s += 2*c + 1;
##   }
##   return c;
## }

isqrt:
        xorq    %rax, %rax      # c dans %rax (car return c à la fin)
        movq    $1, %rcx        # s dans %rcx (caller-save)
        jmp     T1
L1:     incq    %rax
        leaq    1(%rcx, %rax, 2), %rcx
T1:     cmpq    %rdi, %rcx      # s <= n ?
        jle     L1
        ret

## int main() {
##   int n;
##   for (n = 0; n <= 20; n++)
##     printf("sqrt(%2d) = %2d\n", n, isqrt(n));
##   return 0;
## }

main:
        pushq   %rbx            # sauvegarde %rbx et aligne la pile
        movq    $0, %rbx        # n dans %rbx (callee-save)
L2:     movq    %rbx, %rdi
        call    isqrt
        movq	$format, %rdi   # premier argument (format)
        movq    %rbx, %rsi      # deuxième argument (n)
        movq    %rax, %rdx      # troisième argument (isqrt(n))
        xorq    %rax, %rax      # %rax = 0 = pas de registres vecteurs
	call	printf
        incq    %rbx            # n++
        cmpq    $20, %rbx       # n <= 20 ?
        jle     L2
        xorq    %rax, %rax      # sortie avec code 0
        popq    %rbx
	ret

        .data
format:
	.string	"sqrt(%2d) = %2d\n"


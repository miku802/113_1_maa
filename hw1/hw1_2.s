        .text
        .globl main
main:
        subq    $8, %rsp

        # 4 + 6
        movq    $4, %rsi
        addq    $6, %rsi
        leaq    format, %rdi
        xor     %rax, %rax  
        call    printf

        # 21 * 2
        movq    $21, %rsi
        imulq   $2, %rsi
        leaq    format, %rdi
        xor     %rax, %rax  
        call    printf

        # 4 + 7 / 2
        movq    $7, %rax    
        movq    $2, %rbx
        idivq   %rbx        # 進行除法 7 / 2，結果放在 %rax
        addq    $4, %rax    # 4 + (7 / 2)
        movq    %rax, %rsi  # 將結果放入 %rsi
        leaq    format, %rdi
        xor     %rax, %rax  # 設置%rax為0
        call    printf

        # 3 - 6 * (10 / 5)
        movq    $10, %rax
        movq    $5, %rbx
        idivq   %rbx
        movq    $6, %rbx
        imulq   %rbx, %rax
        movq    %rax, %rbx
        movq    $3, %rax
        subq    %rbx, %rax
        movq    %rax, %rsi
        leaq    format, %rdi
        xor     %rax, %rax
        call    printf

        xorq    %rax, %rax
        addq    $8, %rsp
        ret

        .data
format:
        .string "n = %d\n"


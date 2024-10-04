        .text
        .globl main
main:
        pushq   %rbp
        movq    %rsp, %rbp
        leaq    fmt_string(%rip), %rdi	        # 將格式字符串地址放入 %rdi
        movq    $42, %rsi			# 將數值 42 放入 %rsi	
        xor     %rax, %rax			# 設置 %rax 為 0，因為 printf 是變參函數
        call    printf			        # 調用 printf 函數

        movq    $0, %rax			# return
        popq    %rbp
        ret

        .data
fmt_string:
        .string "n = %d\n"


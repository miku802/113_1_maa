        .text
        .globl main
main:
        subq    $8, %rsp       # 堆疊對齊

        # true && false
        movq    $1, %rax       # true 放入 %rax
        andq    $0, %rax       # 與 false 進行與操作
        testq   %rax, %rax     # 檢查結果是否為 0
        je      print_false    # 如果為 0，跳轉打印 false
        leaq    true_str(%rip), %rsi  # 如果非零，打印 true
        jmp     print_bool

print_false:
        leaq    false_str(%rip), %rsi # 打印 false

print_bool:
        leaq    bool_format(%rip), %rdi  # 布爾格式化字符串
        xorq    %rax, %rax     # 清空 %rax
        call    printf         # 輸出 "false" 或 "true"

        # if 3 <> 4 then 10 * 2 else 14
        movq    $3, %rax       # 3 放入 %rax
        cmpq    $4, %rax       # 比較 3 和 4
        jne     not_equal      # 如果 3 不等於 4，跳轉
        movq    $14, %rsi      # 如果相等，結果為 14
        jmp     end_if

not_equal:
        movq    $10, %rax      # 如果不等於，計算 10 * 2
        imulq   $2, %rax       # 結果存入 %rax
        movq    %rax, %rsi     # 將結果存入 %rsi

end_if:
        leaq    int_format(%rip), %rdi  # 整數格式化字符串
        xorq    %rax, %rax     # 清空 %rax
        call    printf         # 輸出 20

        # 2 = 3 || 4 <= 2 * 3
        movq    $2, %rax       # 2 放入 %rax
        cmpq    $3, %rax       # 比較 2 和 3
        je      print_true     # 如果相等，跳轉輸出 true

        # 如果 2 != 3，繼續檢查 4 <= 2 * 3
        movq    $2, %rax       # 計算 2 * 3
        imulq   $3, %rax
        cmpq    $4, %rax       # 比較 4 和 2 * 3 (即 6)
        jg     print_true     # 如果 4 <= 6，跳轉輸出 true

        # 否則輸出 false
        leaq    false_str(%rip), %rsi   # 否則輸出 false
        jmp     print_bool2

print_true:
        leaq    true_str(%rip), %rsi    # 輸出 true
        
print_bool2:
        leaq    bool_format(%rip), %rdi  # 布爾格式化字符串
        xorq    %rax, %rax     # 清空 %rax
        call    printf         # 輸出 "true" 或 "false"

        xorq    %rax, %rax
        addq    $8, %rsp
        ret

        .data
int_format:
        .string "n = %d\n"     # 整數格式字符串
bool_format:
        .string "%s\n"         # 布爾值格式字符串

true_str:
        .string "true"
false_str:
        .string "false"

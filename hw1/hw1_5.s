        .text
        .globl main

main:
        pushq   %rbp
        movq    %rsp, %rbp

        # 第一个表达式：let x = 3 in x * x
        movq    $3, x(%rip)     # 将 x 设为 3
        movq    x(%rip), %rax
        imulq   %rax, %rax      # 计算 x * x
        movq    %rax, %rsi      # 将结果传递给 printf 的第二个参数
        leaq    fmt_string(%rip), %rdi  # 格式化字符串传递给 printf 的第一个参数
        xorq    %rax, %rax      # 清空 %rax，表示没有使用向量寄存器
        call    printf          # 调用 printf 打印结果

        # print (let x = 3 in (let y = x + x in x * y) + (let z = x + 3 in z / z))
        movq    $3, x(%rip)     # 将 x 设为 3
        movq    x(%rip), %rax   # x = 3
        addq    %rax, %rax
        movq    %rax, y(%rip)   # y = x + x
        movq    $0, %rax
        addq    $3, %rax
        addq    x(%rip), %rax
        movq    %rax, z(%rip)   # z = x + 3
        movq    x(%rip), %rax
        imulq   y(%rip), %rax   
        movq    %rax, result_2(%rip) # result = x * y
        movq    z(%rip), %rax
        movq    z(%rip), %rbx
        idivq   %rbx
        movq    result_2(%rip), %rbx
        addq    %rbx, %rax
        movq    %rax, %rsi      # 将结果传递给 printf 的第二个参数
        leaq    fmt_string(%rip), %rdi  # 格式化字符串传递给 printf 的第一个参数
        xorq    %rax, %rax      # 清空 %rax，表示没有使用向量寄存器
        call    printf          # 调用 printf 打印结果


        # 程序结束
        movq    $0, %rax        # 返回值 0
        popq    %rbp
        ret

        .data
x:
        .quad 0
y:
        .quad 0
z:
        .quad 0
result_2:
        .quad 0
fmt_string:
        .string "Result = %d\n"  # 用于 printf 的格式化字符串

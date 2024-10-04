        .text
        .globl main

main:
        pushq   %rbp           # 保存基址指针
        movq    %rsp, %rbp     # 设置新的基址指针

        # 将 x 的值加载到寄存器中
        movq    x(%rip), %rax  # %rax = x = 2

        # 计算 y = x * x
        imulq   %rax, %rax     # %rax = x * x
        movq    %rax, y(%rip)  # 将结果存入 y

        # 计算 y + x 并打印结果
        movq    y(%rip), %rax  # %rax = y
        addq    x(%rip), %rax  # %rax = y + x

        # 将结果传递给 printf 函数
        movq    %rax, %rsi     # 将结果作为第二个参数传递
        leaq    fmt_string(%rip), %rdi  # 格式化字符串传递给 %rdi
        xorq    %rax, %rax     # 清空 %rax，表示没有使用向量寄存器
        call    printf         # 调用 printf 函数

        # 结束程序
        movq    $0, %rax       # 返回值 0
        popq    %rbp           # 恢复基址指针
        ret

        .data
x:
        .quad 2                # 初始化 x 为 2
y:
        .quad 0                # 初始化 y 为 0
fmt_string:
        .string "Result = %d\n"  # 用于 printf 的格式字符串

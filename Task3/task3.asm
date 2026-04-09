section .data
    prompt_n    db "Введите количество чисел N: ", 0
    prompt_num  db "Введите число: ", 0
    result_msg  db "Результат: %d", 10, 0
    fmt_in      db "%d", 0
    fmt_str     db "%s", 0

section .bss
    n       resd 1
    count   resd 1
    buffer  resb 32

section .text
    global main
    extern printf, scanf, strlen

main:
    push rbp
    mov rbp, rsp

    mov rdi, prompt_n
    xor eax, eax
    call printf

    mov rdi, fmt_in
    mov rsi, n
    xor eax, eax
    call scanf

    mov dword [count], 0
    mov ebx, [n]

.loop:
    test ebx, ebx
    jz .done

    mov rdi, prompt_num
    xor eax, eax
    call printf

    mov rdi, fmt_str
    mov rsi, buffer
    xor eax, eax
    call scanf

    mov rdi, buffer
    call strlen
    test al, 1
    jnz .odd
    inc dword [count]

.odd:
    dec ebx
    jmp .loop

.done:
    mov rdi, result_msg
    mov esi, [count]
    xor eax, eax
    call printf

    xor eax, eax
    pop rbp
    ret
section .data
    prompt_n    db "N: ", 0
    prompt_num  db "Num: ", 0
    result_msg  db "Result (even numbers count): ", 0

section .bss
    buffer  resb 32
    count   resd 1

section .text
    global _start

%define SYS_READ  0
%define SYS_WRITE 1
%define SYS_EXIT  60
%define STDIN     0
%define STDOUT    1

_start:
    mov rdi, prompt_n
    call print_str
    call read_input
    call atoi
    mov r12, rax
    xor r13, r13

.loop:
    test r12, r12
    jz .done

    mov rdi, prompt_num
    call print_str
    call read_input
    call atoi

    test rax, 1
    jnz .skip
    inc r13

.skip:
    dec r12
    jmp .loop

.done:
    mov rdi, result_msg
    call print_str

    add r13, '0'
    mov [buffer], r13b
    mov byte [buffer+1], 10
    mov rdx, 2
    mov rsi, buffer
    mov rdi, STDOUT
    mov rax, SYS_WRITE
    syscall

    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall

print_str:
    push rdi
    xor rdx, rdx
.len_loop:
    cmp byte [rdi + rdx], 0
    je .print
    inc rdx
    jmp .len_loop
.print:
    mov rsi, rdi
    mov rdi, STDOUT
    mov rax, SYS_WRITE
    syscall
    pop rdi
    ret

read_input:
    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, buffer
    mov rdx, 31
    syscall
    mov byte [buffer + rax], 0
    ret

atoi:
    xor rax, rax
    xor rbx, rbx
    mov rsi, buffer
.next_digit:
    mov bl, [rsi]
    cmp bl, '0'
    jl .exit
    cmp bl, '9'
    jg .exit
    sub bl, '0'
    imul rax, 10
    add rax, rbx
    inc rsi
    jmp .next_digit
.exit:
    ret
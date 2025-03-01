
section .bss
    buffer resb 1024

section .data
    msg db "Enter a message: ", 0
    len equ $ - msg
    quit db "quit", 0

section .text
    global _start

_start :
    jmp input_loop

input_loop:
    ; prompt
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    mov rdi, buffer
    mov rcx, 1024
    xor rax, rax
    rep stosb

    ; read input
    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, 1024
    syscall

    cmp rax, 0
    jl exit

    ; check 'quit'
    mov rdi, buffer
    mov rsi, quit
    mov rcx, 4
    repe cmpsb
    je exit

    ; write input
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    syscall

    jmp input_loop

    ; exit
    exit:
    mov rax, 60
    xor rdi, 0
    syscall
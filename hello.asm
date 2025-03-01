
section .data
    msg db "Hello, World!", 0
    len equ $ - msg

section .text
    global _start

_start:
    ; syscall write
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    ; syscall exit
    mov rax, 60
    xor rdi, rdi 
    syscall
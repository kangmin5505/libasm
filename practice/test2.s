section .data
    hello: db "Hello, world!", 0Ah ; string to write
    hello_len: equ $-hello ; length of string to write

section .text
    global _main

write:
    mov rax, 0x2000004 ; write() syscall number
    mov rdi, 1         ; STDOUT file descriptor
    mov rsi, hello     ; address of string to write
    mov rdx, hello_len ; length of string to write
    syscall            ; call the kernel

    ret                ; return to caller

_main:
    call write         ; call our write function
    mov rax, 0x2000001 ; exit() syscall number
    xor rdi, rdi       ; return 0
    syscall            ; call the kernel
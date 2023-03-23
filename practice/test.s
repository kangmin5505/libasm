section .text
    global _main
    extern _printf
    
_main:
    push rbp
    mov rbp, rsp

    mov esi, 0x1234     ; example integer value
    mov rdi, format     ; pointer to format string
   
    call _printf

    xor rax, rax
    pop rbp
    ret

section .data
    format db "example value: %d", 0
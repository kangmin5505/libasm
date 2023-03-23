; Disassembly of file: ft_strcpy.o
; Thu Mar 23 18:43:31 2023
; Type: Mach-O Little Endian64
; Syntax: NASM
; Instruction set: 80386, x64

default rel

global _ft_strcpy


SECTION ._TEXT.__text align=16 execute                  ; section number 1, code

_ft_strcpy:; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 0004 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 0008 _ 48: 89. 75, F0
        mov     rax, qword [rbp-8H]                     ; 000C _ 48: 8B. 45, F8
        mov     qword [rbp-18H], rax                    ; 0010 _ 48: 89. 45, E8
?_001:  mov     rax, qword [rbp-10H]                    ; 0014 _ 48: 8B. 45, F0
        cmp     byte [rax], 0                           ; 0018 _ 80. 38, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_002                                   ; 001B _ 0F 84, 0000002D
        mov     rax, qword [rbp-10H]                    ; 0021 _ 48: 8B. 45, F0
        mov     rcx, rax                                ; 0025 _ 48: 89. C1
; Note: Immediate operand could be made smaller by sign extension
        add     rcx, 1                                  ; 0028 _ 48: 81. C1, 00000001
        mov     qword [rbp-10H], rcx                    ; 002F _ 48: 89. 4D, F0
        mov     dl, byte [rax]                          ; 0033 _ 8A. 10
        mov     rax, qword [rbp-8H]                     ; 0035 _ 48: 8B. 45, F8
        mov     rcx, rax                                ; 0039 _ 48: 89. C1
; Note: Immediate operand could be made smaller by sign extension
        add     rcx, 1                                  ; 003C _ 48: 81. C1, 00000001
        mov     qword [rbp-8H], rcx                     ; 0043 _ 48: 89. 4D, F8
        mov     byte [rax], dl                          ; 0047 _ 88. 10
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_001                                   ; 0049 _ E9, FFFFFFC6
; _ft_strcpy End of function

?_002:  ; Local function
        mov     rax, qword [rbp-8H]                     ; 004E _ 48: 8B. 45, F8
        mov     byte [rax], 0                           ; 0052 _ C6. 00, 00
        mov     rax, qword [rbp-18H]                    ; 0055 _ 48: 8B. 45, E8
        pop     rbp                                     ; 0059 _ 5D
        ret                                             ; 005A _ C3


SECTION ._LD.__compact_unwind__LD align=8 noexecute     ; section number 2, data

        dq _ft_strcpy                                   ; 0060 _ 0000000000000000 (d)
        dq 010000000000005BH                            ; 0068 _ 010000000000005B 
        dq 0000000000000000H                            ; 0070 _ 0000000000000000 
        dq 0000000000000000H                            ; 0078 _ 0000000000000000 


SECTION ._TEXT.__eh_frame align=8 noexecute             ; section number 3, data

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0080 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 0088 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 0090 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0098 _ $.......
        db 60H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 00A0 _ `.......
        db 5BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00A8 _ [.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00B0 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........



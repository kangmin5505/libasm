; Disassembly of file: ft_strcmp.o
; Thu Mar 23 18:43:31 2023
; Type: Mach-O Little Endian64
; Syntax: NASM
; Instruction set: 80386, x64

default rel

global _ft_strcmp


SECTION ._TEXT.__text align=16 execute                  ; section number 1, code

_ft_strcmp:; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 0004 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 0008 _ 48: 89. 75, F0
?_001:  xor     eax, eax                                ; 000C _ 31. C0
        mov     rcx, qword [rbp-8H]                     ; 000E _ 48: 8B. 4D, F8
        movsx   edx, byte [rcx]                         ; 0012 _ 0F BE. 11
        cmp     edx, 0                                  ; 0015 _ 83. FA, 00
        mov     byte [rbp-11H], al                      ; 0018 _ 88. 45, EF
; Note: Immediate operand could be made smaller by sign extension
        je      ?_002                                   ; 001B _ 0F 84, 0000002D
        xor     eax, eax                                ; 0021 _ 31. C0
        mov     rcx, qword [rbp-10H]                    ; 0023 _ 48: 8B. 4D, F0
        movsx   edx, byte [rcx]                         ; 0027 _ 0F BE. 11
        cmp     edx, 0                                  ; 002A _ 83. FA, 00
        mov     byte [rbp-11H], al                      ; 002D _ 88. 45, EF
; Note: Immediate operand could be made smaller by sign extension
        je      ?_002                                   ; 0030 _ 0F 84, 00000018
        mov     rax, qword [rbp-8H]                     ; 0036 _ 48: 8B. 45, F8
        movsx   ecx, byte [rax]                         ; 003A _ 0F BE. 08
        mov     rax, qword [rbp-10H]                    ; 003D _ 48: 8B. 45, F0
        movsx   edx, byte [rax]                         ; 0041 _ 0F BE. 10
        cmp     ecx, edx                                ; 0044 _ 39. D1
        sete    sil                                     ; 0046 _ 40: 0F 94. C6
        mov     byte [rbp-11H], sil                     ; 004A _ 40: 88. 75, EF
?_002:  mov     al, byte [rbp-11H]                      ; 004E _ 8A. 45, EF
        test    al, 01H                                 ; 0051 _ A8, 01
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_003                                   ; 0053 _ 0F 85, 00000005
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_004                                   ; 0059 _ E9, 00000021

?_003:  mov     rax, qword [rbp-8H]                     ; 005E _ 48: 8B. 45, F8
; Note: Immediate operand could be made smaller by sign extension
        add     rax, 1                                  ; 0062 _ 48: 05, 00000001
        mov     qword [rbp-8H], rax                     ; 0068 _ 48: 89. 45, F8
        mov     rax, qword [rbp-10H]                    ; 006C _ 48: 8B. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        add     rax, 1                                  ; 0070 _ 48: 05, 00000001
        mov     qword [rbp-10H], rax                    ; 0076 _ 48: 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_001                                   ; 007A _ E9, FFFFFF8D
; _ft_strcmp End of function

?_004:  ; Local function
        mov     rax, qword [rbp-8H]                     ; 007F _ 48: 8B. 45, F8
        movzx   ecx, byte [rax]                         ; 0083 _ 0F B6. 08
        mov     rax, qword [rbp-10H]                    ; 0086 _ 48: 8B. 45, F0
        movzx   edx, byte [rax]                         ; 008A _ 0F B6. 10
        sub     ecx, edx                                ; 008D _ 29. D1
        mov     eax, ecx                                ; 008F _ 89. C8
        pop     rbp                                     ; 0091 _ 5D
        ret                                             ; 0092 _ C3


SECTION ._LD.__compact_unwind__LD align=8 noexecute     ; section number 2, data

        dq _ft_strcmp                                   ; 0098 _ 0000000000000000 (d)
        dq 0100000000000093H                            ; 00A0 _ 0100000000000093 
        dq 0000000000000000H                            ; 00A8 _ 0000000000000000 
        dq 0000000000000000H                            ; 00B0 _ 0000000000000000 


SECTION ._TEXT.__eh_frame align=8 noexecute             ; section number 3, data

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 00C0 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 00C8 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 00D0 _ $.......
        db 28H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 00D8 _ (.......
        db 93H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00E8 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F0 _ ........



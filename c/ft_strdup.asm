; Disassembly of file: ft_strdup.o
; Thu Mar 23 18:43:31 2023
; Type: Mach-O Little Endian64
; Syntax: NASM
; Instruction set: 80386, x64

default rel

global _ft_strdup

extern _strlen                                          ; near
extern _malloc                                          ; near


SECTION ._TEXT.__text align=16 execute                  ; section number 1, code

_ft_strdup:; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 32                                 ; 0004 _ 48: 83. EC, 20
        mov     qword [rbp-10H], rdi                    ; 0008 _ 48: 89. 7D, F0
        mov     rdi, qword [rbp-10H]                    ; 000C _ 48: 8B. 7D, F0
        call    _strlen                                 ; 0010 _ E8, 00000000(rel)
; Note: Immediate operand could be made smaller by sign extension
        add     rax, 1                                  ; 0015 _ 48: 05, 00000001
        mov     rdi, rax                                ; 001B _ 48: 89. C7
        call    _malloc                                 ; 001E _ E8, 00000000(rel)
        mov     qword [rbp-18H], rax                    ; 0023 _ 48: 89. 45, E8
        cmp     qword [rbp-18H], 0                      ; 0027 _ 48: 83. 7D, E8, 00
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_001                                   ; 002C _ 0F 85, 0000000D
        mov     qword [rbp-8H], 0                       ; 0032 _ 48: C7. 45, F8, 00000000
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_004                                   ; 003A _ E9, 00000051

?_001:  mov     rax, qword [rbp-18H]                    ; 003F _ 48: 8B. 45, E8
        mov     qword [rbp-20H], rax                    ; 0043 _ 48: 89. 45, E0
?_002:  mov     rax, qword [rbp-10H]                    ; 0047 _ 48: 8B. 45, F0
        cmp     byte [rax], 0                           ; 004B _ 80. 38, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_003                                   ; 004E _ 0F 84, 0000002D
        mov     rax, qword [rbp-10H]                    ; 0054 _ 48: 8B. 45, F0
        mov     rcx, rax                                ; 0058 _ 48: 89. C1
; Note: Immediate operand could be made smaller by sign extension
        add     rcx, 1                                  ; 005B _ 48: 81. C1, 00000001
        mov     qword [rbp-10H], rcx                    ; 0062 _ 48: 89. 4D, F0
        mov     dl, byte [rax]                          ; 0066 _ 8A. 10
        mov     rax, qword [rbp-18H]                    ; 0068 _ 48: 8B. 45, E8
        mov     rcx, rax                                ; 006C _ 48: 89. C1
; Note: Immediate operand could be made smaller by sign extension
        add     rcx, 1                                  ; 006F _ 48: 81. C1, 00000001
        mov     qword [rbp-18H], rcx                    ; 0076 _ 48: 89. 4D, E8
        mov     byte [rax], dl                          ; 007A _ 88. 10
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 007C _ E9, FFFFFFC6

?_003:  mov     rax, qword [rbp-18H]                    ; 0081 _ 48: 8B. 45, E8
        mov     byte [rax], 0                           ; 0085 _ C6. 00, 00
        mov     rax, qword [rbp-20H]                    ; 0088 _ 48: 8B. 45, E0
        mov     qword [rbp-8H], rax                     ; 008C _ 48: 89. 45, F8
?_004:  mov     rax, qword [rbp-8H]                     ; 0090 _ 48: 8B. 45, F8
        add     rsp, 32                                 ; 0094 _ 48: 83. C4, 20
        pop     rbp                                     ; 0098 _ 5D
        ret                                             ; 0099 _ C3
; _ft_strdup End of function


SECTION ._LD.__compact_unwind__LD align=8 noexecute     ; section number 2, data

        dq _ft_strdup                                   ; 00A0 _ 0000000000000000 (d)
        dq 010000000000009AH                            ; 00A8 _ 010000000000009A 
        dq 0000000000000000H                            ; 00B0 _ 0000000000000000 
        dq 0000000000000000H                            ; 00B8 _ 0000000000000000 


SECTION ._TEXT.__eh_frame align=8 noexecute             ; section number 3, data

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00C0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 00C8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 00D0 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 00D8 _ $.......
        db 20H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 00E0 _  .......
        db 9AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00F0 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F8 _ ........



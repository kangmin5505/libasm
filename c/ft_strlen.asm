; Disassembly of file: ft_strlen.o
; Thu Mar 23 18:43:31 2023
; Type: Mach-O Little Endian64
; Syntax: NASM
; Instruction set: 80386, x64

default rel

global _ft_strlen


SECTION ._TEXT.__text align=16 execute                  ; section number 1, code

_ft_strlen:; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 0004 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], 0                      ; 0008 _ 48: C7. 45, F0, 00000000
?_001:  mov     rax, qword [rbp-8H]                     ; 0010 _ 48: 8B. 45, F8
        mov     rcx, qword [rbp-10H]                    ; 0014 _ 48: 8B. 4D, F0
        cmp     byte [rax+rcx], 0                       ; 0018 _ 80. 3C 08, 00
; Note: Immediate operand could be made smaller by sign extension
        je      ?_002                                   ; 001C _ 0F 84, 00000013
        mov     rax, qword [rbp-10H]                    ; 0022 _ 48: 8B. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        add     rax, 1                                  ; 0026 _ 48: 05, 00000001
        mov     qword [rbp-10H], rax                    ; 002C _ 48: 89. 45, F0
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_001                                   ; 0030 _ E9, FFFFFFDB
; _ft_strlen End of function

?_002:  ; Local function
        mov     rax, qword [rbp-10H]                    ; 0035 _ 48: 8B. 45, F0
        pop     rbp                                     ; 0039 _ 5D
        ret                                             ; 003A _ C3


SECTION ._LD.__compact_unwind__LD align=8 noexecute     ; section number 2, data

        dq _ft_strlen                                   ; 0040 _ 0000000000000000 (d)
        dq 010000000000003BH                            ; 0048 _ 010000000000003B 
        dq 0000000000000000H                            ; 0050 _ 0000000000000000 
        dq 0000000000000000H                            ; 0058 _ 0000000000000000 


SECTION ._TEXT.__eh_frame align=8 noexecute             ; section number 3, data

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0060 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 0068 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 0070 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0078 _ $.......
        db 80H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0080 _ ........
        db 3BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0088 _ ;.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 0090 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0098 _ ........



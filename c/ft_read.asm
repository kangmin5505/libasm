; Disassembly of file: ft_read.o
; Thu Mar 23 18:43:31 2023
; Type: Mach-O Little Endian64
; Syntax: NASM
; Instruction set: 8086, x64

default rel

global _ft_read

extern _read                                            ; near


SECTION ._TEXT.__text align=16 execute                  ; section number 1, code

_ft_read:; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 32                                 ; 0004 _ 48: 83. EC, 20
        mov     dword [rbp-4H], edi                     ; 0008 _ 89. 7D, FC
        mov     qword [rbp-10H], rsi                    ; 000B _ 48: 89. 75, F0
        mov     qword [rbp-18H], rdx                    ; 000F _ 48: 89. 55, E8
        mov     edi, dword [rbp-4H]                     ; 0013 _ 8B. 7D, FC
        mov     rsi, qword [rbp-10H]                    ; 0016 _ 48: 8B. 75, F0
        mov     rdx, qword [rbp-18H]                    ; 001A _ 48: 8B. 55, E8
        call    _read                                   ; 001E _ E8, 00000000(rel)
        add     rsp, 32                                 ; 0023 _ 48: 83. C4, 20
        pop     rbp                                     ; 0027 _ 5D
        ret                                             ; 0028 _ C3
; _ft_read End of function


SECTION ._LD.__compact_unwind__LD align=8 noexecute     ; section number 2, data

        dq _ft_read                                     ; 0030 _ 0000000000000000 (d)
        dq 0100000000000029H                            ; 0038 _ 0100000000000029 
        dq 0000000000000000H                            ; 0040 _ 0000000000000000 
        dq 0000000000000000H                            ; 0048 _ 0000000000000000 


SECTION ._TEXT.__eh_frame align=8 noexecute             ; section number 3, data

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 0058 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 0060 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0068 _ $.......
        db 90H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0070 _ ........
        db 29H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ).......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 0080 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0088 _ ........



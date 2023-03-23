; Disassembly of file: main.o
; Thu Mar 23 18:48:00 2023
; Type: Mach-O Little Endian64
; Syntax: NASM
; Instruction set: 8086, x64

default rel

global _main


SECTION ._TEXT.__text align=16 execute                  ; section number 1, code

_main:  ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        xor     eax, eax                                ; 0004 _ 31. C0
        mov     dword [rbp-4H], 0                       ; 0006 _ C7. 45, FC, 00000000
        pop     rbp                                     ; 000D _ 5D
        ret                                             ; 000E _ C3
; _main End of function


SECTION ._LD.__compact_unwind__LD align=8 noexecute     ; section number 2, data

        dq _main                                        ; 0010 _ 0000000000000000 (d)
        dq 010000000000000FH                            ; 0018 _ 010000000000000F 
        dq 0000000000000000H                            ; 0020 _ 0000000000000000 
        dq 0000000000000000H                            ; 0028 _ 0000000000000000 


SECTION ._TEXT.__eh_frame align=8 noexecute             ; section number 3, data

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 0038 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 0040 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0048 _ $.......
        db 0B0H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0050 _ ........
        db 0FH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 0060 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0068 _ ........



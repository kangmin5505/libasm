;   pesudo code for atoi_base
;
;   int    skip_space(char *str) {
;       int idx = 0;
;
;       while (str[idx]) {
;           if (str[idx] != 32 || str[idx] < 9 || str[idx] > 13)
;               break;
;           ++idx;
;       }
;       return idx;
;   }

;   bool    is_possible(char *base, int base_len)
;   {
;       if (base_len == 0 || base_len == 1)
;       	return false;       
;
;       int	    i = 0;
;       bool    check[256];     
;       while (i < 256)
; 		check[i++] = false;

;       while (*base) {
;           if (check[(int)(*base)] == true)
;               return false;
;           if (*base == '+' || *base == '-')
;               return false;
;           if (*base == 32 || (9 <= *base && *base <= 13))
;               return false;
;           ++base;
;       }
;       return true;
;   }

;   int	ft_atoi_base(char *str, char *base)
;   {
;       int idx = skip_space(str);
;       int sign = -1;
;       int base_len = ft_strlen(base);
;       int check_idx = 0;
;       int num = 0;
;       int flow_check = INT_MAX / 10;  
;       if (str[idx] == '-') {
;           sign = 1;
;           ++idx;
;       }
;       if (str[idx] == '+')
;           ++idx;

;       if (!is_possible(base, base_len))
;       	return 0;

;       while (str[idx]) 
;       {
;       	check_idx = 0;
;       	while (check_idx < base_len)
;       	{
;       		if (str[idx] == base[check_idx])
;       		{
;                     if (sign == -1 && (num > flow_check || (-num == flow_check && check_idx > 7)))
;                         return 0;
;                     if (sign == 1 && (num > flow_check || (-num == flow_check && check_idx > 8)))
;                         return 0;
;                      num = num * base_len - check_idx;
;       			break;
;       		}
;       		check_idx++;
;       	}       
;       	if (check_idx == base_len)
;       		break;
;       	idx++;
;       }
;       return sign * num;
;   }
section .text
global  _ft_atoi_base
extern  _ft_strlen

_ft_atoi_base:
    push    rbp
    mov     rbp, rsp
    push    rdi
    push    rsi
    sub     rsp, 24

    ;   call skip_space(str)
    call    .skip_space
    mov     dword [rbp - 24], eax           ;   idx = skip_space(str)
    mov     dword [rbp - 28], 0xffffffff    ;   sign = -1

    ;   call ft_strlen(base)
    mov     rdi, rsi
    call    _ft_strlen
    mov     dword [rbp - 32], eax       ;   base_len
    mov     dword [rbp - 36], 0x00      ;   check_idx
    mov     dword [rbp - 40], 0x00      ;   num
    ; mov     eax, 0x7FFFFFFF
    ; mov     r8w, 0x0a
    ; idiv    r8w
    mov     dword [rbp - 44], 0xccccccc       ;   flow_check

.ft_atoi_base_check_minus:
    mov     r8d, dword [rbp - 24]
    mov     r9, [rbp - 8]
    add     r9, r8
    cmp     byte [r9], 0x2d
    jne      .ft_atoi_base_check_plus

    mov     dword [rbp - 28], 0x01
    inc     dword [rbp - 24]

.ft_atoi_base_check_plus:
    mov     r8d, dword [rbp - 24]
    mov     r9, [rbp - 8]
    add     r9, r8
    cmp     byte [r9], 0x2b
    jne     .ft_atoi_base_check_is_possible

    inc     dword [rbp - 24]

.ft_atoi_base_check_is_possible:
    ; lea     rdi, [rbp - 16]
    ; mov     rsi, [rbp - 32]
    ; call    .is_possible
    ; cmp     eax, 0x00
    ; je      .ft_atoi_base_return_zero

.ft_atoi_base_loop:
    mov     r8d, dword [rbp - 24]
    mov     r9, [rbp - 8]
    add     r9, r8
    cmp     byte [r9], 0x00
    je      .ft_atoi_base_return

    mov     dword [rbp - 36], 0x00

.ft_atoi_base_base_loop:
    mov     r8d, dword [rbp - 32]
    cmp     dword [rbp - 36], r8d
    jnl     .ft_atoi_base_char_not_exist

    mov     r8d, dword [rbp - 24]
    mov     r9, [rbp - 8]
    add     r9, r8

    mov     r8d, dword [rbp - 36]
    mov     r10, [rbp - 16]
    add     r10, r8

    mov     al, byte [r10]
    cmp     byte [r9], al
    jne      .ft_atoi_base_inc_check_idx

.ft_atoi_base_check_overflow:
    cmp     dword [rbp - 28], 0xffffffff
    jne     .ft_atoi_base_check_underflow
    
    mov     r8d, dword [rbp - 44]
    cmp     dword [rbp - 40], r8d
    jg     .ft_atoi_base_return_zero

    mov     eax, dword [rbp - 40]
    imul    eax, 0xffffffff
    cmp     eax, [rbp - 44]
    jne     .ft_atoi_base_calc_num

    cmp     dword [rbp - 36], 0x07
    jg      .ft_atoi_base_return_zero


.ft_atoi_base_check_underflow:
    cmp     dword [rbp - 28], 0xffffffff
    jne     .ft_atoi_base_check_underflow
    
    mov     r8d, dword [rbp - 44]
    cmp     dword [rbp - 40], r8d
    jg     .ft_atoi_base_return_zero

    mov     eax, dword [rbp - 40]
    imul    eax, 0x01
    cmp     eax, [rbp - 44]
    jne     .ft_atoi_base_calc_num

    cmp     dword [rbp - 36], 0x08
    jg      .ft_atoi_base_return_zero
    
.ft_atoi_base_calc_num:
    mov     eax, dword [rbp - 40]
    mov     r8d, [rbp - 32]
    imul    eax, r8d
    mov     r8d, [rbp - 36]
    sub     dword [rbp - 40], r8d
    jmp     .ft_atoi_base_char_not_exist


.ft_atoi_base_inc_check_idx:
    inc     dword [rbp - 36]
    jmp     .ft_atoi_base_base_loop

.ft_atoi_base_char_not_exist:
    mov     r8d, dword [rbp - 32]
    cmp     dword [rbp - 36], r8d
    je      .ft_atoi_base_return

.ft_atoi_base_inc_idx:
    inc     dword [rbp - 24]
    jmp     .ft_atoi_base_loop


.ft_atoi_base_return:
    mov     eax, dword [rbp - 28]
    mov     r9d, dword [rbp - 40]
    imul    eax, r9d

    add     rsp, 40
    pop     rbp
    ret

.ft_atoi_base_return_zero:
    mov     eax, 0x00

    add     rsp, 40
    pop     rbp
    ret

.is_possible:
    push    rbp
    mov     rbp, rsp
    xor     rax, rax

    cmp     dword esi, 0x00
    je      .is_possible_return_false
    cmp     dword esi, 0x01
    je      .is_possible_return_false

    sub     rsp, 260
    mov     dword [rbp - 8], 0x00
    mov     ecx, 255

.is_possible_arr_init:
    cmp     dword [rbp - 8], ecx
    jnl     .is_possible_check_loop

    mov     r8d, dword [rbp - 8]
    lea     r9, [rbp - 12]
    sub     r9, r8
    mov     byte [r9], 0x00

    inc     r8
    mov     [rbp - 8], r8

    jmp     .is_possible_arr_init

.is_possible_check_loop:
    cmp     byte [rdi], 0x00
    je      .is_possible_return_true
    
    mov     r8b, byte [rdi]
    lea     r9, [rbp - 12]
    sub     r9, r8
    cmp     byte [r9], 0x01
    je      .is_possible_return_false

    cmp     byte [rdi], 0x2b    ;   '+'
    je      .is_possible_return_false

    cmp     byte [rdi], 0x2d    ;   '-'
    je      .is_possible_return_false

    cmp     byte [rdi], 0x20
    je      .is_possible_return_false

    cmp     byte [rdi], 0x09
    jl      .is_possible_inc_base

    cmp     byte [rdi], 0x0d
    jg      .is_possible_inc_base

    jmp     .is_possible_return_false

.is_possible_inc_base:
    inc     rdi
    jmp     .is_possible_check_loop

.is_possible_return_false:
    mov     al, 0
    jmp     .is_possible_return

.is_possible_return_true:
    mov     al, 1
    jmp     .is_possible_return

.is_possible_return:
    add     rsp, 260
    pop     rbp
    ret

.skip_space:
    push    rbp
    mov     rbp, rsp

    xor     rax, rax

.skip_space_loop:
    cmp     byte [rdi + rax], 0x00
    jne     .skip_space_return

    cmp     byte [rdi + rax], 32
    je      .skip_space_inc_idx

    cmp     byte [rdi + rax], 9
    jge     .skip_space_inc_idx

    cmp     byte [rdi + rax], 13
    jle     .skip_space_inc_idx
    
    jmp     .skip_space_return

.skip_space_inc_idx:
    inc     rax
    jmp     .skip_space_loop

.skip_space_return:
    pop     rbp
    ret
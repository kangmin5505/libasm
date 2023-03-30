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
;       int	    i = 0;
;       bool    check[255];     
;       if (base_len == 0 || base_len == 1)
;       	return false;       
;       while (i < 255)
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

_ft_atoi_base:
    push    rbp
    mov     rbp, rsp

    pop     rbp
    ret
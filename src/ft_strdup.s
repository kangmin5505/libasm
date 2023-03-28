;   pseudo code for ft_strdup
;
;   #include <string.h>
;   #include <stdlib.h>
;
;   char *ft_strdup(const char *s1) {
;       char *s2 = malloc(strlen(s1) + 1);
;       if (s2 == NULL) {
;           return NULL;
;       }
;       char *ret = s2;
;       while (*s1) {
;           *s2++ = *s1++;
;       }
;       *s2 = '\0';
;       return ret;
;   }
    section .text
    global  _ft_strdup

_ft_strdup:
    push    rbp
    mov     rbp, rsp

    pop     rbp
    ret
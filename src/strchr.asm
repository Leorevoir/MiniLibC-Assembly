%include "include/macro.inc"

section .text
    global strchr

strchr:
    xor     rax, rax            ; clear return value

.loop:
    cmp     byte [rdi], sil     ; sil is the char we are looking for
    je      .found              ; if str[i] == char then jump to .found
    cmp     byte [rdi], 0       ; '\0'
    je      .end                ; if end of string / empty then jump to not_.found

.next:
    inc     rdi                 ; i++
    jmp     .loop

.found:
    mov     rax, rdi            ; return the pointer where char was .found
    ret

.end:
    xor     rax, rax            ; return 0
    ret

; this section is to remove the gcc GNU related warning
section .note.GNU-stack noalloc noexec nowrite

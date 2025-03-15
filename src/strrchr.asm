%include "include/macro.inc"

section .text
    global strrchr

strrchr:
    xor     rax, rax            ; return value
    mov     rdx, rdi            ; save ptr in rdx

loop:
    cmp     byte [rdi], 0       ; str[i] == '\0'
    je      .end                ; jump eq
    cmp     byte[rdi], sil      ; str[i] == char
    jne     .next               ; i++ & continue
    mov     rax, rdi            ; return current adress

.next:
    inc     rdi
    jmp     loop

.end:
    cmp     sil, 0              ; hard case when looking char is not \0
    jne     .ret                ; we return the last occurrence found (or NULL)
    mov     rax, rdi            ; else c == \0 so ptr

.ret:
    ret

; this section is to remove the gcc GNU related warning
section .note.GNU-stack noalloc noexec nowrite

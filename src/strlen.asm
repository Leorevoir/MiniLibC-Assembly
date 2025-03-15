%include "include/macro.inc"

section .text
    global strlen

strlen:
    xor     rax, rax            ; rax = 0 -> length

.loop:
    cmp     byte [rdi], 0       ; str[i] is \0 ?
    je      .end                ; if equal to 0, jump to .end
    inc     rdi                 ; rdi = rdi + 1
    inc     rax                 ; rax = rax + 1
    jmp     .loop               ; jump to .loop

.end:
    ret                         ; return rax -> length

; this section is to remove the gcc GNU related warning
section .note.GNU-stack noalloc noexec nowrite

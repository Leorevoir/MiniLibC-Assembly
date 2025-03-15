section .text
    global strpbrk

    ; geenral comment:
    ; using r12 to save the string and avoid modifying it directly

strpbrk:
    push    rbx

.outer_loop:
    movzx   eax, byte [rdi]     ; *s1
    test    al, al
    jz      .not_found

    mov     r12, rsi

.inner_loop:
    movzx   ebx, byte [r12]     ; *s2
    test    bl, bl
    jz      .i_plus_plus

    cmp     al, bl
    je      .found

    inc     r12                 ; *s2++
    jmp     .inner_loop

.i_plus_plus:
    inc     rdi                 ; *s1++
    jmp     .outer_loop

.found:
    mov     rax, rdi
    jmp     .done

.not_found:
    xor     rax, rax

.done:
    pop     rbx
    ret

section .note.GNU-stack noalloc noexec nowrite

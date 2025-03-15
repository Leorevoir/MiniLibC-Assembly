section .text
    global strcspn

strcspn:
    xor     rax, rax

.outer_loop:
    movzx   ecx, byte [rdi + rax]
    test    cl, cl                  ; \0
    je      .done

    mov     rdx, rsi

.inner_loop:
    movzx   ebx, byte [rdx]
    test    bl, bl                  ; \0
    je      .i_plus_plus

    cmp     cl, bl                  ; *s1 == *s2
    je      .done

    inc     rdx
    jmp     .inner_loop

.i_plus_plus:
    inc     rax
    jmp     .outer_loop

.done:
    ret

section .note.GNU-stack noalloc noexec nowrite

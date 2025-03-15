section .text
    global strstr

strstr:
    xor     rax, rax                ; return value -> NULL
    test    rsi, rsi                ; if null leave
    je      .return_null
    cmp     byte [rsi], 0
    jne     .main_loop
    mov     rax, rdi                ; if empty, return haystack
    ret

.main_loop:
    mov     r12, rdi                ; haystack (saved)
    mov     r13, rsi                ; needle (saved)

.compare_loop:
    movzx   r14d, byte [r13]
    test    r14b, r14b
    je      .found

    cmp     byte [r12], 0
    je      .not_found

    cmp     byte [r12], r14b
    jne     .advance_haystack

    inc     r12                     ; *haystack++
    inc     r13                     ; *needle++
    jmp     .compare_loop

.advance_haystack:
    inc     rdi                     ; *haystack++;
    jmp     .main_loop

.found:
    mov     rax, rdi                ; return haystack position
    jmp     .cleanup

.not_found:
    xor     rax, rax

.cleanup:
    ret

.return_null:
    xor     rax, rax
    ret

; this section is to remove the gcc GNU related warning
section .note.GNU-stack noalloc noexec nowrite

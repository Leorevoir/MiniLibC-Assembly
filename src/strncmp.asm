section .text
    global strncmp

strncmp:
    push    rbx
    xor     eax, eax            ; return 0

    test    rdx, rdx            ; if n == 0 -> return 0
    jz      .done

.loop:
    movzx   eax, byte [rdi]     ; *s1
    movzx   ebx, byte [rsi]     ; *s2
    cmp     al, bl              ; if *s1 != *s2 -> diff
    jne     .diff

    test    al, al              ; if *s1 == '\0' -> end of line
    jz      .done

    inc     rdi                 ; s1++
    inc     rsi                 ; s2++
    dec     rdx                 ; n--
    jnz     .loop

.done:
    xor     eax, eax            ; return 0
    jmp     .restore

.diff:
    sub     eax, ebx            ; *s1 - *s2

.restore:
    pop     rbx
    ret

; this section is to remove the gcc GNU related warning
section .note.GNU-stack noalloc noexec nowrite

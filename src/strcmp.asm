section .text
    global strcmp

strcmp:
    push    rbx

.loop:
    movzx   eax, byte [rdi]     ; *first
    movzx   ebx, byte [rsi]     ; *second
    cmp     al, bl

    jne     .diff
    test    al, al
    jz      .done

    inc     rdi                 ; *first++
    inc     rsi                 ; *second++
    jmp     .loop

.diff:
    sub     eax, ebx            ; return the .difference
    jmp     .restore

.done:
    xor     eax, eax            ; return 0 if right

.restore:
    pop     rbx
    ret

section .note.GNU-stack noalloc noexec nowrite

section .text
    global strcasecmp

strcasecmp:
    push    rbx

.loop:
    movzx   eax, byte [rdi]     ; *first
    movzx   ebx, byte [rsi]     ; *second

    cmp     al, 'A'
    jb      .convert_second
    cmp     al, 'Z'
    ja      .convert_second
    add     al, 32

.convert_second:
    cmp     bl, 'A'
    jb      .compare
    cmp     bl, 'Z'
    ja      .compare
    add     bl, 32

.compare:
    cmp     al, bl
    jne     .diff
    test    al, al
    jz      .done

    inc     rdi                 ; *first++
    inc     rsi                 ; *second++
    jmp     .loop

.diff:
    sub     eax, ebx            ; return the difference
    jmp     .restore

.done:
    xor     eax, eax            ; return 0 if equal

.restore:
    pop     rbx
    ret

section .note.GNU-stack noalloc noexec nowrite

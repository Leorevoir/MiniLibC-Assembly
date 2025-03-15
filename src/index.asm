section .text
    global  index

index:
    xor     rax, rax

.loop:
    cmp     byte [rdi], sil
    je      .found
    cmp     byte [rdi], 0
    je      .end

.next:
    inc     rdi
    jmp     .loop

.found:
    mov     rax, rdi
    ret

.end:
    xor     rax, rax
    ret

; this section is to remove the gcc GNU related warning
section .note.GNU-stack noalloc noexec nowrite

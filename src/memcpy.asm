section .text
    global memcpy

memcpy:
    xor     rax, rax             ; rax = return = 0
    xor     rcx, rcx             ; rcx = i = 0

.loop:
    cmp     rcx, rdx             ; compare i with n
    je      .done                ; if i > n exit loop

    mov     al, byte [rsi + rcx] ; set al char to src[rcx]
    mov     byte [rdi + rcx], al ; set dest[rcx] to al char

    jmp     .next

.next:
    inc     rcx
    jmp     .loop

.done:
    mov     rax, rdi             ; void* dest is the return
    ret

; this section is to remove the gcc GNU related warning
section .note.GNU-stack noalloc noexec nowrite

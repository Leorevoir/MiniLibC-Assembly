section .text
    global memset

; void *memset(void *ptr, int value, size_t num)
; rdi = ptr
; sil = value
; rdx = num

memset:
    push    rbp
    mov     rbp, rsp
    
    mov     rax, rdi                ; save original pointer for return value
    xor     rcx, rcx                ; rcx = i = 0
    mov     r8b, sil                ; r8b = (unsigned char)value

.loop:
    cmp     rcx, rdx               ; compare i with num
    jge     .done                  ; if i >= num, exit loop
    
    mov     byte [rdi + rcx], r8b  ; *(p + i) = value
    inc     rcx                    ; i++
    jmp     .loop

.done:
    pop     rbp
    ret

; this section is to remove the gcc GNU related warning
section .note.GNU-stack noalloc noexec nowrite

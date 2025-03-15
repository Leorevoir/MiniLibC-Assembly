section .text
    global memmove

; void *memmove(void *dest, const void *src, size_t size)
; rdi = dest
; rsi = src
; rdx = size

memmove:
    mov      rax, rdi       ; save dest for return value
    test     rdx, rdx
    je       .done

    test     rdi, rdi
    je       .done

    test     rsi, rsi
    je       .done

    cmp      rdi, rsi
    je       .done

    cmp      rdi, rsi
    ja       .backward_copy ; dest > src

.forward_copy:
    mov      rcx, rdx
    rep      movsb
    jmp      .done

.backward_copy:
    lea      rsi, [rsi + rdx - 1]   ; *end_ptr src
    lea      rdi, [rdi + rdx - 1]   ; *end_ptr dest

    std                             ; set direction flag for backward copy
    mov      rcx, rdx
    rep     movsb                   ; copy backwards
    cld                             ; restore direction flag

.done:
    ret

; this section is to remove the gcc GNU related warning
section .note.GNU-stack noalloc noexec nowrite

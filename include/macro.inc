; ======================
; syscall & constant macro
; ======================

; -- syscall --
%define SYS_WRITE 1
%define SYS_EXIT 60

; -- file descriptors --
%define STDIN 0
%define STDOUT 1
%define STDERR 2

; -- exit macro --
%macro exit 1
    mov rax, SYS_EXIT
    mov rdi, %1
    syscall
%endmacro

; -- syscall with 3 args --
%macro syscall_3 4
    mov rax, %1     ; syscall
    mov rdi, %2     ; 1st arg
    mov rsi, %3     ; 2nd arg
    mov rdx, %4     ; 3rd arg
    syscall
%endmacro

; -- write macro --
%macro write 2
    syscall_3 SYS_WRITE, STDOUT, %1, %2
%endmacro

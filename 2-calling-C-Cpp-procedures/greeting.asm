    option casemap:none

    .data

; 0 is for NUL terminator
; 10 is ASCII line feed characters aka '\n'
greetingStr byte 'Hello, world!', 10, 0

    .code

; External declaration so MASM knows about the C/C++ printf() function
    externdef printf:proc

; Here make the asm proc public so that it is visible outside of this
; asm module
    public greetingAsmProc
greetingAsmProc proc

; Grow the stack
    sub rsp, 56

; Before calling the `printf` func, we load the address of string to be printed
; in the RCX register where it is accessed by the `printf` function
    lea rcx, greetingStr
; Now, we call the `printf` function
    call printf

; shrink the stack
    add rsp, 56

    ret     ; return to the caller

greetingAsmProc endp
    end

    option casemap:none

nl = 10     ; ASCII code for newline `\n`
maxLen = 256

    .data
titleStr byte 'Returning-Function-Results', 0
prompt byte 'Enter something: ', 0
fmtStr byte "You entered: '%s'", nl, 0
input byte maxLen dup (?)

    .code

    externdef printf:proc
    externdef readLine:proc

    public getTitle
getTitle proc
    lea rax, titleStr
    ret
getTitle endp

    public asmMain
asmMain proc
    sub rsp, 56

    lea rcx, prompt
    call printf

    mov input, 0

    lea rcx, input
    mov rdx, maxLen
    call readLine

    lea rcx, fmtStr
    lea rdx, input
    call printf

    add rsp, 56
    ret
asmMain endp

    end

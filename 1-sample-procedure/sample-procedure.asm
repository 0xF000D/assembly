; A simple program which demonstrates how to define and
; call a procedure

    .code

; A sample user-defined procedure that we can call in this program
sampleProc proc
    ret     ; immediately return to the caller
sampleProc endp

; This is the main procedure (function)
main proc
    ; Calling the user-defined procedure
    call sampleProc
    ret
main endp

    end

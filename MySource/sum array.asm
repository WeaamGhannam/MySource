.MODEL small
.STACK 100h
.DATA
; --------------------------
    array db 90,85,72,66,95,81,63,76,80
    sum db 0
    ; --------------------------
.CODE
start:
    mov ax, @data
    mov ds, ax
; --------------------------
    xor cx, cx
    mov al, 0
    mov bx, offset array
StartLoop:
    cmp cx, 10
    jge EndLoop
    add al, [bx]
    add [sum],al
    inc cx
    inc bx
    jmp StartLoop
EndLoop:
    mov ah, 09h
    int 21h

; --------------------------

exit:
    mov ax, 4c00h
    int 21h
END start
.MODEL small
.STACK 100h
.DATA
; --------------------------
    array dw 90, 85, 72, 66, 95, 81, 63, 76, 80
    sum db 0
    sm db 'the sum is : ','$'
    ; --------------------------
.CODE
start:
    mov ax, @data
    mov ds, ax 
    mov ax,0000h
; --------------------------
    xor cx, cx
    mov al, 0
    mov bx, offset array   
    
    lea dx,sm
    mov ah, 09h
    int 21h

StartLoop:
    cmp cx, 9
    jge EndLoop
    add al, [bx]
    add [sum],al
    inc cx
    inc bx
    jmp StartLoop

EndLoop:
 lea dx,sum
    mov ah, 02h
    int 21h 
    
  
; --------------------------

exit:
    mov ax, 4c00h
    int 21h
END start
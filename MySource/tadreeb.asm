.model small
.data 
we db 10 Dup(?) 
len dw ?
.code 
mov ax,@data
mov ds,ax
lea dx,we
mov ah,0Ah
INT 021H 
mov ah,9h
INT 021H 
mov cx,0h
lea si,we
l:
inc cx
inc si
cmp [si],'$'
jne l
mov len,cx

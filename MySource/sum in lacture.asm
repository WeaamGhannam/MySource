org 100h             



.data
;str db "operation in array  $"
mydata dw  90,85,72,66,95,81,63,76,80
sum dw ? 

.code
main:
mov ax,@data
mov ds,ax 


mov ax,0000h
lea si,mydata  

mov cx,09h
step:
add ax,[si]`    
inc si
inc si
loop step

end main




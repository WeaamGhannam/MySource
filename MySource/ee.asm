org 100h

;SOLVED BY weaam ghannam & rahaf ahmed

.data
array: dw 90, 85, 72, 66, 95, 81, 63, 76, 80   
max DW ?  
min DW ?  
sum DW ?  
avg DW ?
.code                     

mov si,0    
mov bl,array[si] 
add si,1  

find_max:
    mov al,array[si]
    add si,1
    cmp bl,al
    jb change_max
    
    cmp si,95
    jnz find_max
    jz mini
    
    
change_max:
    mov max,ax
    jmp return
    

mini:       
mov si,0
mov bx,array[si]
add si,1
find_min:
    mov al,array[si]
    add si,1
    cmp bl,al
    ja change_min
    return:
    cmp si,63
    jnz find_min
    jz sumavg
    
    
change_min:
    mov min,ax
    jmp return             
    
    
    
sumavg:  
mov si,00
mov ax,00
mov bx,9

 
summ:
    add al,array[si]
    inc si
    cmp si,95
    jnz summ
    
  
mov sum, ax 
div bx
mov avg, bx
ret
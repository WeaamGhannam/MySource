org 100h


.data
array: db 3,2,6,6,1   
max DB 00H  
miin DB 00H  
suum DW 00H  
avg DW 0000H
.code                     

mov si,0    
mov bl,array[si] 
add si,1  

find_max:
    mov al,array[si]
    add si,1
    cmp bl,al
    jb change_max
    
    cmp si,6
    jnz find_max
    jz min
    
    
change_max:
    mov max,al
    jmp return
    

min:       
mov si,0    
mov bl,array[si]
add si,1
find_min:
    mov al,array[si]
    add si,1
    cmp bl,al
    ja change_min
    return:
    cmp si,6
    jnz find_min
    jz sumavg
    
    
change_min:
    mov min,al
    jmp return             
    
    
    
sumavg:  
mov si,00
mov ax,00
mov bx,6

 
sum:
    add al,array[si]
    inc si
    cmp si,6
    jnz sum
    
  
mov suum, ax 
div bx
mov avg, bx
            .model small

;solution Weaam Ghannam 201810931 and Rahaf Ahmed 201910005 

.data
str db "the array in question : $"
array: dw 90,85,72,66,95,81,63,76,80 
sum db 1 dup('$')
max db 3 dup('$')
min db 3 dup('$')
avrg db 3 dup('$')
maximum  db 0dh,0ah,"Maximum in array is:$"
minimum  db 0dh,0ah,"Minimum in array is:$"
summation db 0dh,0ah,"Summation in array is:$"
average db 0dh,0ah,"Average in array is:$"

.code

main:
mov ax,@data
mov ds,ax 

mov dx,offset str
mov ah,09h
int 21h

mov cx,9

;-------
;max
LEA Dx,maximum
    MOV Ah,09h
    INT 21h
    
    start: mov ax,0
       mov bx,0

again: mov  ax,[array+bx]
       add  bx,2
       cmp  bx,18
       mov  [max],ax
       cmp  ax,[max]
       jl   max_pre
       mov  [max], ax
       mov  [min],ax
       cmp  ax,[min]
       jg   min_pre
       jne again    

max_pre: mov [max],ax

min_pre: mov [min],ax 
    
   

;-------

LEA Dx,minimum
    MOV Ah,09h
    INT 21h
    
  
  
 
;-------

LEA Dx,summation
    MOV Ah,09h
    INT 21h

  

;-------
mov dx,offset average
mov ah,09h
int 21h
  

  
;-------  

    Exit:    
    MOV Ah,4Ch                              
    INT 21h                              


end
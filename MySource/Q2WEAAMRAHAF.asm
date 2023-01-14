.model small

;solution Weaam Ghannam 201810931 and Rahaf Ahmed 201910005 

.data
array: dw 90,85,72,66,95,81,63,76,80
mydata db 12 dup('$')
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

mov dx,offset array 
mov cx,9
mov ah,09h
int 21h

;-------
;max    
mov cx,09h       
dec cx          
lea si,mydata  
mov al,[si]       
mov bl,[si]
nxt:inc si       
cmp [si],al      
jnc down       
mov bl,[si]
loop nxt      
jmp skp
down:
mov al,[si]
loop nxt
skp:
 
lea si,max
mov [si],al
mov bh,al
 
lea si,min
mov [si],bl

mov dx,offset maximum 
mov ah,09h
int 21h
  

lea si,max
call ready4disp
mov dx,offset max
mov ah,09h
int 21h
;-------

LEA Dx,minimum
    MOV Ah,09h
    INT 21h
    
    lea si,min
call ready4disp
mov dx,offset min
mov ah,09h
int 21h   
  

lea si,min
mov [si],bl
  lea si,mydata
mov cx,09
mov bl,cl
mov ax,00h
mov al,[si]
inc si
next:
add al,[si]
jnc n
inc ah   
n:inc si
loop next 
;-------

LEA Dx,summation
    MOV Ah,09h
    INT 21h
    
    lea si,sum
mov [si],al
inc si
mov [si],ah
div bl
lea si,avrg
mov [si],al

mov dx,offset summation
mov ah,09h
int 21h
  
  

lea si,sum
mov al,[si]
inc si
mov ah,[si]
dec si
call convert

mov dx,offset sum
mov ah,09h
int 21h
   

;-------
mov dx,offset average
mov ah,09h
int 21h
  
lea si,avrg
call ready4disp
mov dx,offset avrg
mov ah,09h
int 21h   
     
  
;-------  
ready4disp proc near
mov al,[si]
mov bl,al
shr al,4
and al,0fh
add al,30h
mov [si],al
and bl,0fh
add bl,30h
inc si
mov [si],bl
ret

convert proc near
mov cx,0
mov bx,10
back:mov dx,0
div bx
add dl,30h
push dx
inc cx
cmp ax,9
jg back
add al,30h
mov [si],al
abc: pop ax
inc si
mov [si],al
loop abc
ret

    Exit:    
    MOV Ah,4Ch                              
    INT 21h                              


end
org 100h             

;SOLVED BY weaam ghannam and rahaf ahmed

.data
str dw "the array is :90,85,72,66,95,81,63,76,80 $"
mydata dw  90,85,72,66,95,81,63,76,80
sum db 9 dup (?)
max db 9 dup('$')
min db 9 dup('$')
avrg db 9 dup ('$')
mx_ms db "Maximum number is:$"
mn_ms db "Minimum number is:$"
av_ms db "Average is :$"
sm_ms db "Sum is:$"
  

.code

main:
mov ax,@data
mov ds,ax

mov dx,offset str
mov ah,09h
int 21h


mov cx,09h
lea si,mydata
 
start:
call linefeed
mov ah,01 
int 21h

sub al,30h 
cmp al,09 
jbe skip1
 
sub al,07h 
skip1:
mov dl,al
shl dx,4 
mov ah,01 
int 21h

sub al,30h
cmp al,95

jbe skip2
sub al,07h 

skip2:
add dl,al 
mov [si],dl 
inc si
loop start
call linefeed
  

mov cx,09h       
dec cx          
lea si,mydata  
mov al,[si]       
mov bl,[si]

nxt:
inc si       
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

mov dx,offset mx_ms
mov ah,09h
int 21h
  

lea si,max
call ready4disp
mov dx,offset max
mov ah,09h
int 21h
  
call linefeed
  

mov dx,offset mn_ms
mov ah,09h
int 21h
  

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
lea si,sum
mov [si],al
inc si
mov [si],ah
div bl
lea si,avrg
mov [si],al
  
call linefeed
  

mov dx,offset sm_ms
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
  
call linefeed
  

mov dx,offset av_ms
mov ah,09h
int 21h
  
lea si,avrg
call ready4disp
mov dx,offset avrg
mov ah,09h
int 21h   
  
hlt
  

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
mov bx,9
back:
mov dx,0
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
  
linefeed proc near
mov ah,02h
mov dl,0dh 
int 21h
  
mov dl,0ah
int 21h
ret
  
  
ret
org 100h
mov BX, 0800h
mov DS, BX      ;Set segment register
mov BX, 0000h   ;Set offset register
mov CX, 0       ;Set counter to 0      

;mov CH, 0

readwrite:      ;Top of read/write loop
mov AH, 01h     ;Get ready to read a character
int 21h         ;Read character into AL 

;jb readwrite

mov [BX], AL    ;Move AL into memory at DS:BX

add CX, 1       ;Increment Counter 
add BX, 1       ;Increment offset      

cmp AL, '$'     ;Compare entered to $
jg readwrite    ;if (C > 0) loop



;Reverse Printing

mov BX, 0800h
mov DS, BX      ;Set segment register
mov BX, 0000h   ;Set offset register            
add BX, CX
sub BX, 2            

mov AH, 0eh  

mov AL, 010 ;NL
int 10h
mov AL, 013 ;CR  
int 10h



revprinting:
mov AL, [BX]
int 10h    
sub BX, 1
sub CX, 1
cmp CX, 1
jg revprinting

ret
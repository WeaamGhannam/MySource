.MODEL SMALL                                 
.STACK 100                                   

.DATA                                        
    msg db " Please enter your str:$"                             
    str db 80, 78 DUP('$') 
    convert db 0dh,0ah,"convert it to capital letter : $" 
    char db ?,'$'
    strorder db 0dh,0ah, " Print string in order:$"
    strrev db 0dh,0ah, " Print string in reverse :$" 
   
.CODE                                        

main PROC                                    
    ; Prompt
    MOV Ax,@DATA                             
    MOV Ds,Ax
    mov Ax,0000h
                                   
    LEA Dx,msg                               
    MOV Ah,09h                               
    INT 21h                                 

    ; Input
    MOV Dx,offset msg                              
    MOV AH,0AH                               
    INT 21h                                                              
 
   ; Print string in order                                                                           
    
   LEA DX,strorder 
 ;output the string
   INT 21H 
   LEA DX,msg
   MOV AH,9H
   INT 21H 
   
   mov ah,01h
   int 21h
   mov bl,al
   cmp bl,61h
   
   
   Upper:
    and al,0DFh 
    mov char,al
    LEA Dx,convert                               
    MOV Ah,09h                               
    INT 21h 
   
                                
    
    Exit:    
    MOV Ah,4Ch                              
    INT 21h                                  
main ENDP

END main    

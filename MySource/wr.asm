.MODEL SMALL                                 
.STACK 100                                   

.DATA                                        
    msg db " Please enter your string:$"
    msg1 db " convert your string:$"  
    newline db 13,10,'$'                     
    greeting db "Wellcome!$"                   
    str db 80, 0, 78 DUP('$')
    STRING db "weaam rahaf","$"
   
.CODE                                        

main PROC                                    
    ; Prompt
    MOV Ax,@DATA                             
    MOV Ds,Ax                               
    LEA Dx,msg                               
    MOV Ah,09h                               
    INT 21h                                 

    ; Input
    LEA Dx,str                      
    MOV AH,0AH                               
    INT 21h                                  
    
     ; Newline
    LEA Dx,newline
    MOV Ah,09h
    INT 21h
   
    ; Check if ENTER is pressed
    CMP Al,13                               
    JE Display                              
 
    ; Newline
    LEA Dx,newline
    MOV Ah,09h
    INT 21h
    
    ; Print Greeting                                                                           
    Display:
     MOV AH,09h                      
     LEA Dx,str+2
     ;MOV Dl,Al                                
     INT 21H 
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
    int 21h
                                
main ENDP

REVERSE PROC
    ; load the offset of
    ; the string
    MOV SI, OFFSET STRING
 
    ; count of characters of the;
    ;string
    MOV CX, 0H
 
    LOOP1:
    ; compare if this is;
    ;the last character
    MOV AX, [SI]
    CMP AL, '$'
    JE LABEL1
 
    ; else push it in the;
    ;stack
    PUSH [SI]
 
    ; increment the pointer;
    ;and count
    INC SI
    INC CX
 
    JMP LOOP1
    
    LABEL1:
    ; again load the starting;
    ;address of the string
    MOV SI, OFFSET STRING
 
        LOOP2:
        ;if count not equal to zero
        CMP CX,0
        JE EXIT
 
        ; pop the top of stack
        POP DX
 
        ; make dh, 0
        XOR DH, DH
 
        ; put the character of the;
        ;reversed string
        MOV [SI], DX
 
        ; increment si and;
        ;decrement count
        INC SI
        DEC CX
 
        JMP LOOP2
 
                 
    EXIT:
    ; add $ to the end of string
    MOV [SI],'$ '
    RET
         
REVERSE ENDP
END MAIN

END main    

.MODEL SMALL                                 
.STACK 100 
;solved by Weaam Ghannam && Rahaf Ahmed                                  

.DATA                                        
    msg db  " Please enter your string :$"
    msg1 db " Print in order:$"
    msg2 db " convert your string:$"  
    newline db 13,10,'$'                      
    msg3 db " PrintString in Reverse: $"                 
    str db 80, 0, 78 DUP('$')
   
.CODE                                        

main PROC                                    
    ; Prompt
    MOV Ax,@DATA                             
    MOV Ds,Ax                               
    LEA Dx,msg                               
    MOV Ah,09h                               
    INT 21h                                 

    ; Input(enter string from keyboard)
    LEA Dx,str                      
    MOV AH,0AH                               
    INT 21h                                  
    
     ; Newline
    LEA Dx,newline
    MOV Ah,09h
    INT 21h 
    ;---------------- 
    ;conert string to capital later 
    LEA Dx,msg2 
    MOV Ah,09h
    INT 21h
    lea bx, str

    mov ch, 0
    mov cl, [bx+1] ; get string size.

    jcxz null ; is string is empty?

    add bx, 2 ; skip control chars.

    upper_case:

    ; check if it's a lower case letter:
    cmp byte ptr [bx], 'a'
    jb ok
    cmp byte ptr [bx], 'z'
    ja ok

    ; convert to uppercase:

    ; clear third bit:
    and byte ptr [bx], 11011111b

     ok:
     inc bx ; next char.
     loop upper_case
     ; int 21h / ah=09h - output of a string at ds:dx.
            ; string must be terminated by '$' sign.
            lea dx, str+2
            mov ah, 09h
            int 21h
 
            ; wait for any key press....
            mov ah, 0
            int 16h 
 
 
            null:

     
            LEA Dx,newline
            MOV Ah,09h
            INT 21h
 ;--------------------- 
 
   
    ; Check if ENTER is pressed and print in order
    LEA Dx,msg1 
    MOV Ah,09h
    INT 21h
    CMP Al,13                               
    JE Display                              

    
    ; Print                                                                            
    Display:
     MOV AH,09h                      
     LEA Dx,str+2
     ;MOV Dl,Al                                
     INT 21H 
      LEA Dx,newline
            MOV Ah,09h
            INT 21h
     
  ;---------------
   ;print string revers order 
 
  Dis:
    LEA DX,msg3
    MOV AH,09H
    INT 21H 
    
    MOV SI,OFFSET str
    MOV CX,11 
    ADD SI,11 
    
   TOP:
    MOV AH,2
    MOV DX,[SI] 
    INT 21H
    DEC SI
    
    CMP SI,0
    JE EXIT
    LOOP TOP


  
  ;---------------
    
    Exit:    
    MOV Ah,4Ch                              
    INT 21h 

                                
ENDP



END main



    

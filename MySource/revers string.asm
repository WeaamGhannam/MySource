
.STACK 100H
.DATA
MSG DB ' UNIVERSITY'
.CODE

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV SI,OFFSET MSG
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
    
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN

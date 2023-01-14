     org 100h
.data   ; Fares H. Abuali  201810408
    str DB 'aBaxzanBaord','$' 
    len DW $ - str - 1
    numOfBeesBetween DW ?
    currentBIndex DW ?
    prevBIndex DW ?
.code
    MOV AX, @DATA
    MOV DS, AX
                      
    LEA DI, str 
    CLD
    MOV currentBIndex, DI
    MOV CX, len
    MOV AL, 'B' 
    MOV BL, 00      ;counter of B's 
    notYet:
        REPNE SCASB     ;Repeat while scanned byte != 'B' and CX != 0
    
        
        JZ foundB        ; if Z flag is 1, then there's a B, so we are not done scanning yet  
        CMP CX, 0     
    JNE notYet 
    
    JMP doneScanning  ;If CX=0, this means we are done scanning the string
    
    foundB:
        INC BL  ; increment the B's Counter
        MOV SI, currentBIndex
        MOV prevBIndex, SI    
        MOV currentBIndex, DI 
        JMP notYet  
              
    doneScanning:
        CMP BX, 1
        JE printY
        CMP BX, 2
        JE beesBetween
        
        ;Else, print number of B's
        MOV DL, BL  
        ADD DL, 30h ; convert the number to its ASCII 
        MOV AH, 02H
        INT 21h
        JMP finish
                     
                 
    printY:
        MOV DL, 'Y'
        MOV AH, 02H
        INT 21h
        JMP finish
                     
    beesBetween:
        MOV DI, currentBIndex
        MOV SI, prevBIndex
        SUB DI, SI  ; DI = DI - SI
        DEC DI      ; because we want the number of letters BETWEEN the 2 B's
        MOV numOfBeesBetween, DI  
        
        MOV DX, numOfBeesBetween  
        ADD DL, 30h   ; convert the number to its ASCII 
        MOV AH, 2h
        INT 21h
        JMP finish    
        
    finish:    
ret





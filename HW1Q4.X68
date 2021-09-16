; ========================================================================
; Beginning of EQUates section, just like #define in C
; ========================================================================

addr1:   EQU  $4000
addr2:   EQU  $4001 
data2:   EQU  $A7FF
data3:   EQU  $5555
data4:   EQU  $0000 
data5:   EQU  4678 
data6:   EQU  %01001111 
data7:   EQU  %00010111 

; ========================================================================
; Beginning of code segment
; ========================================================================
        ORG  $400             ; directive tells assembler where program
                              ; is loaded in memory
main:   MOVE.W    #data2,D0   ; load D0 
        MOVE.B    #data6,D1   ; load D1 
        MOVE.B    #data7,D2   ; load D2 
        MOVE.W    #data3,D3   ; load D3 
        MOVEA.W   #addr1,A0   ; load address register 
        MOVE.B    D1,(A0)+    ; store byte to memory 
        MOVE.B    D2,(A0)+    ; store second byte
        MOVEA.W   #addr1,A1   ; load address 
        AND.W     D3,(A1)     ; logical AND
 
        ; Next instruction shows how a label is used
 
        JMP       main        ; forever loop!
        
        END       main        ; directive tells assembler where to
                              ; begin execution


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

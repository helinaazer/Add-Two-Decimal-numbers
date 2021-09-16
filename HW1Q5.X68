*-----------------------------------------------------------
* Title      : HW1 Question 5 Part 3
* Written by : Helina Azer
* Date       : 4/10/2021
* Description: Program to add the two numbers with the address stored at address $6000
*-----------------------------------------------------------
; ========================================================================
; Beginning of code segment
; ========================================================================
    ORG    $1000
START:                          ; first instruction of program
    
    LEA FIRSTNUMBER, A1         ; first message prompt
    MOVE.B  #14, D0             ; Load trap task to print
    TRAP    #15                 ; call trap
    
    MOVE.B  #4, D0              ; Trap task that reads the first number inputed by user
    TRAP    #15                 ; call trap
    MOVE.W  D1, D2              ; Move D1 into D2 (move the number entered by user to D2)
    
    LEA SECONDNUMBER, A1        ; second message prompt
    MOVE.B  #14, D0             ; Load trap tast to print
    TRAP    #15                 ; call trap
    
    MOVE.B  #4, D0              ; Trap task that reads the second number inputed by user
    TRAP    #15                 ; call trap
        
    MOVE.W  D1, D3              ; move the second input (D1) into D3
    ADD.W   D3, D2              ; add the first and second numbers entered by the user
    BVC.S   CHECKFOROVERFLOW    ; check for overflow
    
    LEA     ERRORMESSAGE, A1    ; load message into A1
    MOVE.B  #14, D0             ; trap task to print overflow
    TRAP    #15                 ; call trap
    
CHECKFOROVERFLOW:
    MOVE.W  D2, $6000           ; store at address $6000
    LEA     ANSWER, A1          
    MOVE.B  #14, D0             ; call trap tast to print the answer
    TRAP    #15                 ; call trap
    
    CLR.L   D1                  ; clear
    MOVE.W  D2,D1               ; move D2 into D1
    EXT.L   D1                  ; extend number
    MOVE.B  #3, D0              ; print signed number
    TRAP    #15                 ; call trap
    
    SIMHALT                     ; Halt simulator
* Put variables and constants here

ERRORMESSAGE      DC.B    'Overflow Occured', 0
FIRSTNUMBER       DC.B    'Enter the first number to add (hit enter when done): ', 0
SECONDNUMBER      DC.B    'Enter the second number to add (hit enter when done): ', 0
ANSWER            DC.B    'Answer: ', 0

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

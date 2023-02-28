;------------------------------------------------------------------------------------------------------
; Design and Implementation of an AHB timer, a GPIO peripheral, and a 7-segment display peripheral  
; 1) Display text string: "TEST" on VGA.
; 2) Input data from switches and output them to LEDs;
; 3) Display the timer value to the 7-segment display.
;------------------------------------------------------------------------------------------------------


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY   ; First 32 WORDS is VECTOR TABLE
                EXPORT  __Vectors

__Vectors       DCD     0x00003FFC
                DCD     Reset_Handler
                DCD     0              
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0

                ; External Interrupts
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0
                DCD     0


                AREA    |.text|, CODE, READONLY

; Reset Handler
Reset_Handler   PROC
                GLOBAL  Reset_Handler
                ENTRY


                ; Configure the timer
                
                LDR     R1, =0x52000000         ; Timer load value register
                LDR     R0, =0x0F         ; Maximum load value
                STR     R0, [R1]            
                LDR     R1, =0x52000008         ; Timer control register
                MOVS    R0, #0x07               ; Set prescaler, reload mode, start timer
                STR     R0, [R1]
STOP            NOP
                B STOP


                ENDP

                ALIGN   4                       ; Align to a word boundary

                END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

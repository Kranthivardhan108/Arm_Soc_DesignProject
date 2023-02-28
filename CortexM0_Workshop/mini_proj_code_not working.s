;------------------------------------------------------------------------------------------------------
; A Simple SoC  Application
; Mini- Project
;------------------------------------------------------------------------------------------------------



; Vector Table Mapped to Address 0 at Reset

						PRESERVE8
                		THUMB

        				AREA	RESET, DATA, READONLY	  			; First 32 WORDS is VECTOR TABLE
        				EXPORT 	__Vectors
					
__Vectors		    	DCD		0x00003FFC							; 16K Internal Memory
        				DCD		Reset_Handler
        				DCD		0  			
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD 	0
        				DCD		0
        				DCD		0
        				DCD 	0
        				DCD		0
        				
        				; External Interrupts
						        				
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
              
                AREA |.text|, CODE, READONLY

; Reset Handler
Reset_Handler   PROC
                GLOBAL  Reset_Handler
                ENTRY

                
                LDR     R1, =0xE000E100         ; Interrupt Set Enable Register
                LDR     R0, =0x00000001         ; Enable interrupts for timer.  If UART and timer interrupt-0x00000003 
                STR     R0, [R1]

                ; Configure the timer
                LDR     R1, =0x52000000         ; Timer load value register
                LDR     R0, =0x0F        ; = 50,000,000 (system tick frequency)
                STR     R0, [R1]            
                LDR     R1, =0x52000008         ; Timer control register
                MOVS    R0, #0x07               ; Prescaler = 1, enable timer, reload mode
                STR     R0, [R1]

               

AGAIN           NOP
                B       AGAIN

                ENDP

Timer_Handler   PROC
                EXPORT  Timer_Handler
				PUSH    {LR}

                LDR     R1, =0x5200000c         ; Clear timer interrupt
                MOVS    R0, #0x01		  ; CLEAR REGISTER HIGH. means timer_IRQ will be cleared to 0
                STR     R0, [R1]
                MOVS	R0, #0x00		  ; clear register value is set to be low. When counter again =0,
                				  ;timer_IRQ should get high again. If clear register is not cleared, 
                				  ;timer_irq will be always low
                STR	 R0, [R1]


				LDR 	R1, =0x50000000				;Write to LED with value 0xFF
				LDR		R0, =0xFF
				STR		R0, [R1]

				LDR 	R1, =0x55000000				;Write to R1 with Memory Address value	
				LDR		R0, =0x55				
				STR		R0, [R1]
				

				LDR		R0, =0x20				;Delay
Loop			SUBS	R0,R0,#1
				BNE Loop


				
				LDR 	R1, =0x50000000				;Write to LED with value 0x00
				LDR		R0, =0x00
				STR		R0, [R1]


				LDR		R1, =0x55000000				;Write to R1 with Memory Address value	
				LDR		R0, =0x00
				STR		R0, [R1]
				
				POP 	{PC}
                ENDP

                ALIGN   4                       ; Align to a word boundary

                END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
   

;------------------------------------------------------------------------------------------------------
; Design and Implementation of an AHB UART peripheral
; 1) Display text string: "TEST" on VGA. 
; 2) Receive/ print characters from/ to a computer through UART port.
;------------------------------------------------------------------------------------------------------


; Vector Table Mapped to Address 0 at Reset

						PRESERVE8
                		THUMB

        				AREA	RESET, DATA, READONLY	  			; First 32 WORDS is VECTOR TABLE
        				EXPORT 	__Vectors
					
__Vectors		    	DCD		0x00003FFC
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
;Reset Handler
Reset_Handler   PROC
                GLOBAL Reset_Handler
                ENTRY

 ;wait until transmit buffer is not full
                 
AGAIN			LDR R1, =0x51000004                     
				LDR	R0, [R1]
				MOVS	R1, #0x2
				ANDS	R0, R0, R1
				CMP	R0,	#0x00
				BNE		AGAIN	
;Transmit data
    			LDR R1,=0x51000000
				MOVS R0, #0x55
				STR R0,[R1]


;wait until receive buffer is not empty

WAIT			LDR 	R1, =0x51000004
				LDR	R0, [R1]
				MOVS	R1, #01
				ANDS 	R0, R0, R1
				CMP		R0,	#0x00
				BNE		WAIT		

;read the data received from UART 

				LDR 	R1, =0x51000000
				LDR 	R2, [R1]

				B		AGAIN

				ENDP

				ALIGN 		4					 ; Align to a word boundary

		END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
   
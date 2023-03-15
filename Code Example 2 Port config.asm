; -----------------------------------------------------------------------------
; EMK310
; Code example 2
; Lecturer: Prof T Hanekom
; Date of last revision: February 2019
;------------------------------------------------------------------------------
; Description: 
; Initialization of Ports
; SIMULATION, i.e. use SIMULATOR
;
; Functioning: We first load 0Fh into the working register (WREG) and then from
; the WREG into PORTA (address 0F80h). We then clear WREG by loading 0F00h into
; and it and then into PORTA. Does it work? Why?
; -----------------------------------------------------------------------------
; Check list: 	1. Simulation (no physical hardware) vs Programmer (stand alone)
;                       vs Debugger (ICD functionality)
;               2*. Breakpoints
;                       Window > Debugging > Breakpoints
;                       Double click on line in code
;               3*. Watch window to check content of registers
;                       Window > Debugging > Watches
;                       Add registers to watch, e.g, WREG, 0xF80, PORTA
; -----------------------------------------------------------------------------

        title 		"Our second assembler program"
		list   		P=PIC18F45K22 ; processor type
		#include	"p18f45K22.inc"
;
; -------------	
; PROGRAM START	
; -------------
;
		org 		0h 			; startup address = 0000h
		
		; Initialize Port A (check datasheet for example)
		MOVLB		0xF		; Why would one want to manipulate the BSR?
		CLRF 		PORTA 		; Initialize PORTA by clearing output data latches
		CLRF 		LATA 		; Alternate method to clear output data latches
		CLRF		ANSELA 		; Configure I/O (Check address of ANSELA)
		CLRF 		TRISA		; All digital outputs
		MOVLB		0x00		
		
		
start 	
	movlw 		0xFF 		; move 0FH to W register
	movwf 		PORTA		; move W to PORTA
	;movlw 		0x00 		; move 00H to W register
	;movwf 		PORTA		; move W to PORTA - note use of PORTA vs address
	goto 		start 		; do this loop forever
	end			

; Read chapter on I/O ports in the datasheet 




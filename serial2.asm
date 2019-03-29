;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Fri Mar 29 15:47:22 2019
;--------------------------------------------------------
	.module serial2
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	serial2.c: 30: void main(void)
; genLabel
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 8 bytes.
_main:
	sub	sp, #8
;	serial2.c: 34: CLK_DIVR = 0x00; // Set the frequency to 16 MHz
; genPointerSet
	mov	0x50c0+0, #0x00
;	serial2.c: 35: CLK_PCKENR1 = 0xFF; // Enable peripherals
; genPointerSet
	mov	0x50c3+0, #0xff
;	serial2.c: 37: PC_DDR = 0x08; // Put TX line on
; genPointerSet
	mov	0x500c+0, #0x08
;	serial2.c: 38: PC_CR1 = 0x08;
; genPointerSet
	mov	0x500d+0, #0x08
;	serial2.c: 40: USART1_CR2 = USART_CR2_TEN; // Allow TX and RX
; genPointerSet
	mov	0x5235+0, #0x08
;	serial2.c: 41: USART1_CR3 &= ~(USART_CR3_STOP1 | USART_CR3_STOP2); // 1 stop bit
; genPointerGet
; genCast
; genAssign
; genAnd
; genPointerSet
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xcf
; peephole 10 removed redundant load of #0x5236 into x
	ld	(x), a
;	serial2.c: 42: USART1_BRR2 = 0x03; USART1_BRR1 = 0x68; // 9600 baud
; genPointerSet
	mov	0x5233+0, #0x03
; genPointerSet
	mov	0x5232+0, #0x68
; genLabel
00106$:
;	serial2.c: 47: for(i = 0; i < 147456; i++); // Sleep
; genAssign
	ldw	x, #0x4000
	ldw	(0x03, sp), x
	ld	a, #0x02
	clr	(0x01, sp)
; genLabel
00105$:
; genMinus
	ldw	x, (0x03, sp)
	subw	x, #0x0001
	ldw	(0x07, sp), x
	sbc	a, #0x00
	ld	xl, a
	ld	a, (0x01, sp)
	sbc	a, #0x00
	ld	xh, a
; genAssign
	rlwa	x
	ld	(0x01, sp), a
	rrwa	x
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
	ld	a, xl
; genIfx
	ldw	y, (0x07, sp)
	jrne	00105$
; peephole j22 jumped to 00105$ directly instead of via 00122$.
	tnzw	x
	jreq	00106$
; peephole j19 jumped to 00106$ directly instead of via 00123$.
; peephole j30 removed unused label 00122$.
; peephole j5 changed absolute to relative unconditional jump.
; peephole j30 removed unused label 00123$.
; genGoto
	jra	00105$
; peephole j2d removed unreachable jump to 00106$.
; peephole j5 changed absolute to relative unconditional jump.
; genLabel
; peephole j30 removed unused label 00108$.
; genEndFunction
	addw	sp, #8
	C$serial2.c$49$1$13 ==.
	XG$main$0$0 ==.
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

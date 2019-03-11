;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Mon Mar 11 18:17:25 2019
;--------------------------------------------------------
	.module led
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _clock
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
;	led.c: 19: clock (void)
; genLabel
;	-----------------------------------------
;	 function clock
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 6 bytes.
_clock:
	sub	sp, #6
;	led.c: 21: unsigned char h = TIM1_CNTRH;
; genPointerGet
	ldw	x, #0x525e
	ld	a, (x)
	ld	yh, a
; genAssign
;	led.c: 22: unsigned char l = TIM1_CNTRL;
; genPointerGet
	ldw	x, #0x525f
	ld	a, (x)
; genAssign
;	led.c: 23: return ((unsigned int) (h) << 8 | l);
; genCast
; genAssign
	clr	(0x01, sp)
; genLeftShiftLiteral
	clr	(0x06, sp)
; genCast
; genAssign
	clr	(0x03, sp)
; genOr
	or	a, (0x06, sp)
	ld	xl, a
	ld	a, yh
	or	a, (0x03, sp)
	ld	xh, a
; genReturn
; genLabel
; peephole j30 removed unused label 00101$.
; genEndFunction
	addw	sp, #6
	C$led.c$24$1$2 ==.
	XG$clock$0$0 ==.
	ret
;	led.c: 27: main (void)
; genLabel
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_main:
;	led.c: 29: CLK_DIVR = 0x00;		// Set the frequency to 16 MHz
; genPointerSet
	mov	0x50c6+0, #0x00
;	led.c: 33: TIM1_PSCRH = 0x3e;
; genPointerSet
	mov	0x5260+0, #0x3e
;	led.c: 34: TIM1_PSCRL = 0x80;
; genPointerSet
	mov	0x5261+0, #0x80
;	led.c: 36: TIM1_CR1 = 0x01;
; genPointerSet
	mov	0x5250+0, #0x01
;	led.c: 38: PD_DDR = 0x01;
; genPointerSet
	mov	0x5011+0, #0x01
;	led.c: 39: PD_CR1 = 0x01;
; genPointerSet
	mov	0x5012+0, #0x01
; genLabel
00102$:
;	led.c: 42: PD_ODR = clock () % 1000 < 100;	//  was     PD_ODR = clock () % 1000 < 500;
; genCall
	call	_clock
; genDivMod
	ldw	y, #0x03e8
	divw	x, y
; genCmp
; genCmpTop
	cpw	y, #0x0064
	jrc	00110$
	clr	a
	jra	00111$
; peephole j5 changed absolute to relative unconditional jump.
00110$:
	ld	a, #0x01
00111$:
; genPointerSet
	ldw	x, #0x500f
	ld	(x), a
; genGoto
	jra	00102$
; peephole j5 changed absolute to relative unconditional jump.
; genLabel
; peephole j30 removed unused label 00104$.
; genEndFunction
	C$led.c$43$1$4 ==.
	XG$main$0$0 ==.
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)

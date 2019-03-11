                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Mon Mar 11 18:17:25 2019
                                      5 ;--------------------------------------------------------
                                      6 	.module led
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _clock
                                     14 ;--------------------------------------------------------
                                     15 ; ram data
                                     16 ;--------------------------------------------------------
                                     17 	.area DATA
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area INITIALIZED
                                     22 ;--------------------------------------------------------
                                     23 ; Stack segment in internal ram 
                                     24 ;--------------------------------------------------------
                                     25 	.area	SSEG
      000001                         26 __start__stack:
      000001                         27 	.ds	1
                                     28 
                                     29 ;--------------------------------------------------------
                                     30 ; absolute external ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DABS (ABS)
                                     33 ;--------------------------------------------------------
                                     34 ; interrupt vector 
                                     35 ;--------------------------------------------------------
                                     36 	.area HOME
      008000                         37 __interrupt_vect:
      008000 82 00 80 83             38 	int s_GSINIT ;reset
      008004 82 00 00 00             39 	int 0x0000 ;trap
      008008 82 00 00 00             40 	int 0x0000 ;int0
      00800C 82 00 00 00             41 	int 0x0000 ;int1
      008010 82 00 00 00             42 	int 0x0000 ;int2
      008014 82 00 00 00             43 	int 0x0000 ;int3
      008018 82 00 00 00             44 	int 0x0000 ;int4
      00801C 82 00 00 00             45 	int 0x0000 ;int5
      008020 82 00 00 00             46 	int 0x0000 ;int6
      008024 82 00 00 00             47 	int 0x0000 ;int7
      008028 82 00 00 00             48 	int 0x0000 ;int8
      00802C 82 00 00 00             49 	int 0x0000 ;int9
      008030 82 00 00 00             50 	int 0x0000 ;int10
      008034 82 00 00 00             51 	int 0x0000 ;int11
      008038 82 00 00 00             52 	int 0x0000 ;int12
      00803C 82 00 00 00             53 	int 0x0000 ;int13
      008040 82 00 00 00             54 	int 0x0000 ;int14
      008044 82 00 00 00             55 	int 0x0000 ;int15
      008048 82 00 00 00             56 	int 0x0000 ;int16
      00804C 82 00 00 00             57 	int 0x0000 ;int17
      008050 82 00 00 00             58 	int 0x0000 ;int18
      008054 82 00 00 00             59 	int 0x0000 ;int19
      008058 82 00 00 00             60 	int 0x0000 ;int20
      00805C 82 00 00 00             61 	int 0x0000 ;int21
      008060 82 00 00 00             62 	int 0x0000 ;int22
      008064 82 00 00 00             63 	int 0x0000 ;int23
      008068 82 00 00 00             64 	int 0x0000 ;int24
      00806C 82 00 00 00             65 	int 0x0000 ;int25
      008070 82 00 00 00             66 	int 0x0000 ;int26
      008074 82 00 00 00             67 	int 0x0000 ;int27
      008078 82 00 00 00             68 	int 0x0000 ;int28
      00807C 82 00 00 00             69 	int 0x0000 ;int29
                                     70 ;--------------------------------------------------------
                                     71 ; global & static initialisations
                                     72 ;--------------------------------------------------------
                                     73 	.area HOME
                                     74 	.area GSINIT
                                     75 	.area GSFINAL
                                     76 	.area GSINIT
      008083                         77 __sdcc_gs_init_startup:
      008083                         78 __sdcc_init_data:
                                     79 ; stm8_genXINIT() start
      008083 AE 00 00         [ 2]   80 	ldw x, #l_DATA
      008086 27 07            [ 1]   81 	jreq	00002$
      008088                         82 00001$:
      008088 72 4F 00 00      [ 1]   83 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   84 	decw x
      00808D 26 F9            [ 1]   85 	jrne	00001$
      00808F                         86 00002$:
      00808F AE 00 00         [ 2]   87 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]   88 	jreq	00004$
      008094                         89 00003$:
      008094 D6 80 EE         [ 1]   90 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 00         [ 1]   91 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]   92 	decw	x
      00809B 26 F7            [ 1]   93 	jrne	00003$
      00809D                         94 00004$:
                                     95 ; stm8_genXINIT() end
                                     96 	.area GSFINAL
      00809D CC 80 80         [ 2]   97 	jp	__sdcc_program_startup
                                     98 ;--------------------------------------------------------
                                     99 ; Home
                                    100 ;--------------------------------------------------------
                                    101 	.area HOME
                                    102 	.area HOME
      008080                        103 __sdcc_program_startup:
      008080 CC 80 BD         [ 2]  104 	jp	_main
                                    105 ;	return from main will return to caller
                                    106 ;--------------------------------------------------------
                                    107 ; code
                                    108 ;--------------------------------------------------------
                                    109 	.area CODE
                                    110 ;	led.c: 19: clock (void)
                                    111 ; genLabel
                                    112 ;	-----------------------------------------
                                    113 ;	 function clock
                                    114 ;	-----------------------------------------
                                    115 ;	Register assignment might be sub-optimal.
                                    116 ;	Stack space usage: 6 bytes.
      0080A0                        117 _clock:
      0080A0 52 06            [ 2]  118 	sub	sp, #6
                                    119 ;	led.c: 21: unsigned char h = TIM1_CNTRH;
                                    120 ; genPointerGet
      0080A2 AE 52 5E         [ 2]  121 	ldw	x, #0x525e
      0080A5 F6               [ 1]  122 	ld	a, (x)
      0080A6 90 95            [ 1]  123 	ld	yh, a
                                    124 ; genAssign
                                    125 ;	led.c: 22: unsigned char l = TIM1_CNTRL;
                                    126 ; genPointerGet
      0080A8 AE 52 5F         [ 2]  127 	ldw	x, #0x525f
      0080AB F6               [ 1]  128 	ld	a, (x)
                                    129 ; genAssign
                                    130 ;	led.c: 23: return ((unsigned int) (h) << 8 | l);
                                    131 ; genCast
                                    132 ; genAssign
      0080AC 0F 01            [ 1]  133 	clr	(0x01, sp)
                                    134 ; genLeftShiftLiteral
      0080AE 0F 06            [ 1]  135 	clr	(0x06, sp)
                                    136 ; genCast
                                    137 ; genAssign
      0080B0 0F 03            [ 1]  138 	clr	(0x03, sp)
                                    139 ; genOr
      0080B2 1A 06            [ 1]  140 	or	a, (0x06, sp)
      0080B4 97               [ 1]  141 	ld	xl, a
      0080B5 90 9E            [ 1]  142 	ld	a, yh
      0080B7 1A 03            [ 1]  143 	or	a, (0x03, sp)
      0080B9 95               [ 1]  144 	ld	xh, a
                                    145 ; genReturn
                                    146 ; genLabel
                                    147 ; peephole j30 removed unused label 00101$.
                                    148 ; genEndFunction
      0080BA 5B 06            [ 2]  149 	addw	sp, #6
                           00001C   150 	C$led.c$24$1$2 ==.
                           00001C   151 	XG$clock$0$0 ==.
      0080BC 81               [ 4]  152 	ret
                                    153 ;	led.c: 27: main (void)
                                    154 ; genLabel
                                    155 ;	-----------------------------------------
                                    156 ;	 function main
                                    157 ;	-----------------------------------------
                                    158 ;	Register assignment might be sub-optimal.
                                    159 ;	Stack space usage: 0 bytes.
      0080BD                        160 _main:
                                    161 ;	led.c: 29: CLK_DIVR = 0x00;		// Set the frequency to 16 MHz
                                    162 ; genPointerSet
      0080BD 35 00 50 C6      [ 1]  163 	mov	0x50c6+0, #0x00
                                    164 ;	led.c: 33: TIM1_PSCRH = 0x3e;
                                    165 ; genPointerSet
      0080C1 35 3E 52 60      [ 1]  166 	mov	0x5260+0, #0x3e
                                    167 ;	led.c: 34: TIM1_PSCRL = 0x80;
                                    168 ; genPointerSet
      0080C5 35 80 52 61      [ 1]  169 	mov	0x5261+0, #0x80
                                    170 ;	led.c: 36: TIM1_CR1 = 0x01;
                                    171 ; genPointerSet
      0080C9 35 01 52 50      [ 1]  172 	mov	0x5250+0, #0x01
                                    173 ;	led.c: 38: PD_DDR = 0x01;
                                    174 ; genPointerSet
      0080CD 35 01 50 11      [ 1]  175 	mov	0x5011+0, #0x01
                                    176 ;	led.c: 39: PD_CR1 = 0x01;
                                    177 ; genPointerSet
      0080D1 35 01 50 12      [ 1]  178 	mov	0x5012+0, #0x01
                                    179 ; genLabel
      0080D5                        180 00102$:
                                    181 ;	led.c: 42: PD_ODR = clock () % 1000 < 100;	//  was     PD_ODR = clock () % 1000 < 500;
                                    182 ; genCall
      0080D5 CD 80 A0         [ 4]  183 	call	_clock
                                    184 ; genDivMod
      0080D8 90 AE 03 E8      [ 2]  185 	ldw	y, #0x03e8
      0080DC 65               [ 2]  186 	divw	x, y
                                    187 ; genCmp
                                    188 ; genCmpTop
      0080DD 90 A3 00 64      [ 2]  189 	cpw	y, #0x0064
      0080E1 25 03            [ 1]  190 	jrc	00110$
      0080E3 4F               [ 1]  191 	clr	a
      0080E4 20 02            [ 2]  192 	jra	00111$
                                    193 ; peephole j5 changed absolute to relative unconditional jump.
      0080E6                        194 00110$:
      0080E6 A6 01            [ 1]  195 	ld	a, #0x01
      0080E8                        196 00111$:
                                    197 ; genPointerSet
      0080E8 AE 50 0F         [ 2]  198 	ldw	x, #0x500f
      0080EB F7               [ 1]  199 	ld	(x), a
                                    200 ; genGoto
      0080EC 20 E7            [ 2]  201 	jra	00102$
                                    202 ; peephole j5 changed absolute to relative unconditional jump.
                                    203 ; genLabel
                                    204 ; peephole j30 removed unused label 00104$.
                                    205 ; genEndFunction
                           00004E   206 	C$led.c$43$1$4 ==.
                           00004E   207 	XG$main$0$0 ==.
      0080EE 81               [ 4]  208 	ret
                                    209 	.area CODE
                                    210 	.area INITIALIZER
                                    211 	.area CABS (ABS)

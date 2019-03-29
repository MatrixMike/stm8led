                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Fri Mar 29 15:47:22 2019
                                      5 ;--------------------------------------------------------
                                      6 	.module serial2
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 ;--------------------------------------------------------
                                     14 ; ram data
                                     15 ;--------------------------------------------------------
                                     16 	.area DATA
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area INITIALIZED
                                     21 ;--------------------------------------------------------
                                     22 ; Stack segment in internal ram 
                                     23 ;--------------------------------------------------------
                                     24 	.area	SSEG
      000001                         25 __start__stack:
      000001                         26 	.ds	1
                                     27 
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 ;--------------------------------------------------------
                                     33 ; interrupt vector 
                                     34 ;--------------------------------------------------------
                                     35 	.area HOME
      008000                         36 __interrupt_vect:
      008000 82 00 80 83             37 	int s_GSINIT ;reset
      008004 82 00 00 00             38 	int 0x0000 ;trap
      008008 82 00 00 00             39 	int 0x0000 ;int0
      00800C 82 00 00 00             40 	int 0x0000 ;int1
      008010 82 00 00 00             41 	int 0x0000 ;int2
      008014 82 00 00 00             42 	int 0x0000 ;int3
      008018 82 00 00 00             43 	int 0x0000 ;int4
      00801C 82 00 00 00             44 	int 0x0000 ;int5
      008020 82 00 00 00             45 	int 0x0000 ;int6
      008024 82 00 00 00             46 	int 0x0000 ;int7
      008028 82 00 00 00             47 	int 0x0000 ;int8
      00802C 82 00 00 00             48 	int 0x0000 ;int9
      008030 82 00 00 00             49 	int 0x0000 ;int10
      008034 82 00 00 00             50 	int 0x0000 ;int11
      008038 82 00 00 00             51 	int 0x0000 ;int12
      00803C 82 00 00 00             52 	int 0x0000 ;int13
      008040 82 00 00 00             53 	int 0x0000 ;int14
      008044 82 00 00 00             54 	int 0x0000 ;int15
      008048 82 00 00 00             55 	int 0x0000 ;int16
      00804C 82 00 00 00             56 	int 0x0000 ;int17
      008050 82 00 00 00             57 	int 0x0000 ;int18
      008054 82 00 00 00             58 	int 0x0000 ;int19
      008058 82 00 00 00             59 	int 0x0000 ;int20
      00805C 82 00 00 00             60 	int 0x0000 ;int21
      008060 82 00 00 00             61 	int 0x0000 ;int22
      008064 82 00 00 00             62 	int 0x0000 ;int23
      008068 82 00 00 00             63 	int 0x0000 ;int24
      00806C 82 00 00 00             64 	int 0x0000 ;int25
      008070 82 00 00 00             65 	int 0x0000 ;int26
      008074 82 00 00 00             66 	int 0x0000 ;int27
      008078 82 00 00 00             67 	int 0x0000 ;int28
      00807C 82 00 00 00             68 	int 0x0000 ;int29
                                     69 ;--------------------------------------------------------
                                     70 ; global & static initialisations
                                     71 ;--------------------------------------------------------
                                     72 	.area HOME
                                     73 	.area GSINIT
                                     74 	.area GSFINAL
                                     75 	.area GSINIT
      008083                         76 __sdcc_gs_init_startup:
      008083                         77 __sdcc_init_data:
                                     78 ; stm8_genXINIT() start
      008083 AE 00 00         [ 2]   79 	ldw x, #l_DATA
      008086 27 07            [ 1]   80 	jreq	00002$
      008088                         81 00001$:
      008088 72 4F 00 00      [ 1]   82 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   83 	decw x
      00808D 26 F9            [ 1]   84 	jrne	00001$
      00808F                         85 00002$:
      00808F AE 00 00         [ 2]   86 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]   87 	jreq	00004$
      008094                         88 00003$:
      008094 D6 80 F1         [ 1]   89 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 00         [ 1]   90 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]   91 	decw	x
      00809B 26 F7            [ 1]   92 	jrne	00003$
      00809D                         93 00004$:
                                     94 ; stm8_genXINIT() end
                                     95 	.area GSFINAL
      00809D CC 80 80         [ 2]   96 	jp	__sdcc_program_startup
                                     97 ;--------------------------------------------------------
                                     98 ; Home
                                     99 ;--------------------------------------------------------
                                    100 	.area HOME
                                    101 	.area HOME
      008080                        102 __sdcc_program_startup:
      008080 CC 80 A0         [ 2]  103 	jp	_main
                                    104 ;	return from main will return to caller
                                    105 ;--------------------------------------------------------
                                    106 ; code
                                    107 ;--------------------------------------------------------
                                    108 	.area CODE
                                    109 ;	serial2.c: 30: void main(void)
                                    110 ; genLabel
                                    111 ;	-----------------------------------------
                                    112 ;	 function main
                                    113 ;	-----------------------------------------
                                    114 ;	Register assignment might be sub-optimal.
                                    115 ;	Stack space usage: 8 bytes.
      0080A0                        116 _main:
      0080A0 52 08            [ 2]  117 	sub	sp, #8
                                    118 ;	serial2.c: 34: CLK_DIVR = 0x00; // Set the frequency to 16 MHz
                                    119 ; genPointerSet
      0080A2 35 00 50 C0      [ 1]  120 	mov	0x50c0+0, #0x00
                                    121 ;	serial2.c: 35: CLK_PCKENR1 = 0xFF; // Enable peripherals
                                    122 ; genPointerSet
      0080A6 35 FF 50 C3      [ 1]  123 	mov	0x50c3+0, #0xff
                                    124 ;	serial2.c: 37: PC_DDR = 0x08; // Put TX line on
                                    125 ; genPointerSet
      0080AA 35 08 50 0C      [ 1]  126 	mov	0x500c+0, #0x08
                                    127 ;	serial2.c: 38: PC_CR1 = 0x08;
                                    128 ; genPointerSet
      0080AE 35 08 50 0D      [ 1]  129 	mov	0x500d+0, #0x08
                                    130 ;	serial2.c: 40: USART1_CR2 = USART_CR2_TEN; // Allow TX and RX
                                    131 ; genPointerSet
      0080B2 35 08 52 35      [ 1]  132 	mov	0x5235+0, #0x08
                                    133 ;	serial2.c: 41: USART1_CR3 &= ~(USART_CR3_STOP1 | USART_CR3_STOP2); // 1 stop bit
                                    134 ; genPointerGet
                                    135 ; genCast
                                    136 ; genAssign
                                    137 ; genAnd
                                    138 ; genPointerSet
      0080B6 AE 52 36         [ 2]  139 	ldw	x, #0x5236
      0080B9 F6               [ 1]  140 	ld	a, (x)
      0080BA A4 CF            [ 1]  141 	and	a, #0xcf
                                    142 ; peephole 10 removed redundant load of #0x5236 into x
      0080BC F7               [ 1]  143 	ld	(x), a
                                    144 ;	serial2.c: 42: USART1_BRR2 = 0x03; USART1_BRR1 = 0x68; // 9600 baud
                                    145 ; genPointerSet
      0080BD 35 03 52 33      [ 1]  146 	mov	0x5233+0, #0x03
                                    147 ; genPointerSet
      0080C1 35 68 52 32      [ 1]  148 	mov	0x5232+0, #0x68
                                    149 ; genLabel
      0080C5                        150 00106$:
                                    151 ;	serial2.c: 47: for(i = 0; i < 147456; i++); // Sleep
                                    152 ; genAssign
      0080C5 AE 40 00         [ 2]  153 	ldw	x, #0x4000
      0080C8 1F 03            [ 2]  154 	ldw	(0x03, sp), x
      0080CA A6 02            [ 1]  155 	ld	a, #0x02
      0080CC 0F 01            [ 1]  156 	clr	(0x01, sp)
                                    157 ; genLabel
      0080CE                        158 00105$:
                                    159 ; genMinus
      0080CE 1E 03            [ 2]  160 	ldw	x, (0x03, sp)
      0080D0 1D 00 01         [ 2]  161 	subw	x, #0x0001
      0080D3 1F 07            [ 2]  162 	ldw	(0x07, sp), x
      0080D5 A2 00            [ 1]  163 	sbc	a, #0x00
      0080D7 97               [ 1]  164 	ld	xl, a
      0080D8 7B 01            [ 1]  165 	ld	a, (0x01, sp)
      0080DA A2 00            [ 1]  166 	sbc	a, #0x00
      0080DC 95               [ 1]  167 	ld	xh, a
                                    168 ; genAssign
      0080DD 02               [ 1]  169 	rlwa	x
      0080DE 6B 01            [ 1]  170 	ld	(0x01, sp), a
      0080E0 01               [ 1]  171 	rrwa	x
      0080E1 16 07            [ 2]  172 	ldw	y, (0x07, sp)
      0080E3 17 03            [ 2]  173 	ldw	(0x03, sp), y
      0080E5 9F               [ 1]  174 	ld	a, xl
                                    175 ; genIfx
      0080E6 16 07            [ 2]  176 	ldw	y, (0x07, sp)
      0080E8 26 E4            [ 1]  177 	jrne	00105$
                                    178 ; peephole j22 jumped to 00105$ directly instead of via 00122$.
      0080EA 5D               [ 2]  179 	tnzw	x
      0080EB 27 D8            [ 1]  180 	jreq	00106$
                                    181 ; peephole j19 jumped to 00106$ directly instead of via 00123$.
                                    182 ; peephole j30 removed unused label 00122$.
                                    183 ; peephole j5 changed absolute to relative unconditional jump.
                                    184 ; peephole j30 removed unused label 00123$.
                                    185 ; genGoto
      0080ED 20 DF            [ 2]  186 	jra	00105$
                                    187 ; peephole j2d removed unreachable jump to 00106$.
                                    188 ; peephole j5 changed absolute to relative unconditional jump.
                                    189 ; genLabel
                                    190 ; peephole j30 removed unused label 00108$.
                                    191 ; genEndFunction
      0080EF 5B 08            [ 2]  192 	addw	sp, #8
                           000051   193 	C$serial2.c$49$1$13 ==.
                           000051   194 	XG$main$0$0 ==.
      0080F1 81               [ 4]  195 	ret
                                    196 	.area CODE
                                    197 	.area INITIALIZER
                                    198 	.area CABS (ABS)

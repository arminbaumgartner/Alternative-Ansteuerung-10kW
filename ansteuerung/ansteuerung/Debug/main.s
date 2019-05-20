	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.init_timer_zeitlicher_ablauf,"ax",@progbits
.global	init_timer_zeitlicher_ablauf
	.type	init_timer_zeitlicher_ablauf, @function
init_timer_zeitlicher_ablauf:
.LFB12:
	.file 1 ".././main.c"
	.loc 1 171 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 174 0
	ldi r30,lo8(-111)
	ldi r31,0
	ld r24,Z
	.loc 1 174 0
	ori r24,lo8(1)
	st Z,r24
	.loc 1 175 0
	ld r24,Z
	.loc 1 175 0
	ori r24,lo8(2)
	st Z,r24
	.loc 1 176 0
	ld r24,Z
	.loc 1 176 0
	andi r24,lo8(-5)
	st Z,r24
	.loc 1 178 0
	ldi r30,lo8(113)
	ldi r31,0
	ld r24,Z
	.loc 1 178 0
	ori r24,lo8(2)
	st Z,r24
	.loc 1 180 0
	ldi r24,lo8(-60)
	ldi r25,lo8(9)
	sts 152+1,r25
	sts 152,r24
	ret
	.cfi_endproc
.LFE12:
	.size	init_timer_zeitlicher_ablauf, .-init_timer_zeitlicher_ablauf
	.section	.text.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB11:
	.loc 1 37 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL0:
	.loc 1 43 0
	ldi r30,lo8(97)
	ldi r31,0
	ldi r24,lo8(-128)
	st Z,r24
	.loc 1 44 0
	st Z,__zero_reg__
	.loc 1 46 0
	in r24,0x35
	.loc 1 46 0
	ori r24,lo8(-128)
	out 0x35,r24
	.loc 1 47 0
	in r24,0x35
	.loc 1 47 0
	ori r24,lo8(-128)
	out 0x35,r24
	.loc 1 50 0
	sbi 0x7,7
	.loc 1 51 0
	sbi 0x7,6
	.loc 1 52 0
	sbi 0x4,6
	.loc 1 53 0
	sbi 0x4,5
	.loc 1 54 0
	sbi 0xa,7
	.loc 1 55 0
	sbi 0xa,6
	.loc 1 58 0
	cbi 0x4,1
	.loc 1 59 0
	cbi 0x4,2
	.loc 1 60 0
	cbi 0x4,3
	.loc 1 61 0
	cbi 0x5,1
	.loc 1 62 0
	cbi 0x5,2
	.loc 1 63 0
	cbi 0x5,3
	.loc 1 66 0
	cbi 0x4,4
	.loc 1 67 0
	sbi 0x5,4
	.loc 1 70 0
	sbi 0xd,6
	.loc 1 71 0
	cbi 0xe,6
	.loc 1 74 0
	cbi 0x10,0
	.loc 1 77 0
	sbi 0x4,0
	.loc 1 78 0
	sbi 0x10,1
	.loc 1 79 0
	sbi 0x10,7
	.loc 1 80 0
	sbi 0x10,6
	.loc 1 81 0
	sbi 0x10,5
	.loc 1 82 0
	sbi 0x10,4
	.loc 1 85 0
	cbi 0xa,2
	.loc 1 86 0
	sbi 0xb,2
	.loc 1 92 0
	sbi 0xa,4
	.loc 1 95 0
	cbi 0xa,0
	.loc 1 96 0
	sbi 0xb,0
	.loc 1 100 0
	sbi 0x4,7
	.loc 1 103 0
	call Init_Pinchange
.LVL1:
	.loc 1 105 0
	call Init_PWM
.LVL2:
	.loc 1 107 0
	call Init_ADC
.LVL3:
	.loc 1 109 0
	call Init_Timer1
.LVL4:
	.loc 1 114 0
	call init_ext_int_kommunikation
.LVL5:
	.loc 1 116 0
	call init_timer_zeitlicher_ablauf
.LVL6:
	.loc 1 118 0
	call LCD_init
.LVL7:
	.loc 1 119 0
	ldi r24,lo8(12)
	call LCD_cmd
.LVL8:
	.loc 1 121 0
	call Hallsensoren_abfragen
.LVL9:
	.loc 1 123 0
/* #APP */
 ;  123 ".././main.c" 1
	sei
 ;  0 "" 2
	.loc 1 125 0
/* #NOAPP */
	call LCD_Display
.LVL10:
.LBB4:
.LBB5:
	.file 2 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h"
	.loc 2 187 0
	ldi r18,lo8(6399999)
	ldi r24,hi8(6399999)
	ldi r25,hlo8(6399999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
.LVL11:
.LBE5:
.LBE4:
	.loc 1 130 0
	cbi 0xe,6
	.loc 1 133 0
	call preset_drehzahl_gesch
.LVL12:
	.loc 1 135 0
	sts zeitlicher_ablauf,__zero_reg__
	.loc 1 141 0
	ldi r28,lo8(16)
.LVL13:
.L3:
	.loc 1 139 0
	call kommunikations_daten_mitteln
.LVL14:
	.loc 1 141 0
	in r24,0xb
	.loc 1 141 0
	eor r24,r28
	out 0xb,r24
	.loc 1 143 0
	lds r24,zeitlicher_ablauf
	cpi r24,lo8(10)
	brlo .L3
	.loc 1 147 0
	call ges_spannung_uebertragung
.LVL15:
	movw r16,r24
.LVL16:
	.loc 1 149 0
	call geschwindigkeit_berechnung
.LVL17:
	.loc 1 150 0
	movw r24,r16
	call akku_ladestand
.LVL18:
	.loc 1 151 0
	call ladestand_ausgabe
.LVL19:
	.loc 1 156 0
	call drehzahl_ausgabe
.LVL20:
	.loc 1 159 0
	call geschwindigkeits_ausgabe
.LVL21:
	.loc 1 162 0
	sts zeitlicher_ablauf,__zero_reg__
	rjmp .L3
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.section	.text.__vector_32,"ax",@progbits
.global	__vector_32
	.type	__vector_32, @function
__vector_32:
.LFB13:
	.loc 1 188 0
	.cfi_startproc
	push r1
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r24
.LCFI2:
	.cfi_def_cfa_offset 5
	.cfi_offset 24, -4
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	.loc 1 189 0
	sts 148+1,__zero_reg__
	sts 148,__zero_reg__
	.loc 1 192 0
	lds r24,zeitlicher_ablauf
	cpi r24,lo8(25)
	brlo .L7
	.loc 1 195 0
	sts zeitlicher_ablauf,__zero_reg__
.L7:
	.loc 1 198 0
	lds r24,zeitlicher_ablauf
	subi r24,lo8(-(1))
	sts zeitlicher_ablauf,r24
/* epilogue start */
	.loc 1 201 0
	pop r24
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE13:
	.size	__vector_32, .-__vector_32
.global	zeitlicher_ablauf
	.section	.bss.zeitlicher_ablauf,"aw",@nobits
	.type	zeitlicher_ablauf, @object
	.size	zeitlicher_ablauf, 1
zeitlicher_ablauf:
	.zero	1
	.text
.Letext0:
	.file 3 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h"
	.file 4 ".././motoransteuerung.h"
	.file 5 ".././berechnung.h"
	.file 6 ".././kommunikation.h"
	.file 7 ".././lcd.h"
	.file 8 ".././datenverarbeitung.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x31c
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF35
	.byte	0xc
	.long	.LASF36
	.long	.LASF37
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x3
	.byte	0x7e
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x3
	.byte	0x80
	.long	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x3
	.byte	0x82
	.long	0x6d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF38
	.byte	0x2
	.byte	0xa6
	.byte	0x1
	.byte	0x3
	.long	0xc2
	.uleb128 0x6
	.long	.LASF39
	.byte	0x2
	.byte	0xa6
	.long	0xc2
	.uleb128 0x7
	.long	.LASF11
	.byte	0x2
	.byte	0xa8
	.long	0xc2
	.uleb128 0x7
	.long	.LASF12
	.byte	0x2
	.byte	0xac
	.long	0x62
	.uleb128 0x8
	.byte	0x1
	.long	.LASF40
	.byte	0x2
	.byte	0xad
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF13
	.uleb128 0x9
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0xaa
	.byte	0x1
	.long	.LFB12
	.long	.LFE12
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0xa
	.byte	0x1
	.long	.LASF41
	.byte	0x1
	.byte	0x24
	.byte	0x1
	.long	0x42
	.byte	0x1
	.long	.LFB11
	.long	.LFE11
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x215
	.uleb128 0xb
	.long	.LASF14
	.byte	0x1
	.byte	0x27
	.long	0x49
	.byte	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.uleb128 0xc
	.long	.LASF15
	.byte	0x1
	.byte	0x28
	.long	0x30
	.long	.LLST0
	.uleb128 0xd
	.long	0x89
	.long	.LBB4
	.long	.LBE4
	.byte	0x1
	.byte	0x80
	.long	0x158
	.uleb128 0xe
	.long	0x96
	.long	.LLST1
	.uleb128 0xf
	.long	.LBB5
	.long	.LBE5
	.uleb128 0x10
	.long	0xa1
	.long	.LLST2
	.uleb128 0x10
	.long	0xac
	.long	.LLST3
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	.LVL1
	.long	0x242
	.uleb128 0x11
	.long	.LVL2
	.long	0x24f
	.uleb128 0x11
	.long	.LVL3
	.long	0x25c
	.uleb128 0x11
	.long	.LVL4
	.long	0x269
	.uleb128 0x11
	.long	.LVL5
	.long	0x276
	.uleb128 0x11
	.long	.LVL6
	.long	0xc9
	.uleb128 0x11
	.long	.LVL7
	.long	0x283
	.uleb128 0x12
	.long	.LVL8
	.long	0x290
	.long	0x1aa
	.uleb128 0x13
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3c
	.byte	0
	.uleb128 0x11
	.long	.LVL9
	.long	0x29d
	.uleb128 0x11
	.long	.LVL10
	.long	0x2aa
	.uleb128 0x11
	.long	.LVL12
	.long	0x2b7
	.uleb128 0x11
	.long	.LVL14
	.long	0x2c4
	.uleb128 0x11
	.long	.LVL15
	.long	0x2d1
	.uleb128 0x11
	.long	.LVL17
	.long	0x2de
	.uleb128 0x12
	.long	.LVL18
	.long	0x2eb
	.long	0x1f9
	.uleb128 0x13
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.long	.LVL19
	.long	0x2f8
	.uleb128 0x11
	.long	.LVL20
	.long	0x305
	.uleb128 0x11
	.long	.LVL21
	.long	0x312
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0xbb
	.byte	0x1
	.long	.LFB13
	.long	.LFE13
	.long	.LLST4
	.byte	0x1
	.uleb128 0x15
	.long	.LASF42
	.byte	0x1
	.byte	0x21
	.long	0x23d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	zeitlicher_ablauf
	.uleb128 0x16
	.long	0x82
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF18
	.long	.LASF18
	.byte	0x4
	.byte	0x17
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF19
	.long	.LASF19
	.byte	0x4
	.byte	0x16
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF20
	.long	.LASF20
	.byte	0x4
	.byte	0x18
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF21
	.long	.LASF21
	.byte	0x5
	.byte	0x6
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF22
	.long	.LASF22
	.byte	0x6
	.byte	0x17
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF23
	.long	.LASF23
	.byte	0x7
	.byte	0x43
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF24
	.long	.LASF24
	.byte	0x7
	.byte	0x45
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF25
	.long	.LASF25
	.byte	0x4
	.byte	0x19
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF26
	.long	.LASF26
	.byte	0x7
	.byte	0x48
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF27
	.long	.LASF27
	.byte	0x5
	.byte	0xe
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF28
	.long	.LASF28
	.byte	0x6
	.byte	0x1a
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF29
	.long	.LASF29
	.byte	0x6
	.byte	0x1d
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF30
	.long	.LASF30
	.byte	0x5
	.byte	0xa
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF31
	.long	.LASF31
	.byte	0x8
	.byte	0x1a
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF32
	.long	.LASF32
	.byte	0x8
	.byte	0x1e
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF33
	.long	.LASF33
	.byte	0x5
	.byte	0xc
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF34
	.long	.LASF34
	.byte	0x5
	.byte	0xd
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x87
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0
	.long	.LVL13
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL18
	.long	.LVL19-1
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST1:
	.long	.LVL10
	.long	.LVL11
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x44fa0000
	.long	0
	.long	0
.LLST2:
	.long	.LVL10
	.long	.LVL11
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x4bf42400
	.long	0
	.long	0
.LLST3:
	.long	.LVL10
	.long	.LVL11
	.word	0x6
	.byte	0xc
	.long	0x1e84800
	.byte	0x9f
	.long	0
	.long	0
.LLST4:
	.long	.LFB13
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI2
	.long	.LFE13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB12
	.long	.LFE12-.LFB12
	.long	.LFB11
	.long	.LFE11-.LFB11
	.long	.LFB13
	.long	.LFE13-.LFB13
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB12
	.long	.LFE12
	.long	.LFB11
	.long	.LFE11
	.long	.LFB13
	.long	.LFE13
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF25:
	.string	"Hallsensoren_abfragen"
.LASF42:
	.string	"zeitlicher_ablauf"
.LASF40:
	.string	"__builtin_avr_delay_cycles"
.LASF11:
	.string	"__tmp"
.LASF41:
	.string	"main"
.LASF26:
	.string	"LCD_Display"
.LASF2:
	.string	"uint8_t"
.LASF17:
	.string	"__vector_32"
.LASF8:
	.string	"long long int"
.LASF28:
	.string	"kommunikations_daten_mitteln"
.LASF5:
	.string	"long int"
.LASF21:
	.string	"Init_Timer1"
.LASF38:
	.string	"_delay_ms"
.LASF29:
	.string	"ges_spannung_uebertragung"
.LASF20:
	.string	"Init_ADC"
.LASF15:
	.string	"ladestand_test"
.LASF1:
	.string	"unsigned char"
.LASF33:
	.string	"drehzahl_ausgabe"
.LASF14:
	.string	"ges_spannung_main"
.LASF0:
	.string	"signed char"
.LASF9:
	.string	"long long unsigned int"
.LASF6:
	.string	"uint32_t"
.LASF27:
	.string	"preset_drehzahl_gesch"
.LASF4:
	.string	"unsigned int"
.LASF34:
	.string	"geschwindigkeits_ausgabe"
.LASF3:
	.string	"uint16_t"
.LASF18:
	.string	"Init_Pinchange"
.LASF36:
	.string	".././main.c"
.LASF22:
	.string	"init_ext_int_kommunikation"
.LASF10:
	.string	"char"
.LASF37:
	.string	"C:\\\\Users\\\\Armin Baumgartner\\\\Desktop\\\\10kW-master\\\\10kW-master\\\\ansteuerung\\\\ansteuerung\\\\Debug"
.LASF16:
	.string	"init_timer_zeitlicher_ablauf"
.LASF31:
	.string	"akku_ladestand"
.LASF7:
	.string	"long unsigned int"
.LASF13:
	.string	"double"
.LASF32:
	.string	"ladestand_ausgabe"
.LASF19:
	.string	"Init_PWM"
.LASF24:
	.string	"LCD_cmd"
.LASF35:
	.string	"GNU C99 5.4.0 -mn-flash=1 -mno-skip-bug -mmcu=avr5 -g2 -O1 -std=gnu99 -funsigned-char -funsigned-bitfields -ffunction-sections -fdata-sections -fpack-struct -fshort-enums"
.LASF39:
	.string	"__ms"
.LASF12:
	.string	"__ticks_dc"
.LASF30:
	.string	"geschwindigkeit_berechnung"
.LASF23:
	.string	"LCD_init"
	.ident	"GCC: (AVR_8_bit_GNU_Toolchain_3.6.1_1750) 5.4.0"
.global __do_clear_bss

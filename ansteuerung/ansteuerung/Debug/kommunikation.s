	.file	"kommunikation.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.init_usart,"ax",@progbits
.global	init_usart
	.type	init_usart, @function
init_usart:
.LFB11:
	.file 1 ".././kommunikation.c"
	.loc 1 54 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 55 0
	sts 205,__zero_reg__
	.loc 1 56 0
	ldi r24,lo8(103)
	sts 204,r24
	.loc 1 57 0
	ldi r26,lo8(-55)
	ldi r27,0
	ld r24,X
	.loc 1 57 0
	ori r24,lo8(16)
	st X,r24
	.loc 1 58 0
	ld r24,X
	.loc 1 58 0
	ori r24,lo8(-128)
	st X,r24
	.loc 1 59 0
	ld r24,X
	.loc 1 59 0
	ori r24,lo8(8)
	st X,r24
	.loc 1 61 0
	ldi r30,lo8(-54)
	ldi r31,0
	ld r24,Z
	.loc 1 61 0
	andi r24,lo8(-65)
	st Z,r24
	.loc 1 62 0
	ld r24,Z
	.loc 1 62 0
	andi r24,lo8(127)
	st Z,r24
	.loc 1 64 0
	ld r24,Z
	.loc 1 64 0
	andi r24,lo8(-17)
	st Z,r24
	.loc 1 65 0
	ld r24,Z
	.loc 1 65 0
	ori r24,lo8(32)
	st Z,r24
	.loc 1 67 0
	ld r24,Z
	.loc 1 67 0
	andi r24,lo8(-9)
	st Z,r24
	.loc 1 69 0
	ld r24,Z
	.loc 1 69 0
	ori r24,lo8(2)
	st Z,r24
	.loc 1 70 0
	ld r24,Z
	.loc 1 70 0
	ori r24,lo8(4)
	st Z,r24
	.loc 1 71 0
	ld r24,X
	.loc 1 71 0
	andi r24,lo8(-5)
	st X,r24
	.loc 1 73 0
	ld r24,Z
	.loc 1 73 0
	st Z,r24
	ret
	.cfi_endproc
.LFE11:
	.size	init_usart, .-init_usart
	.section	.text.init_transmission_timer,"ax",@progbits
.global	init_transmission_timer
	.type	init_transmission_timer, @function
init_transmission_timer:
.LFB12:
	.loc 1 78 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 79 0
	in r24,0x24
	.loc 1 79 0
	andi r24,lo8(-65)
	out 0x24,r24
	.loc 1 80 0
	in r24,0x24
	.loc 1 80 0
	andi r24,lo8(127)
	out 0x24,r24
	.loc 1 82 0
	in r24,0x24
	.loc 1 82 0
	andi r24,lo8(-2)
	out 0x24,r24
	.loc 1 83 0
	in r24,0x24
	.loc 1 83 0
	andi r24,lo8(-3)
	out 0x24,r24
	.loc 1 84 0
	in r24,0x25
	.loc 1 84 0
	andi r24,lo8(-9)
	out 0x25,r24
	.loc 1 86 0
	in r24,0x25
	.loc 1 86 0
	andi r24,lo8(-2)
	out 0x25,r24
	.loc 1 87 0
	in r24,0x25
	.loc 1 87 0
	andi r24,lo8(-3)
	out 0x25,r24
	.loc 1 88 0
	in r24,0x25
	.loc 1 88 0
	ori r24,lo8(4)
	out 0x25,r24
	.loc 1 90 0
	ldi r24,lo8(100)
	out 0x27,r24
	.loc 1 92 0
	ldi r30,lo8(110)
	ldi r31,0
	ld r24,Z
	.loc 1 92 0
	ori r24,lo8(2)
	st Z,r24
	ret
	.cfi_endproc
.LFE12:
	.size	init_transmission_timer, .-init_transmission_timer
	.section	.text.daten_aufteilen,"ax",@progbits
.global	daten_aufteilen
	.type	daten_aufteilen, @function
daten_aufteilen:
.LFB13:
	.loc 1 97 0
	.cfi_startproc
	push r28
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.loc 1 99 0
	lds r30,zahler_array
	ldi r31,0
	ldi r28,lo8(akku_daten)
	ldi r29,hi8(akku_daten)
	ld r24,Y
	subi r30,lo8(-(temperatur_array))
	sbci r31,hi8(-(temperatur_array))
	st Z,r24
	.loc 1 100 0
	lds r30,zahler_array
	ldi r31,0
	ldd r24,Y+1
	ldi r25,0
	lsl r30
	rol r31
	subi r30,lo8(-(niedrige_akku_voltage_array))
	sbci r31,hi8(-(niedrige_akku_voltage_array))
	std Z+1,r25
	st Z,r24
	.loc 1 101 0
	lds r30,zahler_array
	ldi r31,0
	lds r26,zahler_array
	ldi r27,0
	lsl r26
	rol r27
	subi r26,lo8(-(niedrige_akku_voltage_array))
	sbci r27,hi8(-(niedrige_akku_voltage_array))
	ld r24,X+
	ld r25,X
	ldd r18,Y+2
	or r25,r18
	lsl r30
	rol r31
	subi r30,lo8(-(niedrige_akku_voltage_array))
	sbci r31,hi8(-(niedrige_akku_voltage_array))
	std Z+1,r25
	st Z,r24
	.loc 1 102 0
	lds r30,zahler_array
	ldi r31,0
	ldd r24,Y+3
	ldi r25,0
	lsl r30
	rol r31
	subi r30,lo8(-(ges_volatage_array))
	sbci r31,hi8(-(ges_volatage_array))
	std Z+1,r25
	st Z,r24
	.loc 1 103 0
	lds r30,zahler_array
	ldi r31,0
	lds r26,zahler_array
	ldi r27,0
	lsl r26
	rol r27
	subi r26,lo8(-(ges_volatage_array))
	sbci r27,hi8(-(ges_volatage_array))
	ld r24,X+
	ld r25,X
	ldd r18,Y+4
	or r25,r18
	lsl r30
	rol r31
	subi r30,lo8(-(ges_volatage_array))
	sbci r31,hi8(-(ges_volatage_array))
	std Z+1,r25
	st Z,r24
	.loc 1 105 0
	lds r24,zahler_array
	subi r24,lo8(-(1))
	sts zahler_array,r24
	.loc 1 107 0
	lds r24,zahler_array
	cpi r24,lo8(5)
	brlo .L3
	.loc 1 109 0
	sts zahler_array,__zero_reg__
.L3:
/* epilogue start */
	.loc 1 114 0
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE13:
	.size	daten_aufteilen, .-daten_aufteilen
	.section	.text.kommunikations_daten_mitteln,"ax",@progbits
.global	kommunikations_daten_mitteln
	.type	kommunikations_daten_mitteln, @function
kommunikations_daten_mitteln:
.LFB14:
	.loc 1 116 0
	.cfi_startproc
	push r17
.LCFI2:
	.cfi_def_cfa_offset 3
	.cfi_offset 17, -2
	push r28
.LCFI3:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI4:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
.LVL0:
.LBB2:
	.loc 1 117 0
	ldi r20,0
	ldi r21,0
	.loc 1 119 0
	ldi r17,lo8(-51)
.LVL1:
.L6:
	.loc 1 119 0 is_stmt 0 discriminator 3
	movw r30,r20
	subi r30,lo8(-(temperatur_array))
	sbci r31,hi8(-(temperatur_array))
	ld r25,Z
	lds r18,temperatur
	mul r25,r17
	mov r24,r1
	clr __zero_reg__
	lsr r24
	lsr r24
	add r24,r18
	sts temperatur,r24
	.loc 1 120 0 is_stmt 1 discriminator 3
	movw r30,r20
	lsl r30
	rol r31
	movw r26,r30
	subi r26,lo8(-(niedrige_akku_voltage_array))
	sbci r27,hi8(-(niedrige_akku_voltage_array))
	ld r18,X+
	ld r19,X
	lds r28,niedrige_akku_voltage
	lds r29,niedrige_akku_voltage+1
	ldi r26,lo8(-51)
	ldi r27,lo8(-52)
	call __umulhisi3
	lsr r25
	ror r24
	lsr r25
	ror r24
	add r28,r24
	adc r29,r25
	sts niedrige_akku_voltage+1,r29
	sts niedrige_akku_voltage,r28
	.loc 1 121 0 discriminator 3
	subi r30,lo8(-(ges_volatage_array))
	sbci r31,hi8(-(ges_volatage_array))
	ld r18,Z
	ldd r19,Z+1
	lds r30,ges_volatage
	lds r31,ges_volatage+1
	call __umulhisi3
	lsr r25
	ror r24
	lsr r25
	ror r24
	add r30,r24
	adc r31,r25
	sts ges_volatage+1,r31
	sts ges_volatage,r30
	.loc 1 117 0 discriminator 3
	subi r20,-1
	sbci r21,-1
.LVL2:
	cpi r20,5
	cpc r21,__zero_reg__
	breq .+2
	rjmp .L6
.LBE2:
	.loc 1 124 0
	lds r30,zahler_array
	ldi r31,0
	lsl r30
	rol r31
	subi r30,lo8(-(niedrige_akku_voltage_array))
	sbci r31,hi8(-(niedrige_akku_voltage_array))
	ld r24,Z
	ldd r25,Z+1
/* epilogue start */
	.loc 1 129 0
	pop r29
	pop r28
	pop r17
	ret
	.cfi_endproc
.LFE14:
	.size	kommunikations_daten_mitteln, .-kommunikations_daten_mitteln
	.section	.text.save_akku_daten,"ax",@progbits
.global	save_akku_daten
	.type	save_akku_daten, @function
save_akku_daten:
.LFB15:
	.loc 1 131 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 133 0
	ldi r26,lo8(empfangs_daten)
	ldi r27,hi8(empfangs_daten)
	ld r24,X
	ldi r30,lo8(akku_daten)
	ldi r31,hi8(akku_daten)
	st Z,r24
	.loc 1 134 0
	adiw r26,1
	ld r24,X
	sbiw r26,1
	std Z+1,r24
	.loc 1 135 0
	adiw r26,2
	ld r24,X
	sbiw r26,2
	std Z+2,r24
	.loc 1 136 0
	adiw r26,3
	ld r24,X
	sbiw r26,3
	std Z+3,r24
	.loc 1 137 0
	adiw r26,4
	ld r24,X
	std Z+4,r24
	ret
	.cfi_endproc
.LFE15:
	.size	save_akku_daten, .-save_akku_daten
	.section	.text.ges_spannung_uebertragung,"ax",@progbits
.global	ges_spannung_uebertragung
	.type	ges_spannung_uebertragung, @function
ges_spannung_uebertragung:
.LFB16:
	.loc 1 144 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 145 0
	lds r24,ges_volatage
	lds r25,ges_volatage+1
	cpi r24,64
	sbci r25,-100
	brlo .L11
	.loc 1 145 0 is_stmt 0 discriminator 1
	lds r24,ges_volatage
	lds r25,ges_volatage+1
	cpi r24,-63
	sbci r25,-38
	brsh .L12
	.loc 1 147 0 is_stmt 1
	lds r24,ges_volatage
	lds r25,ges_volatage+1
	ret
.L11:
	.loc 1 151 0
	ldi r24,lo8(-128)
	ldi r25,lo8(-69)
	ret
.L12:
	ldi r24,lo8(-128)
	ldi r25,lo8(-69)
	.loc 1 155 0
	ret
	.cfi_endproc
.LFE16:
	.size	ges_spannung_uebertragung, .-ges_spannung_uebertragung
	.section	.text.niedrigste_akku_voltage_uebertragung,"ax",@progbits
.global	niedrigste_akku_voltage_uebertragung
	.type	niedrigste_akku_voltage_uebertragung, @function
niedrigste_akku_voltage_uebertragung:
.LFB17:
	.loc 1 157 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 158 0
	lds r24,niedrige_akku_voltage
	lds r25,niedrige_akku_voltage+1
	cpi r24,-16
	sbci r25,10
	brlo .L15
	.loc 1 158 0 is_stmt 0 discriminator 1
	lds r24,niedrige_akku_voltage
	lds r25,niedrige_akku_voltage+1
	cpi r24,-39
	sbci r25,14
	brsh .L16
	.loc 1 160 0 is_stmt 1
	lds r24,niedrige_akku_voltage
	lds r25,niedrige_akku_voltage+1
	ret
.L15:
	.loc 1 164 0
	ldi r24,lo8(-28)
	ldi r25,lo8(12)
	ret
.L16:
	ldi r24,lo8(-28)
	ldi r25,lo8(12)
	.loc 1 167 0
	ret
	.cfi_endproc
.LFE17:
	.size	niedrigste_akku_voltage_uebertragung, .-niedrigste_akku_voltage_uebertragung
	.section	.text.temperatur_uebertragung,"ax",@progbits
.global	temperatur_uebertragung
	.type	temperatur_uebertragung, @function
temperatur_uebertragung:
.LFB18:
	.loc 1 169 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 170 0
	lds r24,temperatur
	cpi r24,lo8(61)
	brsh .L19
	.loc 1 172 0
	lds r24,temperatur
	ret
.L19:
	.loc 1 176 0
	ldi r24,lo8(20)
	.loc 1 180 0
	ret
	.cfi_endproc
.LFE18:
	.size	temperatur_uebertragung, .-temperatur_uebertragung
	.section	.text.init_ext_int_kommunikation,"ax",@progbits
.global	init_ext_int_kommunikation
	.type	init_ext_int_kommunikation, @function
init_ext_int_kommunikation:
.LFB19:
	.loc 1 182 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 183 0
	cbi 0xa,2
	.loc 1 184 0
	sbi 0xb,2
	.loc 1 186 0
	sbi 0x1d,2
	.loc 1 188 0
	ldi r30,lo8(105)
	ldi r31,0
	ld r24,Z
	.loc 1 188 0
	ori r24,lo8(32)
	st Z,r24
	.loc 1 189 0
	ld r24,Z
	.loc 1 189 0
	andi r24,lo8(-17)
	st Z,r24
	ret
	.cfi_endproc
.LFE19:
	.size	init_ext_int_kommunikation, .-init_ext_int_kommunikation
	.section	.text.ext_int_kommunikation_abfrage,"ax",@progbits
.global	ext_int_kommunikation_abfrage
	.type	ext_int_kommunikation_abfrage, @function
ext_int_kommunikation_abfrage:
.LFB20:
	.loc 1 192 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	lds r25,akku_unterladen
	cpi r25,lo8(1)
	breq .L22
	ldi r24,0
.L22:
	.loc 1 201 0
	ret
	.cfi_endproc
.LFE20:
	.size	ext_int_kommunikation_abfrage, .-ext_int_kommunikation_abfrage
	.section	.text.__vector_25,"ax",@progbits
.global	__vector_25
	.type	__vector_25, @function
__vector_25:
.LFB21:
	.loc 1 203 0
	.cfi_startproc
	push r1
.LCFI5:
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
.LCFI6:
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
.LCFI7:
	.cfi_def_cfa_offset 5
	.cfi_offset 18, -4
	push r19
.LCFI8:
	.cfi_def_cfa_offset 6
	.cfi_offset 19, -5
	push r20
.LCFI9:
	.cfi_def_cfa_offset 7
	.cfi_offset 20, -6
	push r21
.LCFI10:
	.cfi_def_cfa_offset 8
	.cfi_offset 21, -7
	push r22
.LCFI11:
	.cfi_def_cfa_offset 9
	.cfi_offset 22, -8
	push r23
.LCFI12:
	.cfi_def_cfa_offset 10
	.cfi_offset 23, -9
	push r24
.LCFI13:
	.cfi_def_cfa_offset 11
	.cfi_offset 24, -10
	push r25
.LCFI14:
	.cfi_def_cfa_offset 12
	.cfi_offset 25, -11
	push r26
.LCFI15:
	.cfi_def_cfa_offset 13
	.cfi_offset 26, -12
	push r27
.LCFI16:
	.cfi_def_cfa_offset 14
	.cfi_offset 27, -13
	push r30
.LCFI17:
	.cfi_def_cfa_offset 15
	.cfi_offset 30, -14
	push r31
.LCFI18:
	.cfi_def_cfa_offset 16
	.cfi_offset 31, -15
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 15 */
.L__stack_usage = 15
	.loc 1 206 0
	lds r24,start
	cpi r24,lo8(1)
	brne .L24
	.loc 1 206 0 is_stmt 0 discriminator 1
	lds r24,overflow_counter
	cpi r24,lo8(5)
	brsh .L25
.L24:
	.loc 1 206 0 discriminator 3
	lds r24,zahler_uebertragung
	tst r24
	breq .L23
.L25:
	.loc 1 210 0 is_stmt 1
	sts overflow_counter,__zero_reg__
	.loc 1 211 0
	out 0x26,__zero_reg__
	.loc 1 214 0
	lds r30,zahler_uebertragung
	ldi r31,0
	.loc 1 214 0
	lds r24,206
	.loc 1 214 0
	subi r30,lo8(-(empfangs_daten))
	sbci r31,hi8(-(empfangs_daten))
	st Z,r24
	.loc 1 217 0
	lds r24,zahler_uebertragung
	cpi r24,lo8(4)
	brne .L27
	.loc 1 219 0
	call save_akku_daten
.LVL3:
.L27:
	.loc 1 222 0
	lds r24,zahler_uebertragung
	subi r24,lo8(-(1))
	sts zahler_uebertragung,r24
.L23:
/* epilogue start */
	.loc 1 226 0
	pop r31
	pop r30
	pop r27
	pop r26
	pop r25
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE21:
	.size	__vector_25, .-__vector_25
	.section	.text.__vector_21,"ax",@progbits
.global	__vector_21
	.type	__vector_21, @function
__vector_21:
.LFB22:
	.loc 1 228 0
	.cfi_startproc
	push r1
.LCFI19:
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
.LCFI20:
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
.LCFI21:
	.cfi_def_cfa_offset 5
	.cfi_offset 18, -4
	push r19
.LCFI22:
	.cfi_def_cfa_offset 6
	.cfi_offset 19, -5
	push r20
.LCFI23:
	.cfi_def_cfa_offset 7
	.cfi_offset 20, -6
	push r21
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 21, -7
	push r22
.LCFI25:
	.cfi_def_cfa_offset 9
	.cfi_offset 22, -8
	push r23
.LCFI26:
	.cfi_def_cfa_offset 10
	.cfi_offset 23, -9
	push r24
.LCFI27:
	.cfi_def_cfa_offset 11
	.cfi_offset 24, -10
	push r25
.LCFI28:
	.cfi_def_cfa_offset 12
	.cfi_offset 25, -11
	push r26
.LCFI29:
	.cfi_def_cfa_offset 13
	.cfi_offset 26, -12
	push r27
.LCFI30:
	.cfi_def_cfa_offset 14
	.cfi_offset 27, -13
	push r30
.LCFI31:
	.cfi_def_cfa_offset 15
	.cfi_offset 30, -14
	push r31
.LCFI32:
	.cfi_def_cfa_offset 16
	.cfi_offset 31, -15
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 15 */
.L__stack_usage = 15
	.loc 1 229 0
	out 0x26,__zero_reg__
	.loc 1 230 0
	ldi r24,lo8(1)
	sts start,r24
	.loc 1 234 0
	sts zahler_uebertragung,__zero_reg__
	.loc 1 237 0
	lds r24,overflow_counter
	subi r24,lo8(-(1))
	sts overflow_counter,r24
	.loc 1 239 0
	cpi r24,lo8(2)
	brne .L29
	.loc 1 241 0
	call daten_aufteilen
.LVL4:
.L29:
	.loc 1 244 0
	lds r24,overflow_counter
	cpi r24,lo8(-5)
	brlo .L28
	.loc 1 246 0
	ldi r24,lo8(-6)
	sts overflow_counter,r24
.L28:
/* epilogue start */
	.loc 1 249 0
	pop r31
	pop r30
	pop r27
	pop r26
	pop r25
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE22:
	.size	__vector_21, .-__vector_21
	.section	.text.__vector_3,"ax",@progbits
.global	__vector_3
	.type	__vector_3, @function
__vector_3:
.LFB23:
	.loc 1 251 0
	.cfi_startproc
	push r1
.LCFI33:
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
.LCFI34:
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r24
.LCFI35:
	.cfi_def_cfa_offset 5
	.cfi_offset 24, -4
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	.loc 1 254 0
	ldi r24,lo8(1)
	sts akku_unterladen,r24
	.loc 1 256 0
	in r24,0x5
	.loc 1 256 0
	subi r24,lo8(-(-128))
	out 0x5,r24
/* epilogue start */
	.loc 1 259 0
	pop r24
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE23:
	.size	__vector_3, .-__vector_3
.global	akku_unterladen
	.section	.bss.akku_unterladen,"aw",@nobits
	.type	akku_unterladen, @object
	.size	akku_unterladen, 1
akku_unterladen:
	.zero	1
.global	counter_falsch
	.section	.bss.counter_falsch,"aw",@nobits
	.type	counter_falsch, @object
	.size	counter_falsch, 1
counter_falsch:
	.zero	1
	.comm	empfang_test,1,1
.global	zahler_array
	.section	.bss.zahler_array,"aw",@nobits
	.type	zahler_array, @object
	.size	zahler_array, 1
zahler_array:
	.zero	1
.global	ges_volatage
	.section	.data.ges_volatage,"aw",@progbits
	.type	ges_volatage, @object
	.size	ges_volatage, 2
ges_volatage:
	.word	-17536
.global	temperatur
	.section	.data.temperatur,"aw",@progbits
	.type	temperatur, @object
	.size	temperatur, 1
temperatur:
	.byte	20
.global	niedrige_akku_voltage
	.section	.data.niedrige_akku_voltage,"aw",@progbits
	.type	niedrige_akku_voltage, @object
	.size	niedrige_akku_voltage, 2
niedrige_akku_voltage:
	.word	3300
	.comm	ges_volatage_array,10,1
	.comm	temperatur_array,5,1
	.comm	niedrige_akku_voltage_array,10,1
.global	overflow_counter
	.section	.bss.overflow_counter,"aw",@nobits
	.type	overflow_counter, @object
	.size	overflow_counter, 1
overflow_counter:
	.zero	1
	.comm	akku_daten,5,1
	.comm	empfangs_daten,5,1
.global	zahler_uebertragung
	.section	.bss.zahler_uebertragung,"aw",@nobits
	.type	zahler_uebertragung, @object
	.size	zahler_uebertragung, 1
zahler_uebertragung:
	.zero	1
.global	bf
	.section	.bss.bf,"aw",@nobits
	.type	bf, @object
	.size	bf, 1
bf:
	.zero	1
.global	start
	.section	.bss.start,"aw",@nobits
	.type	start, @object
	.size	start, 1
start:
	.zero	1
	.text
.Letext0:
	.file 2 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x35f
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF39
	.byte	0xc
	.long	.LASF40
	.long	.LASF41
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
	.byte	0x2
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
	.byte	0x2
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF9
	.uleb128 0x5
	.byte	0x1
	.long	.LASF10
	.byte	0x1
	.byte	0x35
	.byte	0x1
	.long	.LFB11
	.long	.LFE11
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x5
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.byte	0x4d
	.byte	0x1
	.long	.LFB12
	.long	.LFE12
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x6
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.byte	0x60
	.byte	0x1
	.long	.LFB13
	.long	.LFE13
	.long	.LLST0
	.byte	0x1
	.uleb128 0x7
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.byte	0x73
	.byte	0x1
	.long	.LFB14
	.long	.LFE14
	.long	.LLST1
	.byte	0x1
	.long	0xf2
	.uleb128 0x8
	.long	.LBB2
	.long	.LBE2
	.uleb128 0x9
	.string	"k"
	.byte	0x1
	.byte	0x75
	.long	0x42
	.long	.LLST2
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0x82
	.byte	0x1
	.long	.LFB15
	.long	.LFE15
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0xa
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x8f
	.byte	0x1
	.long	0x49
	.long	.LFB16
	.long	.LFE16
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0xa
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	0x49
	.long	.LFB17
	.long	.LFE17
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0xa
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0xa8
	.byte	0x1
	.long	0x30
	.long	.LFB18
	.long	.LFE18
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x5
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0xb5
	.byte	0x1
	.long	.LFB19
	.long	.LFE19
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0xa
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.byte	0xbf
	.byte	0x1
	.long	0x30
	.long	.LFB20
	.long	.LFE20
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x7
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.byte	0xca
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.long	.LLST3
	.byte	0x1
	.long	0x1aa
	.uleb128 0xb
	.long	.LVL3
	.long	0xf2
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.byte	0xe3
	.byte	0x1
	.long	.LFB22
	.long	.LFE22
	.long	.LLST4
	.byte	0x1
	.long	0x1ce
	.uleb128 0xb
	.long	.LVL4
	.long	0xaa
	.byte	0
	.uleb128 0x6
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0xfa
	.byte	0x1
	.long	.LFB23
	.long	.LFE23
	.long	.LLST5
	.byte	0x1
	.uleb128 0xc
	.long	.LASF23
	.byte	0x1
	.byte	0x1a
	.long	0x77
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	start
	.uleb128 0xd
	.string	"bf"
	.byte	0x1
	.byte	0x1c
	.long	0x77
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	bf
	.uleb128 0xc
	.long	.LASF24
	.byte	0x1
	.byte	0x1e
	.long	0x219
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	zahler_uebertragung
	.uleb128 0xe
	.long	0x30
	.uleb128 0xf
	.long	0x235
	.long	0x22e
	.uleb128 0x10
	.long	0x22e
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF25
	.uleb128 0xe
	.long	0x3b
	.uleb128 0xc
	.long	.LASF26
	.byte	0x1
	.byte	0x20
	.long	0x24c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	empfangs_daten
	.uleb128 0xe
	.long	0x21e
	.uleb128 0xc
	.long	.LASF27
	.byte	0x1
	.byte	0x21
	.long	0x263
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	akku_daten
	.uleb128 0xe
	.long	0x21e
	.uleb128 0xc
	.long	.LASF28
	.byte	0x1
	.byte	0x22
	.long	0x77
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	overflow_counter
	.uleb128 0xf
	.long	0x28a
	.long	0x28a
	.uleb128 0x10
	.long	0x22e
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.long	0x49
	.uleb128 0xc
	.long	.LASF29
	.byte	0x1
	.byte	0x24
	.long	0x2a1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	niedrige_akku_voltage_array
	.uleb128 0xe
	.long	0x27a
	.uleb128 0xf
	.long	0x219
	.long	0x2b6
	.uleb128 0x10
	.long	0x22e
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.long	.LASF30
	.byte	0x1
	.byte	0x25
	.long	0x2c8
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	temperatur_array
	.uleb128 0xe
	.long	0x2a6
	.uleb128 0xc
	.long	.LASF31
	.byte	0x1
	.byte	0x26
	.long	0x2df
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ges_volatage_array
	.uleb128 0xe
	.long	0x27a
	.uleb128 0xc
	.long	.LASF32
	.byte	0x1
	.byte	0x28
	.long	0x28a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	niedrige_akku_voltage
	.uleb128 0xc
	.long	.LASF33
	.byte	0x1
	.byte	0x29
	.long	0x219
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	temperatur
	.uleb128 0xc
	.long	.LASF34
	.byte	0x1
	.byte	0x2a
	.long	0x28a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ges_volatage
	.uleb128 0xc
	.long	.LASF35
	.byte	0x1
	.byte	0x2c
	.long	0x219
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	zahler_array
	.uleb128 0xc
	.long	.LASF36
	.byte	0x1
	.byte	0x2e
	.long	0x77
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	empfang_test
	.uleb128 0xc
	.long	.LASF37
	.byte	0x1
	.byte	0x30
	.long	0x77
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	counter_falsch
	.uleb128 0xc
	.long	.LASF38
	.byte	0x1
	.byte	0x32
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	akku_unterladen
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0xa
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0xe
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
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
	.long	.LFE13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LFB14
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI3
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI4
	.long	.LFE14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	0
	.long	0
.LLST2:
	.long	.LVL0
	.long	.LVL1
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL1
	.long	.LFE14
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST3:
	.long	.LFB21
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI12
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 10
	.long	.LCFI13
	.long	.LCFI14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 11
	.long	.LCFI14
	.long	.LCFI15
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 12
	.long	.LCFI15
	.long	.LCFI16
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 13
	.long	.LCFI16
	.long	.LCFI17
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 14
	.long	.LCFI17
	.long	.LCFI18
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 15
	.long	.LCFI18
	.long	.LFE21
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 16
	.long	0
	.long	0
.LLST4:
	.long	.LFB22
	.long	.LCFI19
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI19
	.long	.LCFI20
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI20
	.long	.LCFI21
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI21
	.long	.LCFI22
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI22
	.long	.LCFI23
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI23
	.long	.LCFI24
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI24
	.long	.LCFI25
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI25
	.long	.LCFI26
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI26
	.long	.LCFI27
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 10
	.long	.LCFI27
	.long	.LCFI28
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 11
	.long	.LCFI28
	.long	.LCFI29
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 12
	.long	.LCFI29
	.long	.LCFI30
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 13
	.long	.LCFI30
	.long	.LCFI31
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 14
	.long	.LCFI31
	.long	.LCFI32
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 15
	.long	.LCFI32
	.long	.LFE22
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 16
	.long	0
	.long	0
.LLST5:
	.long	.LFB23
	.long	.LCFI33
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI33
	.long	.LCFI34
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI34
	.long	.LCFI35
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI35
	.long	.LFE23
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x7c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB11
	.long	.LFE11-.LFB11
	.long	.LFB12
	.long	.LFE12-.LFB12
	.long	.LFB13
	.long	.LFE13-.LFB13
	.long	.LFB14
	.long	.LFE14-.LFB14
	.long	.LFB15
	.long	.LFE15-.LFB15
	.long	.LFB16
	.long	.LFE16-.LFB16
	.long	.LFB17
	.long	.LFE17-.LFB17
	.long	.LFB18
	.long	.LFE18-.LFB18
	.long	.LFB19
	.long	.LFE19-.LFB19
	.long	.LFB20
	.long	.LFE20-.LFB20
	.long	.LFB21
	.long	.LFE21-.LFB21
	.long	.LFB22
	.long	.LFE22-.LFB22
	.long	.LFB23
	.long	.LFE23-.LFB23
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB11
	.long	.LFE11
	.long	.LFB12
	.long	.LFE12
	.long	.LFB13
	.long	.LFE13
	.long	.LFB14
	.long	.LFE14
	.long	.LFB15
	.long	.LFE15
	.long	.LFB16
	.long	.LFE16
	.long	.LFB17
	.long	.LFE17
	.long	.LFB18
	.long	.LFE18
	.long	.LFB19
	.long	.LFE19
	.long	.LFB20
	.long	.LFE20
	.long	.LFB21
	.long	.LFE21
	.long	.LFB22
	.long	.LFE22
	.long	.LFB23
	.long	.LFE23
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF21:
	.string	"__vector_21"
.LASF36:
	.string	"empfang_test"
.LASF20:
	.string	"__vector_25"
.LASF30:
	.string	"temperatur_array"
.LASF40:
	.string	".././kommunikation.c"
.LASF33:
	.string	"temperatur"
.LASF25:
	.string	"sizetype"
.LASF2:
	.string	"uint8_t"
.LASF32:
	.string	"niedrige_akku_voltage"
.LASF18:
	.string	"ext_int_kommunikation_abfrage"
.LASF31:
	.string	"ges_volatage_array"
.LASF22:
	.string	"__vector_3"
.LASF13:
	.string	"save_akku_daten"
.LASF7:
	.string	"long long int"
.LASF19:
	.string	"kommunikations_daten_mitteln"
.LASF5:
	.string	"long int"
.LASF11:
	.string	"init_transmission_timer"
.LASF14:
	.string	"ges_spannung_uebertragung"
.LASF34:
	.string	"ges_volatage"
.LASF28:
	.string	"overflow_counter"
.LASF38:
	.string	"akku_unterladen"
.LASF1:
	.string	"unsigned char"
.LASF0:
	.string	"signed char"
.LASF8:
	.string	"long long unsigned int"
.LASF4:
	.string	"unsigned int"
.LASF3:
	.string	"uint16_t"
.LASF29:
	.string	"niedrige_akku_voltage_array"
.LASF15:
	.string	"niedrigste_akku_voltage_uebertragung"
.LASF23:
	.string	"start"
.LASF17:
	.string	"init_ext_int_kommunikation"
.LASF9:
	.string	"char"
.LASF41:
	.string	"C:\\\\Users\\\\Armin Baumgartner\\\\Desktop\\\\10kW-master\\\\10kW-master\\\\ansteuerung\\\\ansteuerung\\\\Debug"
.LASF26:
	.string	"empfangs_daten"
.LASF16:
	.string	"temperatur_uebertragung"
.LASF10:
	.string	"init_usart"
.LASF24:
	.string	"zahler_uebertragung"
.LASF6:
	.string	"long unsigned int"
.LASF39:
	.string	"GNU C99 5.4.0 -mn-flash=1 -mno-skip-bug -mmcu=avr5 -g2 -O1 -std=gnu99 -funsigned-char -funsigned-bitfields -ffunction-sections -fdata-sections -fpack-struct -fshort-enums"
.LASF27:
	.string	"akku_daten"
.LASF12:
	.string	"daten_aufteilen"
.LASF35:
	.string	"zahler_array"
.LASF37:
	.string	"counter_falsch"
	.ident	"GCC: (AVR_8_bit_GNU_Toolchain_3.6.1_1750) 5.4.0"
.global __do_copy_data
.global __do_clear_bss

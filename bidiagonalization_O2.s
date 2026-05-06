	.arch armv8-a
	.file	"bidiagonalization.cpp"
	.text
	.section	.text._ZNSt12_Vector_baseIdSaIdEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEED5Ev,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt12_Vector_baseIdSaIdEED2Ev
	.type	_ZNSt12_Vector_baseIdSaIdEED2Ev, %function
_ZNSt12_Vector_baseIdSaIdEED2Ev:
.LFB8234:
	.cfi_startproc
	mov	x2, x0
	ldr	x0, [x0]
	cbz	x0, .L1
	ldr	x1, [x2, 16]
	sub	x1, x1, x0
	b	_ZdlPvm
	.p2align 2,,3
.L1:
	ret
	.cfi_endproc
.LFE8234:
	.size	_ZNSt12_Vector_baseIdSaIdEED2Ev, .-_ZNSt12_Vector_baseIdSaIdEED2Ev
	.weak	_ZNSt12_Vector_baseIdSaIdEED1Ev
	.set	_ZNSt12_Vector_baseIdSaIdEED1Ev,_ZNSt12_Vector_baseIdSaIdEED2Ev
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"to_bidiagonal: requires m >= n"
	.align	3
.LC1:
	.string	"cannot create std::vector larger than max_size()"
	.text
	.align	2
	.p2align 4,,11
	.global	_Z13to_bidiagonalRK6MatrixRS_S2_
	.type	_Z13to_bidiagonalRK6MatrixRS_S2_, %function
_Z13to_bidiagonalRK6MatrixRS_S2_:
.LFB7946:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA7946
	stp	x29, x30, [sp, -368]!
	.cfi_def_cfa_offset 368
	.cfi_offset 29, -368
	.cfi_offset 30, -360
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -352
	.cfi_offset 20, -344
	mov	x19, x0
	ldp	w20, w0, [x0]
	stp	x27, x28, [sp, 80]
	stp	d8, d9, [sp, 96]
	str	d10, [sp, 112]
	str	w0, [sp, 148]
	str	x1, [sp, 168]
	cmp	w20, w0
	.cfi_offset 27, -288
	.cfi_offset 28, -280
	.cfi_offset 72, -272
	.cfi_offset 73, -264
	.cfi_offset 74, -256
	blt	.L228
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -328
	.cfi_offset 21, -336
	add	x22, x8, 8
	ldr	w0, [sp, 148]
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -312
	.cfi_offset 23, -320
	mov	x24, x8
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -296
	.cfi_offset 25, -304
	mov	x26, x2
	ldr	x21, [x19, 16]
	stp	w20, w0, [x8]
	ldr	x0, [x19, 8]
	str	xzr, [x8, 8]
	stp	xzr, xzr, [x22, 8]
	subs	x21, x21, x0
	beq	.L151
	mov	x0, 9223372036854775800
	cmp	x21, x0
	bhi	.L229
	mov	x0, x21
.LEHB0:
	bl	_Znwm
.LEHE0:
	mov	x3, x0
.L6:
	str	x3, [x24, 8]
	add	x21, x3, x21
	stp	x3, x21, [x22, 8]
	ldp	x1, x0, [x19, 8]
	sub	x19, x0, x1
	cmp	x1, x0
	beq	.L9
	mov	x0, x3
	mov	x2, x19
	bl	memmove
	mov	x3, x0
.L9:
	mul	w0, w20, w20
	add	x3, x3, x19
	str	x3, [x22, 8]
	cbz	w0, .L152
	sbfiz	x19, x0, 3, 32
	mov	x0, x19
.LEHB1:
	bl	_Znwm
	mov	x2, x19
	mov	x21, x0
	add	x19, x0, x19
	mov	w1, 0
	bl	memset
.L10:
	ldr	x2, [sp, 168]
	add	x1, x2, 8
	mov	x3, x1
	str	x3, [sp, 192]
	ldr	x0, [x2, 8]
	ldr	x1, [x1, 16]
	stp	w20, w20, [x2]
	str	x21, [x2, 8]
	stp	x19, x19, [x3, 8]
	cbz	x0, .L11
	sub	x1, x1, x0
	bl	_ZdlPvm
.L11:
	cmp	w20, 0
	ble	.L15
	ldr	x0, [sp, 168]
	mov	w1, 0
	fmov	d0, 1.0e+0
	ldrsw	x2, [x0, 4]
	ldr	x0, [x0, 8]
	add	x2, x2, 1
	lsl	x2, x2, 3
	.p2align 3,,7
.L16:
	add	w1, w1, 1
	str	d0, [x0]
	add	x0, x0, x2
	cmp	w1, w20
	bne	.L16
.L15:
	ldr	w0, [sp, 148]
	mov	x21, 0
	mov	x19, 0
	mul	w0, w0, w0
	cbz	w0, .L14
	sbfiz	x19, x0, 3, 32
	mov	x0, x19
	bl	_Znwm
	mov	x2, x19
	mov	x21, x0
	add	x19, x0, x19
	mov	w1, 0
	bl	memset
.L14:
	add	x25, x26, 8
	ldr	w1, [sp, 148]
	ldr	x0, [x26, 8]
	stp	w1, w1, [x26]
	ldr	x1, [x25, 16]
	str	x21, [x26, 8]
	stp	x19, x19, [x25, 8]
	cbz	x0, .L17
	sub	x1, x1, x0
	bl	_ZdlPvm
.L17:
	ldr	w3, [sp, 148]
	cmp	w3, 0
	ble	.L4
	ldrsw	x2, [x26, 4]
	mov	w1, 0
	ldr	x0, [x26, 8]
	add	x2, x2, 1
	fmov	d0, 1.0e+0
	lsl	x2, x2, 3
	.p2align 3,,7
.L20:
	add	w1, w1, 1
	str	d0, [x0]
	add	x0, x0, x2
	cmp	w1, w3
	bne	.L20
	sxtw	x0, w20
	mov	x1, x0
	str	x1, [sp, 176]
	mov	x0, 1152921504606846975
	cmp	x1, x0
	bhi	.L144
	ldr	x1, [sp, 176]
	stp	xzr, x1, [sp, 128]
	mov	w19, w20
	mov	w23, 0
	lsl	x0, x1, 3
	adrp	x1, .LC2
	str	x0, [sp, 208]
	ldr	w0, [sp, 148]
	ldr	d9, [x1, #:lo12:.LC2]
	sub	w1, w20, #1
	sub	w21, w0, #1
	sbfiz	x2, x0, 3, 32
	sub	w0, w0, #2
	stp	w0, w1, [sp, 160]
	adrp	x1, .LC3
	str	x2, [sp, 200]
	ldr	d10, [x1, #:lo12:.LC3]
	.p2align 3,,7
.L21:
	ldr	x0, [sp, 136]
	stp	xzr, xzr, [sp, 248]
	str	xzr, [sp, 264]
	lsl	x28, x0, 3
	str	x28, [sp, 152]
	cbz	x0, .L22
	mov	x0, x28
	bl	_Znwm
.LEHE1:
	mov	x2, x28
	add	x28, x0, x28
	str	x0, [sp, 248]
	mov	x27, x0
	str	x28, [sp, 264]
	cmp	x28, x0
	beq	.L23
	mov	w1, 0
	bl	memset
	str	x28, [sp, 256]
	cmp	w19, 0
	ble	.L24
.L25:
	ldr	w1, [x24, 4]
	mov	x0, 0
	ldr	x4, [sp, 128]
	sbfiz	x2, x1, 3, 32
	mul	w1, w1, w23
	ldr	x3, [x22]
	add	x1, x4, x1, sxtw
	add	x1, x3, x1, lsl 3
	.p2align 3,,7
.L28:
	ldr	d0, [x1]
	add	x1, x1, x2
	str	d0, [x27, x0, lsl 3]
	add	x0, x0, 1
	cmp	w19, w0
	bgt	.L28
	cmp	x28, x27
	beq	.L161
.L24:
	movi	d8, #0
	mov	x0, x27
	.p2align 3,,7
.L29:
	ldr	d1, [x0], 8
	fmadd	d8, d1, d1, d8
	cmp	x28, x0
	bne	.L29
	fcmp	d8, #0.0
	bpl	.L26
	fmov	d0, d8
	bl	sqrt
	fmov	d8, d0
	b	.L32
	.p2align 2,,3
.L22:
	mov	x27, 0
	mov	x28, 0
	str	xzr, [sp, 248]
	str	xzr, [sp, 264]
.L23:
	str	x28, [sp, 256]
	cmp	w19, 0
	bgt	.L25
.L161:
	movi	d8, #0
	.p2align 3,,7
.L26:
	fsqrt	d8, d8
.L32:
	fcmpe	d8, d9
	bgt	.L172
.L33:
	add	w27, w23, 1
	cmp	w27, w20
	bge	.L76
	ldr	w0, [x24, 4]
	mov	w1, w27
	ldr	x4, [sp, 128]
	sbfiz	x2, x0, 3, 32
	mul	w0, w27, w0
	ldr	x3, [x22]
	add	x0, x4, x0, sxtw
	add	x0, x3, x0, lsl 3
	.p2align 3,,7
.L77:
	add	w1, w1, 1
	str	xzr, [x0]
	add	x0, x0, x2
	cmp	w1, w20
	bne	.L77
.L76:
	ldr	w1, [sp, 128]
	ldr	w0, [sp, 160]
	cmp	w0, w1
	bgt	.L230
.L75:
	ldr	x0, [sp, 248]
	cbz	x0, .L130
	ldr	x1, [sp, 264]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L130:
	ldr	w0, [sp, 148]
	cmp	w27, w0
	beq	.L4
	ldr	x0, [sp, 136]
	sub	w19, w19, #1
	sub	w21, w21, #1
	sub	x1, x0, #1
	ldr	x0, [sp, 128]
	add	x0, x0, 1
	stp	x0, x1, [sp, 128]
	mov	x0, 1152921504606846975
	cmp	x1, x0
	bhi	.L144
	mov	w23, w27
	b	.L21
	.p2align 2,,3
.L172:
	ldr	w0, [sp, 164]
	cmp	w0, w23
	ble	.L33
	ldp	x1, x0, [sp, 248]
	fneg	d0, d8
	ldr	d1, [x1]
	sub	x27, x0, x1
	stp	xzr, xzr, [sp, 296]
	mov	x28, x27
	fcmpe	d1, #0.0
	str	xzr, [sp, 312]
	fcsel	d8, d8, d0, ge
	cbz	x27, .L36
	mov	x0, 9223372036854775800
	cmp	x27, x0
	bhi	.L231
	mov	x0, x27
.LEHB2:
	bl	_Znwm
	mov	x3, x0
	add	x27, x0, x27
	ldp	x1, x0, [sp, 248]
	stp	x3, x3, [sp, 296]
	str	x27, [sp, 312]
	sub	x2, x0, x1
	cmp	x1, x0
	bne	.L148
.L38:
	ldr	d0, [x3]
	add	x2, x3, x2
	str	x2, [sp, 304]
	fadd	d0, d8, d0
	str	d0, [x3]
	cmp	x2, x3
	beq	.L39
	movi	d1, #0
	add	x1, x3, 8
	b	.L41
	.p2align 2,,3
.L232:
	ldr	d0, [x1], 8
.L41:
	fmadd	d1, d0, d0, d1
	cmp	x2, x1
	bne	.L232
	fcmpe	d1, d10
	bgt	.L173
.L39:
	mov	x1, x28
	mov	x0, x3
	bl	_ZdlPvm
	b	.L33
.L36:
	stp	xzr, xzr, [sp, 296]
	mov	x2, 0
	mov	x3, 0
	str	xzr, [sp, 312]
	cmp	x1, x0
	beq	.L233
.L148:
	mov	x0, x3
	str	x2, [sp, 184]
	bl	memmove
	mov	x3, x0
	ldr	x2, [sp, 184]
	b	.L38
	.p2align 2,,3
.L230:
	sxtw	x0, w21
	mov	x1, 1152921504606846975
	cmp	x0, x1
	bhi	.L234
	stp	xzr, xzr, [sp, 272]
	lsl	x2, x0, 3
	str	xzr, [sp, 288]
	cbz	x0, .L79
	mov	x0, x2
	str	x2, [sp, 184]
	bl	_Znwm
.LEHE2:
	ldr	x2, [sp, 184]
	str	x0, [sp, 272]
	mov	x28, x0
	add	x3, x0, x2
	str	x3, [sp, 288]
	cmp	x3, x0
	beq	.L80
	mov	w1, 0
	str	x3, [sp, 184]
	bl	memset
	ldr	x3, [sp, 184]
	str	x3, [sp, 280]
	cmp	w21, 0
	ble	.L81
.L82:
	ldr	w0, [x24, 4]
	mov	x1, 0
	ldr	x4, [sp, 128]
	ldr	x2, [x22]
	mul	w0, w23, w0
	add	x0, x4, x0, sxtw
	add	x0, x0, 1
	add	x0, x2, x0, lsl 3
	.p2align 3,,7
.L85:
	ldr	d0, [x0, x1, lsl 3]
	str	d0, [x28, x1, lsl 3]
	add	x1, x1, 1
	cmp	w21, w1
	bgt	.L85
	cmp	x3, x28
	beq	.L159
.L81:
	movi	d0, #0
	mov	x0, x28
	.p2align 3,,7
.L86:
	ldr	d1, [x0], 8
	fmadd	d0, d1, d1, d0
	cmp	x3, x0
	bne	.L86
	fcmp	d0, #0.0
	bpl	.L83
	bl	sqrt
	fmov	d8, d0
	b	.L89
	.p2align 2,,3
.L79:
	movi	d0, #0
	stp	xzr, xzr, [sp, 272]
	str	xzr, [sp, 288]
.L83:
	fsqrt	d8, d0
.L89:
	fcmpe	d8, d9
	bgt	.L174
.L90:
	ldr	w1, [sp, 148]
	add	w0, w23, 2
	cmp	w0, w1
	bge	.L129
	ldr	w3, [x24, 4]
	sxtw	x0, w0
	ldr	w1, [sp, 160]
	ldr	x4, [x22]
	sub	w2, w1, w27
	mul	w3, w23, w3
	add	x2, x2, 1
	mov	w1, 0
	lsl	x2, x2, 3
	add	x0, x0, x3, sxtw
	add	x0, x4, x0, lsl 3
	bl	memset
.L129:
	ldr	x0, [sp, 272]
	cbz	x0, .L75
	ldr	x1, [sp, 288]
	sub	x1, x1, x0
	bl	_ZdlPvm
	b	.L75
	.p2align 2,,3
.L4:
	mov	x0, x24
	ldr	d10, [sp, 112]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	x29, x30, [sp], 368
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 74
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
.L174:
	.cfi_restore_state
	ldp	x1, x0, [sp, 272]
	fneg	d0, d8
	ldr	d1, [x1]
	sub	x28, x0, x1
	str	x28, [sp, 184]
	stp	xzr, xzr, [sp, 296]
	fcmpe	d1, #0.0
	str	xzr, [sp, 312]
	fcsel	d8, d8, d0, ge
	cbz	x28, .L93
	mov	x0, 9223372036854775800
	cmp	x28, x0
	bhi	.L235
	mov	x0, x28
.LEHB3:
	bl	_Znwm
.LEHE3:
	mov	x3, x0
	add	x4, x0, x28
	ldp	x1, x0, [sp, 272]
	stp	x3, x3, [sp, 296]
	str	x4, [sp, 312]
	sub	x2, x0, x1
	cmp	x1, x0
	bne	.L146
.L95:
	ldr	d0, [x3]
	add	x2, x3, x2
	str	x2, [sp, 304]
	fadd	d0, d8, d0
	str	d0, [x3]
	cmp	x2, x3
	beq	.L96
	movi	d1, #0
	add	x1, x3, 8
	b	.L98
	.p2align 2,,3
.L236:
	ldr	d0, [x1], 8
.L98:
	fmadd	d1, d0, d0, d1
	cmp	x2, x1
	bne	.L236
	fcmpe	d1, d10
	bgt	.L175
.L96:
	ldr	x1, [sp, 184]
	mov	x0, x3
	bl	_ZdlPvm
	b	.L90
.L93:
	stp	xzr, xzr, [sp, 296]
	mov	x2, 0
	mov	x3, 0
	str	xzr, [sp, 312]
	cmp	x0, x1
	beq	.L237
.L146:
	mov	x0, x3
	str	x2, [sp, 216]
	bl	memmove
	mov	x3, x0
	ldr	x2, [sp, 216]
	b	.L95
.L151:
	mov	x3, 0
	b	.L6
.L152:
	mov	x21, 0
	mov	x19, 0
	b	.L10
.L175:
	ldr	x0, [sp, 136]
	fmov	d8, 2.0e+0
	stp	xzr, xzr, [sp, 320]
	fdiv	d8, d8, d1
	str	xzr, [sp, 336]
	cbz	x0, .L100
	ldr	x28, [sp, 152]
	mov	x0, x28
.LEHB4:
	bl	_Znwm
.LEHE4:
	mov	x2, x28
	add	x28, x0, x28
	str	x0, [sp, 320]
	str	x28, [sp, 336]
	cmp	x28, x0
	beq	.L101
	mov	w1, 0
	bl	memset
.L101:
	str	x28, [sp, 328]
	cmp	w19, 0
	ble	.L102
	ldr	w0, [sp, 160]
	mov	x10, 0
	ldr	x13, [sp, 128]
	sub	w6, w0, w27
	ldr	x12, [sp, 320]
	and	w6, w6, -2
	add	w6, w6, 2
	mov	w5, w13
	mov	x11, x12
	add	w7, w13, 1
	add	w8, w19, w13
	mov	w9, w13
	.p2align 3,,7
.L107:
	cmp	w21, 1
	ble	.L156
	ldr	w3, [x24, 4]
	mov	w1, w6
	movi	v0.2d, 0
	mov	x14, 0
	ldr	x4, [sp, 296]
	mov	w2, 0
	mul	w3, w9, w3
	.p2align 3,,7
.L104:
	add	w0, w7, w2
	add	w2, w2, 2
	add	w0, w3, w0
	ldr	x15, [x22]
	sbfiz	x0, x0, 3, 32
	ldr	q2, [x4, x14]
	add	x14, x14, 16
	ldr	q1, [x15, x0]
	fmla	v0.2d, v2.2d, v1.2d
	cmp	w2, w6
	bne	.L104
.L103:
	add	x0, sp, 512
	str	q0, [x0, -168]
	ldp	d0, d1, [sp, 344]
	fadd	d0, d0, d1
	cmp	w21, w1
	ble	.L105
	ldr	w3, [x24, 4]
	sxtw	x0, w1
	ldr	x2, [x22]
	ldr	x4, [sp, 296]
	mul	w1, w9, w3
	add	x1, x13, x1, sxtw
	add	x1, x1, 1
	add	x1, x2, x1, lsl 3
	.p2align 3,,7
.L106:
	ldr	d2, [x1, x0, lsl 3]
	ldr	d1, [x4, x0, lsl 3]
	add	x0, x0, 1
	fmadd	d0, d2, d1, d0
	cmp	w21, w0
	bgt	.L106
.L105:
	add	w9, w9, 1
	str	d0, [x12, x10]
	add	x10, x10, 8
	cmp	w8, w9
	bne	.L107
	mov	x10, 0
	ldr	w0, [sp, 160]
	add	w9, w5, 1
	mov	x2, 0
	ldr	d3, [x11, x10]
	sub	w7, w0, w27
	and	w7, w7, -2
	mov	w1, 0
	add	w7, w7, 2
	fmul	d3, d8, d3
	mov	w11, w7
	dup	v2.2d, v3.d[0]
	cmp	w21, 1
	ble	.L238
	.p2align 3,,7
.L111:
	ldr	w0, [x24, 4]
	add	w6, w9, w1
	ldr	x3, [x22]
	add	w1, w1, 2
	ldr	x4, [sp, 296]
	madd	w0, w5, w0, w6
	sbfiz	x0, x0, 3, 32
	ldr	q1, [x4, x2]
	add	x2, x2, 16
	ldr	q0, [x3, x0]
	fmls	v0.2d, v1.2d, v2.2d
	str	q0, [x3, x0]
	cmp	w1, w7
	bne	.L111
.L110:
	cmp	w21, w11
	ble	.L109
	ldr	w0, [x24, 4]
	add	w3, w27, w11
	ldr	x2, [sp, 296]
	ldr	x1, [x22]
	madd	w0, w5, w0, w3
	ldr	d1, [x2, w11, sxtw 3]
	sxtw	x0, w0
	ldr	d0, [x1, x0, lsl 3]
	fmsub	d0, d3, d1, d0
	str	d0, [x1, x0, lsl 3]
.L109:
	add	w5, w5, 1
	add	x10, x10, 8
	cmp	w8, w5
	beq	.L102
	ldr	x11, [sp, 320]
	mov	x2, 0
	mov	w1, 0
	ldr	d3, [x11, x10]
	mov	w11, w7
	fmul	d3, d8, d3
	dup	v2.2d, v3.d[0]
	cmp	w21, 1
	bgt	.L111
.L238:
	mov	w11, 0
	b	.L110
.L173:
	ldr	w0, [sp, 148]
	fmov	d8, 2.0e+0
	mov	x1, 1152921504606846975
	fdiv	d8, d8, d1
	sub	w27, w0, w23
	sxtw	x0, w27
	cmp	x0, x1
	bhi	.L239
	stp	xzr, xzr, [sp, 320]
	lsl	x28, x0, 3
	str	xzr, [sp, 336]
	cbz	x0, .L44
	mov	x0, x28
.LEHB5:
	bl	_Znwm
.LEHE5:
	add	x3, x0, x28
	str	x0, [sp, 320]
	str	x3, [sp, 336]
	mov	x4, x0
	cmp	x3, x0
	beq	.L45
	mov	x2, x28
	mov	w1, 0
	str	x3, [sp, 184]
	str	x0, [sp, 216]
	bl	memset
	ldr	x3, [sp, 184]
	ldr	x4, [sp, 216]
.L45:
	str	x3, [sp, 328]
	cmp	w27, 0
	ble	.L143
	ldr	x5, [sp, 296]
	mov	x2, 0
	.p2align 3,,7
.L48:
	cmp	w19, 0
	ble	.L52
	ldr	w3, [x24, 4]
	add	w1, w23, w2
	ldr	x7, [x22]
	mov	x0, 0
	ldr	d0, [x4, x2, lsl 3]
	mul	w6, w3, w23
	sbfiz	x3, x3, 3, 32
	sxtw	x6, w6
	add	x1, x6, x1, sxtw
	add	x1, x7, x1, lsl 3
	.p2align 3,,7
.L53:
	ldr	d2, [x5, x0, lsl 3]
	add	x0, x0, 1
	ldr	d1, [x1]
	add	x1, x1, x3
	fmadd	d0, d2, d1, d0
	str	d0, [x4, x2, lsl 3]
	cmp	w19, w0
	bgt	.L53
.L52:
	add	x2, x2, 1
	cmp	w27, w2
	bgt	.L48
.L143:
	ldr	w0, [sp, 160]
	add	w10, w23, w19
	mov	w6, w23
	mov	x8, 0
	sub	w7, w0, w23
	and	w7, w7, -2
	add	w7, w7, 2
	cmp	w19, 0
	ble	.L58
	.p2align 3,,7
.L59:
	ldr	x0, [sp, 296]
	mov	w9, w7
	mov	x2, 0
	mov	w1, 0
	ldr	d3, [x0, x8]
	fmul	d3, d8, d3
	dup	v2.2d, v3.d[0]
	cmp	w27, 1
	ble	.L240
	.p2align 3,,7
.L57:
	ldr	w0, [x24, 4]
	add	w5, w1, w23
	ldr	x3, [x22]
	add	w1, w1, 2
	ldr	x4, [sp, 320]
	madd	w0, w6, w0, w5
	sbfiz	x0, x0, 3, 32
	ldr	q1, [x4, x2]
	add	x2, x2, 16
	ldr	q0, [x3, x0]
	fmls	v0.2d, v2.2d, v1.2d
	str	q0, [x3, x0]
	cmp	w1, w7
	bne	.L57
.L56:
	cmp	w27, w9
	ble	.L55
	ldr	w0, [x24, 4]
	add	w3, w9, w23
	ldr	x2, [sp, 320]
	ldr	x1, [x22]
	madd	w0, w6, w0, w3
	ldr	d1, [x2, w9, sxtw 3]
	sxtw	x0, w0
	ldr	d0, [x1, x0, lsl 3]
	fmsub	d0, d3, d1, d0
	str	d0, [x1, x0, lsl 3]
.L55:
	add	w6, w6, 1
	add	x8, x8, 8
	cmp	w10, w6
	bne	.L59
.L58:
	ldr	x0, [sp, 176]
	stp	xzr, xzr, [sp, 344]
	str	xzr, [sp, 360]
	cbz	x0, .L51
	ldr	x28, [sp, 208]
	mov	x0, x28
.LEHB6:
	bl	_Znwm
.LEHE6:
	mov	x2, x28
	add	x28, x0, x28
	str	x0, [sp, 344]
	mov	x27, x0
	str	x28, [sp, 360]
	cmp	x28, x0
	beq	.L60
	mov	w1, 0
	bl	memset
.L60:
	str	x28, [sp, 352]
	cmp	w20, 0
	ble	.L61
	ldr	x5, [sp, 128]
	mov	x2, 0
	ldr	x6, [sp, 168]
	ldr	x7, [sp, 192]
	ldr	x3, [sp, 296]
	.p2align 3,,7
.L64:
	cmp	w19, 0
	ble	.L65
	ldr	w1, [x6, 4]
	mov	x0, 0
	ldr	x4, [x7]
	ldr	d0, [x27, x2, lsl 3]
	mul	w1, w1, w2
	add	x1, x5, x1, sxtw
	add	x1, x4, x1, lsl 3
	.p2align 3,,7
.L66:
	ldr	d2, [x1, x0, lsl 3]
	ldr	d1, [x3, x0, lsl 3]
	add	x0, x0, 1
	fmadd	d0, d2, d1, d0
	str	d0, [x27, x2, lsl 3]
	cmp	w19, w0
	bgt	.L66
.L65:
	add	x2, x2, 1
	cmp	w20, w2
	bgt	.L64
	sub	w7, w20, #2
	mov	x8, 0
	sub	w7, w7, w23
	and	w7, w7, -2
	ldr	x9, [sp, 168]
	add	w7, w7, 2
	ldr	x10, [sp, 192]
	.p2align 3,,7
.L63:
	mov	w6, w8
	ldr	d3, [x27, x8, lsl 3]
	mov	x2, 0
	mov	w1, 0
	fmul	d3, d8, d3
	dup	v2.2d, v3.d[0]
	cmp	w19, 1
	ble	.L70
	.p2align 3,,7
.L69:
	ldr	w0, [x9, 4]
	add	w5, w1, w23
	ldr	x3, [x10]
	add	w1, w1, 2
	ldr	x4, [sp, 296]
	madd	w0, w6, w0, w5
	sbfiz	x0, x0, 3, 32
	ldr	q1, [x4, x2]
	add	x2, x2, 16
	ldr	q0, [x3, x0]
	fmls	v0.2d, v1.2d, v2.2d
	str	q0, [x3, x0]
	cmp	w1, w7
	bne	.L69
	ldr	x27, [sp, 344]
.L70:
	cmp	w19, w1
	ble	.L68
	ldr	w2, [x9, 4]
	add	w0, w1, w23
	ldr	x3, [sp, 296]
	madd	w0, w6, w2, w0
	ldr	x2, [x10]
	sxtw	x0, w0
	ldr	d1, [x3, w1, sxtw 3]
	ldr	d0, [x2, x0, lsl 3]
	fmsub	d0, d3, d1, d0
	str	d0, [x2, x0, lsl 3]
.L68:
	add	x8, x8, 1
	cmp	w20, w8
	bgt	.L63
	ldr	x28, [sp, 360]
	cbz	x27, .L51
.L61:
	sub	x1, x28, x27
	mov	x0, x27
	bl	_ZdlPvm
.L51:
	ldr	x0, [sp, 320]
	cbz	x0, .L71
	ldr	x1, [sp, 336]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L71:
	ldr	x3, [sp, 296]
	cbz	x3, .L33
	ldr	x28, [sp, 312]
	sub	x28, x28, x3
	b	.L39
	.p2align 2,,3
.L100:
	mov	x28, 0
	str	xzr, [sp, 320]
	str	xzr, [sp, 336]
	b	.L101
.L44:
	stp	xzr, xzr, [sp, 320]
	str	xzr, [sp, 336]
	b	.L143
.L233:
	ldr	d0, [x27]
	str	xzr, [sp, 304]
	fadd	d0, d0, d8
	str	d0, [x27]
	b	.L39
.L102:
	ldr	x28, [sp, 200]
	stp	xzr, xzr, [sp, 344]
	mov	x0, x28
	str	xzr, [sp, 360]
.LEHB7:
	bl	_Znwm
.LEHE7:
	mov	x2, x28
	mov	w1, 0
	add	x28, x0, x28
	str	x0, [sp, 344]
	str	x28, [sp, 360]
	bl	memset
	ldr	w0, [sp, 160]
	mov	x1, 0
	ldr	x13, [sp, 128]
	sub	w10, w0, w27
	ldr	x12, [sp, 344]
	and	w10, w10, -2
	ldr	w9, [sp, 148]
	add	w10, w10, 2
	mov	x0, x12
	add	w11, w13, 1
	str	x28, [sp, 352]
	.p2align 3,,7
.L117:
	mov	w7, w1
	cmp	w21, 1
	ble	.L157
	ldr	w14, [x26, 4]
	mov	w3, w10
	movi	v0.2d, 0
	mov	x5, 0
	ldr	x6, [sp, 296]
	mov	w4, 0
	mul	w14, w1, w14
	.p2align 3,,7
.L114:
	add	w2, w11, w4
	add	w4, w4, 2
	add	w2, w14, w2
	ldr	x8, [x25]
	sbfiz	x2, x2, 3, 32
	ldr	q2, [x6, x5]
	add	x5, x5, 16
	ldr	q1, [x8, x2]
	fmla	v0.2d, v2.2d, v1.2d
	cmp	w4, w10
	bne	.L114
.L113:
	str	q0, [sp, 232]
	ldp	d0, d1, [sp, 232]
	fadd	d0, d0, d1
	cmp	w21, w3
	ble	.L115
	ldr	w14, [x26, 4]
	sxtw	x2, w3
	ldr	x4, [x25]
	ldr	x6, [sp, 296]
	mul	w3, w7, w14
	add	x3, x13, x3, sxtw
	add	x3, x3, 1
	add	x3, x4, x3, lsl 3
	.p2align 3,,7
.L116:
	ldr	d2, [x3, x2, lsl 3]
	ldr	d1, [x6, x2, lsl 3]
	add	x2, x2, 1
	fmadd	d0, d2, d1, d0
	cmp	w21, w2
	bgt	.L116
.L115:
	str	d0, [x12, x1, lsl 3]
	add	x1, x1, 1
	cmp	w9, w1
	bgt	.L117
	ldr	w1, [sp, 160]
	mov	x9, 0
	ldr	w10, [sp, 148]
	sub	w7, w1, w27
	ldr	w1, [sp, 128]
	and	w7, w7, -2
	add	w7, w7, 2
	add	w8, w1, 1
	.p2align 3,,7
.L122:
	ldr	d3, [x0, x9, lsl 3]
	mov	w6, w9
	mov	x2, 0
	mov	w1, 0
	fmul	d3, d8, d3
	dup	v2.2d, v3.d[0]
	cmp	w21, 1
	ble	.L121
	.p2align 3,,7
.L120:
	ldr	w0, [x26, 4]
	add	w5, w8, w1
	ldr	x3, [x25]
	add	w1, w1, 2
	ldr	x4, [sp, 296]
	madd	w0, w6, w0, w5
	sbfiz	x0, x0, 3, 32
	ldr	q1, [x4, x2]
	add	x2, x2, 16
	ldr	q0, [x3, x0]
	fmls	v0.2d, v1.2d, v2.2d
	str	q0, [x3, x0]
	cmp	w1, w7
	bne	.L120
	ldr	x0, [sp, 344]
.L121:
	cmp	w21, w1
	ble	.L119
	ldr	w3, [x26, 4]
	add	w2, w27, w1
	ldr	x4, [sp, 296]
	madd	w2, w6, w3, w2
	ldr	x3, [x25]
	sxtw	x2, w2
	ldr	d1, [x4, w1, sxtw 3]
	ldr	d0, [x3, x2, lsl 3]
	fmsub	d0, d3, d1, d0
	str	d0, [x3, x2, lsl 3]
.L119:
	add	x9, x9, 1
	cmp	w10, w9
	bgt	.L122
	cbz	x0, .L123
	ldr	x1, [sp, 360]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L123:
	ldr	x0, [sp, 320]
	cbz	x0, .L124
	ldr	x1, [sp, 336]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L124:
	ldr	x3, [sp, 296]
	cbz	x3, .L90
	ldr	x28, [sp, 312]
	sub	x0, x28, x3
	str	x0, [sp, 184]
	b	.L96
	.p2align 2,,3
.L157:
	movi	v0.2d, 0
	mov	w3, 0
	b	.L113
.L156:
	movi	v0.2d, 0
	mov	w1, 0
	b	.L103
.L240:
	mov	w9, 0
	b	.L56
.L80:
	str	x3, [sp, 280]
	cmp	w21, 0
	bgt	.L82
.L159:
	movi	d0, #0
	b	.L83
	.p2align 2,,3
.L237:
	ldr	d0, [x28]
	str	xzr, [sp, 304]
	fadd	d0, d0, d8
	str	d0, [x28]
	b	.L96
.L234:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
.LEHB8:
	bl	_ZSt20__throw_length_errorPKc
.LEHE8:
.L229:
.LEHB9:
	bl	_ZSt17__throw_bad_allocv
.LEHE9:
	.p2align 2,,3
.L144:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
.LEHB10:
	bl	_ZSt20__throw_length_errorPKc
.LEHE10:
.L235:
.LEHB11:
	bl	_ZSt17__throw_bad_allocv
.LEHE11:
.L231:
.LEHB12:
	bl	_ZSt17__throw_bad_allocv
.LEHE12:
.L239:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
.LEHB13:
	bl	_ZSt20__throw_length_errorPKc
.LEHE13:
.L171:
.L170:
	mov	x19, x0
	add	x0, sp, 320
	bl	_ZNSt12_Vector_baseIdSaIdEED2Ev
.L140:
	add	x0, sp, 296
	bl	_ZNSt12_Vector_baseIdSaIdEED2Ev
.L141:
	add	x0, sp, 272
	bl	_ZNSt12_Vector_baseIdSaIdEED2Ev
.L137:
	add	x0, sp, 248
	bl	_ZNSt12_Vector_baseIdSaIdEED2Ev
.L142:
	mov	x0, x22
	bl	_ZNSt12_Vector_baseIdSaIdEED2Ev
	mov	x0, x19
.LEHB14:
	bl	_Unwind_Resume
.LEHE14:
.L166:
.L165:
	mov	x19, x0
	add	x0, sp, 320
	bl	_ZNSt12_Vector_baseIdSaIdEED2Ev
.L136:
	add	x0, sp, 296
	bl	_ZNSt12_Vector_baseIdSaIdEED2Ev
	b	.L137
.L164:
	mov	x19, x0
	b	.L136
.L169:
	mov	x19, x0
	b	.L140
.L163:
	mov	x19, x0
	b	.L142
.L168:
	mov	x19, x0
	b	.L141
.L167:
	mov	x19, x0
	b	.L137
.L228:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 26
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC0
	mov	x19, x0
	add	x1, x1, :lo12:.LC0
.LEHB15:
	bl	_ZNSt16invalid_argumentC1EPKc
.LEHE15:
	adrp	x2, _ZNSt16invalid_argumentD1Ev
	adrp	x1, _ZTISt16invalid_argument
	mov	x0, x19
	add	x2, x2, :lo12:_ZNSt16invalid_argumentD1Ev
	add	x1, x1, :lo12:_ZTISt16invalid_argument
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -328
	.cfi_offset 21, -336
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -312
	.cfi_offset 23, -320
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -296
	.cfi_offset 25, -304
.LEHB16:
	bl	__cxa_throw
.L162:
	.cfi_restore_state
	mov	x1, x0
	mov	x0, x19
	mov	x19, x1
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -328
	.cfi_offset 21, -336
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -312
	.cfi_offset 23, -320
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -296
	.cfi_offset 25, -304
	bl	__cxa_free_exception
	mov	x0, x19
	bl	_Unwind_Resume
.LEHE16:
	.cfi_endproc
.LFE7946:
	.global	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA7946:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE7946-.LLSDACSB7946
.LLSDACSB7946:
	.uleb128 .LEHB0-.LFB7946
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB7946
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L163-.LFB7946
	.uleb128 0
	.uleb128 .LEHB2-.LFB7946
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L167-.LFB7946
	.uleb128 0
	.uleb128 .LEHB3-.LFB7946
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L168-.LFB7946
	.uleb128 0
	.uleb128 .LEHB4-.LFB7946
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L169-.LFB7946
	.uleb128 0
	.uleb128 .LEHB5-.LFB7946
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L164-.LFB7946
	.uleb128 0
	.uleb128 .LEHB6-.LFB7946
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L165-.LFB7946
	.uleb128 0
	.uleb128 .LEHB7-.LFB7946
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L170-.LFB7946
	.uleb128 0
	.uleb128 .LEHB8-.LFB7946
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L167-.LFB7946
	.uleb128 0
	.uleb128 .LEHB9-.LFB7946
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB10-.LFB7946
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L163-.LFB7946
	.uleb128 0
	.uleb128 .LEHB11-.LFB7946
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L168-.LFB7946
	.uleb128 0
	.uleb128 .LEHB12-.LFB7946
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L167-.LFB7946
	.uleb128 0
	.uleb128 .LEHB13-.LFB7946
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L164-.LFB7946
	.uleb128 0
	.uleb128 .LEHB14-.LFB7946
	.uleb128 .LEHE14-.LEHB14
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB15-.LFB7946
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L162-.LFB7946
	.uleb128 0
	.uleb128 .LEHB16-.LFB7946
	.uleb128 .LEHE16-.LEHB16
	.uleb128 0
	.uleb128 0
.LLSDACSE7946:
	.text
	.size	_Z13to_bidiagonalRK6MatrixRS_S2_, .-_Z13to_bidiagonalRK6MatrixRS_S2_
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.type	_GLOBAL__sub_I__Z13to_bidiagonalRK6MatrixRS_S2_, %function
_GLOBAL__sub_I__Z13to_bidiagonalRK6MatrixRS_S2_:
.LFB8669:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	adrp	x19, .LANCHOR0
	add	x19, x19, :lo12:.LANCHOR0
	mov	x0, x19
	bl	_ZNSt8ios_base4InitC1Ev
	mov	x1, x19
	adrp	x2, __dso_handle
	ldr	x19, [sp, 16]
	add	x2, x2, :lo12:__dso_handle
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	adrp	x0, _ZNSt8ios_base4InitD1Ev
	add	x0, x0, :lo12:_ZNSt8ios_base4InitD1Ev
	b	__cxa_atexit
	.cfi_endproc
.LFE8669:
	.size	_GLOBAL__sub_I__Z13to_bidiagonalRK6MatrixRS_S2_, .-_GLOBAL__sub_I__Z13to_bidiagonalRK6MatrixRS_S2_
	.section	.init_array,"aw"
	.align	3
	.xword	_GLOBAL__sub_I__Z13to_bidiagonalRK6MatrixRS_S2_
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC2:
	.word	-2036257893
	.word	1023837339
	.align	3
.LC3:
	.word	-1102028775
	.word	975155446
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZStL8__ioinit, %object
	.size	_ZStL8__ioinit, 1
_ZStL8__ioinit:
	.zero	1
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align	3
	.type	DW.ref.__gxx_personality_v0, %object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.xword	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 10.3.1"
	.section	.note.GNU-stack,"",@progbits

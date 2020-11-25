.text
.global F3EX6
.type F3EX6, "function"

F3EX6:

	//A)
	mov x12, #0b101010101010
	mov x11, #0
	mov x10, #0

	lsl x10, x12, #8
	bfi x11, x12, #8, #55


	//B)
	mov x12, #0b101010101010
	mov x9, #0
	mov x8, #0
	mov x7, #0

	asr x9, x12, #8
	sbfm x8, x12, #8, #55
	ubfx x7, x12, #8, #55


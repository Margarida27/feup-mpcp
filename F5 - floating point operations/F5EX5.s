.text
.global F5EX5
.type F5EX5, "function"
// (float *X, float *Y, int n)

F5EX5:
	mov w5, #0
	scvtf d5, w5

loop:
	cbz w2, end
	ldr s0, [x0], #4
	ldr s1, [x1], #4
	fcvt d3, s0
	fcvt d4, s1
	fmadd d5, d3, d4, d5
	sub w2, w2, #1

end:
	fmov d0, d5
	ret


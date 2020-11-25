.text
.global F6EX6
.type F6EX6, "function"
// (double *v, long int size)

F6EX6:
	mov x3, #0
	scvtf d3, x3

loop:
	cbz x1, end
	ldr q0, [x0], #16
	fmul v1.2d, v0.2d, v0.2d
	faddp d2, v1.2d
	fadd d3, d3, d2
	sub x1, x1, #2
	b loop

end:
	fsqrt d0, d3
	ret

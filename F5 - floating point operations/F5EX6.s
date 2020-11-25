.text
.global F5EX6
.type F5EX6, "function"
// F5EX6(float *V, long int n, float a, float b)

F5EX6:
	mov x9, #0

loop:
	cbz x1, end
	ldr s9, [x0]
	fcmp s9, s0
	b.lt jump
	fcmp s9, s1
	b.gt jump
	add x9, x9, #1

jump:
	add x0, x0, #4
	sub x1, x1, #1
	b loop

end:
	mov x0, x9
	ret

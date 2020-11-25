.text
.global F6EX2
.type F6EX2, "function"
// (int *vec1, int *vec2, int size)

F6EX2:
	eor x4, x4, x4

loop:
	cbz x2, end
	ldr q0, [x0], #16
	ldr q1, [x1], #16
	mul v2.4s, v0.4s, v1.4s
	addv s3, v2.4s
	smov x3, v3.s[0]
	add x4, x4, x3
	sub x2, x2, #4
	b loop

end:
	mov x0, x4
	ret

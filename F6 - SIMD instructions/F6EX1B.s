.text
.global F6EX1B
.type F6EX1B, "function"
// (float *vec, int size, float k)

F6EX1B:
	cbz x1, end
	ldr q1, [x0]     // q0 já está ocupado pelo escalar
	fmul v1.4s, v1.4s, v0.s[0]
	str q1, [x0]
	add x0, x0, #16
	sub x1, x1, #4
	b F6EX1B

end:
	ret

.text
.global F6EX1A
.type F6EX1A, "function"
// (float *P, float *Q, float *R, int n)

F6EX1A:
	lsr w3, w3, #2

loop:
	cbz w3, end
	ldr q0, [x0]                // carrega 4 números do vector P
	ldr q1, [x1]
	ldr q2, [x2]
	fadd v2.4s, v1.4s, v0.4s
	str q2, [x2]
	add x0, x0, #16             // avança 4 posições do vetor P
	add x1, x1, #16
	add x2, x2, #16
	sub w3, w3, #1
	b loop

end:
	ret



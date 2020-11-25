.text
.global F3EX3B
.type F3EX3B, "function"

//EX 3 B)

F3EX3B:
	eor x8, x8, x8

ciclo:
	ldrb w3, [x0]
	cbz w3, fim
	cmp w3, w1
	b.ne prox
	add x8, x8, #1

prox:
	add x0, x0, #1
	b ciclo

fim:
	mov x0, x8

ret

.text
.global F3EX1B
.type F3EX1B, "function"

F3EX1B:
	eor w4, w4, w4

ciclo:
	cbz x1, fim
	ldr w3, [x0]
	sub x1, x1, 1
	add w4, w4, w3
	add x0, x0, #8
	b ciclo

fim:
	mov w0, w4

ret

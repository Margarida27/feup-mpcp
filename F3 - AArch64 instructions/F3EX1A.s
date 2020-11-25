.text
.global F3EX1A
.type F3EX1A, "function"

F3EX1A:
	eor w4, w4, w4

ciclo:
	cbz x1, fim
	ldr w3, [x0]
	sub x1, x1, #1
	add w4, w4, w3
	add x0, x0, #4
	b ciclo

fim: mov w0, w4

ret

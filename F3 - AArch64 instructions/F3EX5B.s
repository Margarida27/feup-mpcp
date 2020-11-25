.text
.global F3EX5B
.type F3EX5B, "function"

F3EX5B:
	mov x2, #4
	mov x9, #1
	add x1, x0, #7

ciclo:
	cbz x9, fim
	cbz x2, fim
	ldrb w7, [x0]
	ldrb w8, [x1]
	cmp w7, w8
	cset w9, eq
	add x0, x0, #1
	sub x1, x1, #1
	sub x2, x2, #1
	b ciclo

fim: mov w0, w9

ret

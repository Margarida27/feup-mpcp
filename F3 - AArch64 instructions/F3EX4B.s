.text
.global F3EX4B
.type F3EX4B, "function"

F3EX4B:
	cbz x2, fim
	ldrsw x8, [x0]
	str x8, [x1]
	sub x2, x2, #1
	add x0, x0, #4
	b F3EX4B

fim:

ret

.text
.global F2EX3D
.type F2EX3D, "function"

F2EX3D:
	mov x7, #0

loop:
	cbz x1, fim
	ldrsw x2, [x0]
	and x3, x2, #1
	cbnz x3, impar
	add x7, x7, #1

impar:
	add x0, x0, #4
	sub x1, x1, #1
	b loop

fim:
	mov x0, x7
	ret

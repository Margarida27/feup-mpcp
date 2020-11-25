.text
.global F3EX7D
.type F3EX7D, "function"
// extern int F3EX7D(int *v1, int *v2, int dim);

F3EX7D:
	mov x7, #0

loop:
	cbz x2, fim
	ldr x3, [x0]
	ldr x4, [x1]
	smaddl x7, w3, w4, x7
	add x0, x0, #4
	add x1, x1, #4
	sub x2, x2, #1
	b loop

fim:
	mov x0, x7
	ret

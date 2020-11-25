.text
.global F3EX7E
.type F3EX7E, "function"
// extern int F3EX7E(int *v1, int *v2, int dim);

F3EX7E:
	mov x6, #0

loop:
	cbz x2, fim
	ldr w3, [x0]
	ldr w4, [x1]
	madd w6, w3, w4, w6
	cls x7, x6
	cmp x7, #31
	b.eq overflow
	clz x7, x6
	cmp x7, #31
	b.eq overflow
	add x0, x0, #4
	add x1, x1, #4
	sub x2, x2, #1
	b loop;

overflow:
	mov w0, #-1
	lsr w0, w0, #1
	ret


fim:
	mov x0, x7
	ret

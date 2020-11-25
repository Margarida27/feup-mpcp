.text
.global F3EX5A
.type F3EX5A, "function"

F3EX5A:
	clz x1, x0 //counts leading zero bits and saves the result in x1
	mov x2, #63
	sub x0, x2, x1
	ret

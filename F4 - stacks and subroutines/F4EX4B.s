.text
.global F4EX4B
.type F4EX4B, "function"
// char string[] = "[e(){(abc)}]";

F4EX4B:
	mov x1, x0
	mov x0, #1

loop:
	ldrb w8, [x1], #1
	cbz w8, end

	cmp w8, '['
	b.eq stack
	cmp w8, '('
	b.eq stack
	cmp w8, '{'
	b.eq stack

	cmp w8, ']'
	b.eq reto
	cmp w8, ')'
	b.eq curvo
	cmp w8, '}'
	b.eq chaveta

	b loop

stack:
	str w8, [sp, #-16]!
	b loop

reto:
	ldrb w9, [sp], #16
	cmp w9, '['
	b.eq loop
	b notPaired

curvo:
	ldrb w9, [sp], #16
	cmp w9, '('
	b.eq loop
	b notPaired

chaveta:
	ldrb w9, [sp], #16
	cmp w9, '{'
	b.eq loop
	b notPaired

notPaired:
	mov x0, #0
end:
ret

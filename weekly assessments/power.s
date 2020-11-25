.text
.global power
.type power, %function
// (int base, int exp)

power:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cbz w1, expoent0            // se o expoente for 0, a sub-rotina retorna de imediato o resultado 1
	sub w1, w1, #1

loop:
	cbz w1, end
	smull x0, w0, w0
	b overflow
	sub w1, w1, #1
	b loop

overflow:
	cls x15, x0
	cmp x15, #32
	b.ge loop
	mov w0, #0
	b end

expoent0:
	mov w0, #1
	b end

end:
	ldp x20, x30, [sp], #16
	ret

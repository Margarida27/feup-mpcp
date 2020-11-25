.data
min: .double 100000.0000000000
.text
.global eStep
.type eStep, "function"
/*
extern void eStep(unsigned int N, float *seq_P , unsigned int M, double *seq_C, unsigned int *seq_Out);
w0 - tamanho N da seq_P (N>=0)
x1 - pointer para seq_P
w2 - tamanho M da seq_C (M>0)
x3 - pointer para seq_C
x4 - pointer para seq_Out
*/

eStep:
	mov w9, #0               // guarda o �ndice do ponto da seq_C mais pr�ximo de cada ponto da seq_P

loop:
	cbz w0, end
	mov w11, #0              // guarda o �ndice atual da seq_C e a cada itera��o, o �ndice da seq_C retoma o valor inicial 0
	mov x5, x3               // permite recuperar o endere�o de x5 inicial
	mov w10, w2              // permite recuperar o n�mero de elementos da seq_C
	ldr d15, min             // rep�e o valor a ser comparado com a dist�ncia para um valor elevado

	ldr s9, [x1], #4
	ldr s10, [x1], #4
	fcvt d9, s9              // d9 -> Xp
	fcvt d10, s10            // d10 -> Yp
	b distance

distance:
	cbz w10, save

	ldr d11, [x5], #8        // d11 -> Xc
	ldr d12, [x5], #8        // d12 -> Yc

	fsub d11, d11, d9        // Xc - Xp
	fmul d11, d11, d11       // (Xc - Xp)^2
	fsub d12, d12, d10       // Yc - Yp
	fmul d12, d12, d12       // (Yc - Yp)^2
	fadd d13, d11, d12       // (Xc - Xp)^2 + (Yc - Yp)^2
	fsqrt d13, d13           // sqrt((Xc - Xp)^2 + (Yc - Yp)^2) -> f�rmula da dist�ncia

	fcmp d13, d15
	b.ge next                // se a dist�ncia calculada for >= � dist�ncia menor, avan�a na seq_C
	fmov d15, d13            // se for < do que a dist�ncia menor, ent�o passa esse valor a ser dist�ncia menor
	mov w9, w11              // guarda em w9 o �ndice atual

next:
	add w11, w11, #1
	sub w10, w10, #1
	b distance

save:
	str w9, [x4], #4
	sub w0, w0, #1
	b loop

end:
	ret







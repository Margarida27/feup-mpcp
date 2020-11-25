.data
fact2: .double 0.500000000000000000000
fact4: .double 0.041666666666666666666
fact6: .double 0.001388888888888888888
fact8: .double 0.000024801587301587302
fact10: .double 0.00000027557319223986
.text
.global F5EX9A
.type F5EX9A, "function"
// F5EX9A(double x)

F5EX9A:
	stp x29, x30, [sp, #-16]!
	mov x29, sp

	mov x0, #1
	scvtf d9, x0
	ldr d10, fact2
	ldr d11, fact4
	ldr d12, fact6
	ldr d13, fact8
	ldr d14, fact10


	fnmul d0, d0, d0           //-x^2
	fmadd d15, d0, d14, d13
	fmadd d15, d0, d15, d12
	fmadd d15, d0, d15, d11
	fmadd d15, d0, d15, d10
	fmadd d15, d0, d15, d9
	fmov d0, d15

	ldp x29, x30, [sp], #16
	ret



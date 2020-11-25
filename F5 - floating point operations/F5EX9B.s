.data
fact2: .double 0.500000000000000000000
fact4: .double 0.041666666666666666666
fact6: .double 0.001388888888888888888
fact8: .double 0.000024801587301587302
fact10: .double 0.00000027557319223986
const50: .double 50.00000000000000000000
const100: .double 100.00000000000000000000
pi: .double 3.14159265358979323846
graus180: .double 180.00000000000000000000

.text
.global F5EX9B
.type F5EX9B, "function"

F5EX9B:
	stp x29, x30, [sp, #-16]!
	ucvtf d0, x0
	ldr d1, pi
	ldr d2, graus180
	fmul d0, d0, d1
	fdiv d0, d0, d2
	bl F5EX9A
	ldr d1, const50
	ldr d2, const100
	fmadd d0, d0, d1, d2
	ldp x29, x30, [sp], #16
	ret

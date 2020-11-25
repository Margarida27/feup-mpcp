.data
pi: .double 3.141592653
.text
.global F5EX2B
.type F5EX2B, "function"

F5EX2B:
	fmul d0, d0, d0
	ldr d1, pi
	fmul d0, d1, d0
	ret

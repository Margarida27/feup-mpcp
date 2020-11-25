.text
.global F5EX2A
.type F5EX2A, "function"
// A-s0, B-s1, C-s2, D-s3

F5EX2A:
	fsub s1, s0, s1     // A-B
	fmul s1, s1, s2     // (A-B)*C
	fadd s0, s0, s3     // D+A
	mov w0, #3
	scvtf s4, w0
	fsub s0, s0, s4     // D+A-3
	fdiv s0, s1, s0     // ((A-B)*C)/(D+A-3)
	ret

.text
.global F6EX4
.type F6EX4, "function"
// (int *z, int size, int escalar)

F6EX4:
	dup v2.4s, w2

loop:
	cbz w1, end
	ldr q0, [x0]
	sqadd v0.4s, v0.4s, v2.4s
	str q0, [x0], #16
	sub w1, w1, #4
	b loop

end:
	ret

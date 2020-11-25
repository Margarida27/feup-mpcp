.text
.global F3EX5C
.type F3EX5C, "function"

F3EX5C:
	rbit w1, w0 //saves in w1 the result of reverting the bits order of w0
	cmp w1, w0
	cset x0, eq //if (eq) x0 = 1 else x0 = 0
	ret

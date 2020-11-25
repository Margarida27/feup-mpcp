.text
.global fourxintab
.type fourxintab, "function"

// fourxintab(int *vec, int tamv, int a, int b)

fourxintab:
	mov x4, #0 // counter

loop:
	cbz x1, fim // checks if all the values were tested
	ldr x5, [x0]

	add x0, x0, #4 // next position of the vector
	sub x1, x1, #1

	lsl w6, w5, #2 // multiplies value by 4

	cmp w6, w2
	b.lo loop // if the value*4 is lower than the lower limit

	cmp w6, w3
	b.hi loop // if the value*4 is higher than the upper limit

	add x4, x4, #1 // if the value*4 is in the interval [lower limit, upper limit], the counter is incremented

	b loop

fim:
	mov x0, x4
	ret


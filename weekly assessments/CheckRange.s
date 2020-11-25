.text
.global CheckRange
.type CheckRange, "function"
//int CheckRange(int lim, int tam, int *seq);

CheckRange:
	mov x5, #0; // counter
	cmp w0, #0;
	cneg w3, w0, gt; // lower limit

Loop:
	cbz x1, Fim;
	ldr w4, [x2];
	cmp w4, w0;
	b.gt ToUpper; // if the value is greater than the upper limit
	cmp w4, w3;
	b.lt ToLower; // if the value is less than the upper limit
	b Jump;

ToUpper:
	str w0, [x2];
	add x5, x5, #1;
	b Jump;

ToLower:
	str w3, [x2];
	add x5, x5, #1;

Jump:
	add x2, x2, #4;
	sub x1, x1, 1;
	b Loop;

Fim:
	mov x0, x5;
	ret

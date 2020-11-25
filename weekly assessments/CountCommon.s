.text
.global CountCommon
.type CountCommon, "function"
// extern unsigned int CountCommon(unsigned int N, int *seqA, unsigned int M, int *seqB);


CountCommon:
	mov w10, #0          // initializes counter
	cmp w2, #0
	b.eq End             // if seqB is empty, there's no need to do any comparisons

Loop:
	cbz w0, End          // checks if every element of seqA has been checked
	ldr w4, [x1]         // w4 - current value of seqA
    mov w7, w2           // this will preserve the value of w2

CheckCommon:
	cbz w7, Next         // checks if the current value of seqA has been compared with every element of seqB
	ldr w5, [x3]         // w5 - current value of seqB to be compared with w4
	cmp w4, w5
	b.ne NotCommon
	add w10, w10, #1     // increments counter if the current element of seqA belongs to seqB
	b Next               // since the elements of seqB are all different, once it matches, the next element can be compared

NotCommon:
	add x3, x3, #4
	sub w7, w7, #1
	b CheckCommon

Next:                     // if the end of seqB was reached
	add x1, x1, #4        // next position of seqA
	sub w0, w0, #1

StartAgainB:              // it is necessary to go back to the first position of seqB
	cmp  w7, w2
	b.eq Loop             // already on first position of seqB and ready to check the next element of seqA
	sub x3, x3, #4        // goes back one position at a time
	add w7, w7, #1
	b StartAgainB

End:
	mov w0, w10;
	ret

.text
.global F5EX1B
.type F5EX1B, "function"

/*
int W = 7; double X = 7.1;
double Y = sqrt (X) + W;
(w0 = (int)W, d0 = X, d1 = (double)W)
*/

F5EX1B:
	fsqrt d0, d0
	scvtf d1, w0
	fadd d0, d0, d1
	ret

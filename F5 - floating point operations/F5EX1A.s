.text
.global F5EX1A
.type F5EX1A, "function"

/*
double B = 7.8 , M = 3.6 , N = 7.1;
double P = -M * (N+B);
(d0 = B, d1 = M, d2 = N)
*/

F5EX1A:
	 fadd d0, d0, d2
	 fneg d1, d1
	 fmul d0, d1, d0
	 ret

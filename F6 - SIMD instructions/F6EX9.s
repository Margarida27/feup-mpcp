.text
.global F6EX9
.type F6EX9, "function"
// F6EX9(float *Z1, float *Z2, float *Z, long int size)

F6EX9:
	mov x9, #0; scvtf s5, x9      // s5 = 0
	mov x9, #1; scvtf s6, x9      // s6 = 1
	mov x9, #-1; scvtf s7, x9     // s7 = -1

	ins v9.4s[0], v7.4s[0]
	ins v9.4s[1], v6.4s[0]
	ins v9.4s[2], v7.4s[0]
	ins v9.4s[3], v6.4s[0]        // v9 = { -1, 1, -1, 1 } (auxiliar vector)

	ins v10.4s[0], v6.4s[0]
	ins v10.4s[1], v5.4s[0]
	ins v10.4s[2], v6.4s[0]
	ins v10.4s[3], v5.4s[0]       // v10 = { 1, 0, 1, 0 }  (auxiliar vector)

	rev64 v11.4s, v10.4s          // v11 = { 0, 1, 0, 1 }  (auxiliar vector)

product:
	cbz x3, end

	ldr q0, [x0], #16             // v0 = { a1, b1, a2, b2 }
	ldr q1, [x1], #16             // v1 = { c1, d1, c2, d2 }

	fmul v19.4s, v0.4s, v1.4s     // v19 = { a1.c1, b1.d1, a2.c2, b2.d2 }
	rev64 v20.4s, v19.4s          // v20 = { b1.d1, a1.c1, b2.d2, a2.c2 }
	fmul v20.4s, v20.4s, v9.4s    // v20 = { -b1.d1, a1.c1, -b2.d2, a2.c2 }
	fadd v21.4s, v19.4s, v20.4s   // v21 = { a1.c1 - b1.d1, b1.d1 + a1.c1, a2.c2 - b2.d2, b2.d2 + a2.c2 }
	fmul v21.4s, v21.4s, v10.4s   // v21 = { a1.c1 - b1.d1, 0, a2.c2 - b2.d2, 0 }

	rev64 v1.4s, v1.4s            // v1 = { d1, c1, d2, c2 }
	fmul v22.4s, v0.4s, v1.4s     // v22 = { a1.d1, b1.c1, a2.d2, b2.c2 }
	rev64 v23.4s, v22.4s          // v23 = { b1.c1, a1.d1, b2.c2, a2.d2 }
	fadd v24.4s, v22.4s, v23.4s   // v24 = { a1.d1 + b1.c1, b1.c1 + a1.d1, a2.d2 + b2.c2, b2.c2 + a2.d2 }
	fmul v24.4s, v24.4s, v11.4s   // v24 = { 0, b1.c1 + a1.d1, 0, b2.c2 + a2.d2 }

	fadd v25.4s, v21.4s, v24.4s   // v25 = { a1.c1 - b1.d1, a1.d1 + b1.c1, a2.c2 - b2.d2, a2.d2 + b2.c2 }
	str q25, [x2], #16
	sub x3, x3, #2
	b product

end:
	ret



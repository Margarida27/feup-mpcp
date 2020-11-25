.text
.global F4EX4A
.type F4EX4A, "function"

F4EX4A:
	eor x8, x8, x8
	mov x10, x0           // c�pia do endere�o base da cadeia de caracteres

L1:
	ldrb w3, [x0]         // carrega o caracter para w3 (byte)
	cbz w3, L2            // verifica se = \0 (fim da cadeia de caracteres)
	str w3, [sp, #-16]!   // atualiza o endere�o de sp (pr� indexa��o) e armazena o caracter na pilha
	add x8, x8, #1
	add x0, x0, #1        // pr�ximo caracter
	b L1                  // repete at� encontrar o caracter terminador (\0)

L2:
	cbz x8, End           // verifica se todos os caracteres j� foram reescritos
	ldr w3, [sp], #16     // carrega para w3 o caracter do endere�o da pilha apontado pelo sp e,
						  // posteriormente, atualiza o endere�o do sp (p�s indexa��o)
	strb w3, [x10]        // armazena o caracter em x10
	                      // x10 contem, inicialmente, o endere�o base de x0 (cadeia de caracteres original)
	                      // � isto que permite que os caracteres sejam reescritos
	sub x8, x8, #1
	add x10, x10, #1
	b L2

End:
ret

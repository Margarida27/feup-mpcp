.text
.global F4EX4A
.type F4EX4A, "function"

F4EX4A:
	eor x8, x8, x8
	mov x10, x0           // cópia do endereço base da cadeia de caracteres

L1:
	ldrb w3, [x0]         // carrega o caracter para w3 (byte)
	cbz w3, L2            // verifica se = \0 (fim da cadeia de caracteres)
	str w3, [sp, #-16]!   // atualiza o endereço de sp (pré indexação) e armazena o caracter na pilha
	add x8, x8, #1
	add x0, x0, #1        // próximo caracter
	b L1                  // repete até encontrar o caracter terminador (\0)

L2:
	cbz x8, End           // verifica se todos os caracteres já foram reescritos
	ldr w3, [sp], #16     // carrega para w3 o caracter do endereço da pilha apontado pelo sp e,
						  // posteriormente, atualiza o endereço do sp (pós indexação)
	strb w3, [x10]        // armazena o caracter em x10
	                      // x10 contem, inicialmente, o endereço base de x0 (cadeia de caracteres original)
	                      // é isto que permite que os caracteres sejam reescritos
	sub x8, x8, #1
	add x10, x10, #1
	b L2

End:
ret

.text
.global F6EX3
.type F6EX3, "function"
//(char *v, long int size, char val)

F6EX3:
	dup v1.16b, w2 // preenche todos os bytes de q1 com o caracter a ser testado

	ldr q0, [x0], #16 // carrega q0 quando os caracteres da string

	cmeq v2.16b, v1.16b, v0.16b // compara cada caracter da string com o caracter a ser testado e guarda o resultado em q2

	addv b3, v2.16b // soma o resultado da comparação e coloca no byte de índice 0, b3, de q3

	smov x3, v3.b[0] // move o resultado de b3 para um registo que possa ser manipulado, neste caso x3 (long int)

	neg x3, x3 // quando a comparação é verdadeira, o valor -1 é guardado na respetiva posição em q2, ou seja, o resultado é negativo

	mov x0, x3

	ret


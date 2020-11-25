.text
.global Calculator
.type Calculator, "function"
// (unsigned int N, char *seq_OP, int *seq_B, int *seq_A)

// todos os valores usados pela caller (rotina calculator) foram movidos para os registos x19-x28
// porque s�o os que, de certeza, mant�m o seu valor quando a callee (sub-rotina power) � invocada

Calculator:
	mov x19, x3                // x19 - endere�o da sequ�ncia A
	mov x20, x2                // x20 - endere�o da sequ�ncia B
	mov x21, x1                // x21 - endere�o da sequ�ncia OP
	mov x22, x0                // x22 - n�mero de elementos das sequ�ncias A e B
	mov w23, #0                // w23 - guarda a posi��o (1-N) para retornar no caso de ocorrer overflow

Loop:
	cbz w22, EndNoOverflow      // se chegou ao fim das sequ�ncias com sucesso, significa que n�o ocorreu overflow
	add w23, w23, #1

	ldr w24, [x19]              // w24 - valor de A
	ldr w25, [x20]              // W25 - valor de B
	ldrb w26, [x21], #1         // w26 - opera��o a realizar
                                // w27 - resultado
	cmp w26, '+'
	b.eq Add
	cmp w26, '-'
	b.eq Sub
	cmp w26, '*'
	b.eq Mult
	cmp w26, 'P'
	b.eq Power

Add:                           // opera��o de soma: w27 = w24 + w25
	adds w27, w24, w25         // adds atualiza as flags, o que permite verificar se ocorreu overflow
	b.vs EndOverflow           // vs - overflow (flag v = 1)
	b UpdateValues

Sub:                           // opera��o de subtra��o: w27 = w24 - w25
	subs w27, w24, w25         // subs atualiza as flags, o que permite verificar se ocorreu overflow
	b.vs EndOverflow           // vs - overflow (flag v = 1)
	b UpdateValues

Mult:                          // opera��o de multiplica��o: w27 = w24 * w25
	smull x27, w24, w25
	cls x28, x27
	cmp x28, #32
	b.lt EndOverflow
	b UpdateValues

Power:                         // opera��o de pot�ncia: w27 = w24 ^ w25
	mov w0, w24                // base da pot�ncia
	mov w1, w25                // expoente da pot�ncia
	stp x29, x30, [sp, #-16]!  // fp e lr s�o guardados na pilha
	mov x29, sp
	bl power                   // os argumentos da sub-rotina power t�m que estar guardados nos registos w0 e w1 (ints)
	ldp x29, x30, [sp], #16
	mov w27, w0                // a verifica��o da ocorr�ncia de overflow j� � assegurada pela sub-rotina power
	cbz w27, EndOverflow       // no caso de ter ocorrido overflow na opera��o de pot�ncia, a sub-rotina retorna o valor 0
	b UpdateValues

UpdateValues:
	str w27, [x19]             // o resultado da opera��o � guardado na posi��o correspondente da sequ�ncia A
	add x19, x19, #4           // pr�xima posi��o da sequ�ncia A
	add x20, x20, #4           // pr�xima posi��o da sequ�ncia B
	sub x22, x22, #1
	b Loop

EndNoOverflow:                 // no caso de n�o ocorrer overflow
	mov w0, #0
	ret

EndOverflow:                   // no caso de ocorrer overflow
	mov w0, w23                // retorna a posi��o na qual ocorreu overflow
	ret


